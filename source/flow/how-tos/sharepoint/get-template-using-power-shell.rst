How to get a PnP provisioning template using PowerShell and then apply it in Microsoft Flow
============================================================================================================================

This article will show how to create a PnP template via PowerShell. As a result we'll have an XML file 
which can be used with Plumsail SharePoint connector `Provision PnP template to SharePoint`_ .

Connecting to the Sharepoint instance
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
First of all you need to install SharePoint PnP library of PowerShell commands.
Microsoft provides 3 ways to install the cmdlets and you can find them in the `official MS article`_ .

The fastest way to do this is to run the command in MS PowerShell console

:code:`Install-Module SharePointPnPPowerShellOnline`

To make sure that all installed correctly and also to check the installed version you can run the command:

:code:`Get-Command -Module *PnP*`


After installing the cmdlets connect to your SharePoint site:

:code:`Connect-PnPOnline -Url https://mycompany.sharepoint.com/sites/mysite`

or in case of multi-factor authentication use

:code:`Connect-PnPOnline -Url https://mycompany.sharepoint.com/sites/mysite -UseWebLogin`

Getting PnP template by Powershell
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Let's say you need to create a site with certain parameters when some event happens.
For example, you can keep a template site and deploy it for a new employee when he or she is hired.
The template already has some default settings and the employee just need to tweak it a bit.

|sourcesite|

Once connected we use next command to take a template from the whole site

:code:`Get-PnPProvisioningTemplate -Out path`

For example, :code:`Get-PnPProvisioningTemplate -Out C:\Temp\Template.xml`

This command creates an xml file which has the whole structure of the Sharepoint site, without content. 
If you want to store result template in different location, replace “C:\Temp\template.xml” by different path.

Now we need to deploy the template. We can use the resulting xml file in MS flow and select it in `Provision PnP template to SharePoint`_ .

|flow|

Also Plumsail action accepts PnP code. If you have a PnP code, or you modified an existing one and would like to try it you can place the code directly to our action.
Check it out.

|flow1|

Conclusion
----------

Using PnP provisioning technology and Plumsail Actions connector allows you to flexibly take and deploy a Sharepoint site template.
I also recommend you take alook at another article `How to create SharePoint list from PnP provisioning template in Microsoft Flow`_.
If you haven’t used it yet, `registering an account`_ would be the first step. It is quite easy to get started.




.. _Plumsail SharePoint connector: https://plumsail.com/actions/sharepoint/
.. _official MS article: https://docs.microsoft.com/en-us/powershell/sharepoint/sharepoint-pnp/sharepoint-pnp-cmdlets?view=sharepoint-ps#installation
.. _official MIcrosoft documentation: https://docs.microsoft.com/en-us/powershell/module/sharepoint-pnp/add-pnpapp?view=sharepoint-ps
.. _other PnP functions: https://docs.microsoft.com/en-us/powershell/module/sharepoint-pnp/add-pnpdatarowstoprovisioningtemplate?view=sharepoint-ps
.. _Provision PnP template to SharePoint: ../../actions/sharepoint-processing.html#provision-pnp-template-to-sharepoint
.. _manually: ../../actions/sharepoint-processing.rst#provision-pnp-template-to-sharepoint
.. _registering an account: ../../../getting-started/sign-up.html
.. _How to create SharePoint list from PnP provisioning template in Microsoft Flow: ../../flow/how-tos/sharepoint/provision-list-library-using-pnp.html

.. |flow| image:: ../../../_static/img/flow/sharepoint/provision-pnp-template-to-sp.png
.. |flow1| image:: ../../../_static/img/flow/sharepoint/PnPProvisionExample.png
.. |sourcesite| image:: ../../../_static/img/flow/sharepoint/pnp-source-site-example.png
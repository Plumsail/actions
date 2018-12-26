How to get a PnP template using PowerShell and then apply in MS Flow
============================================================================================================================

This article will show how to create a PnP template via power shell. As a result we'll have an XML file 
which can be used with Plumsail SharePoint connector `Provision PnP template to SharePoint`_ .

Create a SharePoint list with custom columns
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

First of all you need to connect to the source site using this command

Connect-PnPOnline -Url https://mycompany.sharepoint.com/sites/mysite

There are 2 available commands to get a template:

Get-PnPProvisioningTemplate and Get-PnPProvisioningTemplateFromGallery

First one creates a provisioning site template, including all data and all settings.
Second - gets template from existing templates and searches the galery.

You can find more information about the commands and available options in `oficial MIcrosoft documentation`_ .

We'll use first command

Get-PnPProvisioningTemplate -Out path

You can also modify already created provisioning template using `other PnP functions`_.

After that n we can get the file in MS flow and select it in `Provision PnP template to SharePoint`_ .

|flow|

Conclusion
----------

PowerShell PnP provides many usefull function to create and modify PnP provisioning templates. 
However, you can also create a PnP template `manually`_ and insert PnP code directly into Plumsail `Provision PnP template to SharePoint`_


.. _Plumsail SharePoint connector: https://plumsail.com/actions/sharepoint/
.. _oficial MIcrosoft documentation: https://plumsail.com/actions/sharepoint/
.. _other PnP functions: https://docs.microsoft.com/en-us/powershell/module/sharepoint-pnp/add-pnpdatarowstoprovisioningtemplate?view=sharepoint-ps
.. _Provision PnP template to SharePoint: ../../actions/sharepoint-processing.html#provision-pnp-template-to-sharepoint
.. _manually: ../../actions/sharepoint-processing.rst#provision-pnp-template-to-sharepoint
.. _registering an account: ../../../getting-started/sign-up.html

.. |flow| image:: ../../../_static/img/flow/sharepoint/provision-pnp-template-to-sp.png
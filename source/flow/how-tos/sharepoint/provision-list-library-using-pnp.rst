How to create SharePoint list from PnP provisioning template in Microsoft Flow
============================================================================================================================

This article will show how to create a PnP provisoning template with a list and then apply the template in Microsoft Flow.
We will use `Provision PnP template to SharePoint  <../../actions/sharepoint-processing.html#provision-pnp-template-to-sharepoint>`_ action from `Plumsail SP connector <https://plumsail.com/actions/sharepoint/>`_, which is a part of `Plumsail Actions <https://plumsail.com/actions>`_.

First of all, to create a PnP provisioning template you need to connect to the source SharePoint instance using PnP powershel commandlets library.
This `article`_ shows how to do this and also how to get a PnP provisioning template from the whole site.

The main function :code:`Get-PnPProvisioningTemplate` has several `options`_, in this case we're interested in option :code:`-Handlers`. This option allows us to specify a Sharepoint object to get template from.
For example, it may be a SharePoint list.

:code:`Get-PnPProvisioningTemplate -Out template.pnp -Handlers Lists`

However, in a real situation we need to save not all existing lists but a specific one. 
The next PowerShell script helps us to reach the goal:

.. code::

$listName = "MyList";
$outputTemplateFileName = "C:\Temp\template.xml";
$template = Get-PnPProvisioningTemplate -OutputInstance -Handlers Lists
$listTemplate = $template.Lists | Where-Object { $_.Title -eq $listName }
$template.Lists.Clear()
$template.Lists.Add($listTemplate)
Save-PnPProvisioningTemplate -InputInstance $template -Out $outputTemplateFileName

Let's take a closer look at the script:

- We define 2 variables with list name and the PnP template path
- Then take a template from the whole site
- Exclude all lists from the initial template and save on the specific list.
- Create new template with only specified list inside.

If you open the resulting xml template you'll see that there is a description of only one list.

Then you may apply the resulting xml using Plumsail SharePoint connector `Provision PnP template to SharePoint`_ .

|flow|

Conclusion
----------

That is it. These few simple steps can help you to manage your company's projects more effectively.

.. hint::
  You may also be interested in `this article <https://plumsail.com/docs/actions/v1.x/flow/how-tos/sharepoint/create-site-by-custom-template-and-grant-permissions.html>`_ explaining how to Create SharePoint site by a custom template and grant permissions in Microsoft Flow and Azure Logic Apps.


.. _Plumsail SharePoint connector: https://plumsail.com/actions/sharepoint/
.. _article: ../../how-tos/sharepoint/get-template-using-power-shell.html
.. _options: https://docs.microsoft.com/en-us/powershell/module/sharepoint-pnp/get-pnpprovisioningtemplate?view=sharepoint-ps

.. |flow| image:: ../../../_static/img/flow/sharepoint/provision-pnp-template-to-sp.png
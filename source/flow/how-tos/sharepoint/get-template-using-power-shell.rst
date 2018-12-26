How to get a PnP template using PowerShell and then apply in MS Flow
============================================================================================================================

This article will show how to create a PnP template via power shell. As a result we'll have an XML file 
which can be used with Plumsail SharePoint connector `Provision PnP template to SharePoint`_ .

Create a SharePoint list with custom columns
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

First of all you need to connect to the source site using this command

Connect-PnPOnline -Url https://mycompany.sharepoint.com/sites/mysite

There are 2 availbel commands to get a template:

Get-PnPProvisioningTemplate and Get-PnPProvisioningTemplateFromGallery

First one creates a provisioning site template, including all data and all settings.
Second - gets template from existing templates and searches the galery.

You can find more information about the commands and available options in `oficial MIcrosoft documentation`_ .

We'll use first command

Get-PnPProvisioningTemplate -Out path

It creates and saves a template in the path. Then we can get the file in MS flow and select it in `Provision PnP template to SharePoint`_ .

|flow|

Conclusion
----------

That is it. These few simple steps can help you to manage your company's projects more effectively.

.. hint::
  You may also be interested in `this article <https://plumsail.com/docs/actions/v1.x/flow/how-tos/sharepoint/create-site-by-custom-template-and-grant-permissions.html>`_ explaining how to Create SharePoint site by a custom template and grant permissions in Microsoft Flow and Azure Logic Apps.


.. _Plumsail SharePoint connector: https://plumsail.com/actions/sharepoint/
.. _oficial MIcrosoft documentation: https://plumsail.com/actions/sharepoint/
.. _Provision PnP template to SharePoint: ../../actions/sharepoint-processing.rst#provision-pnp-template-to-sharepoint
.. _registering an account: ../../../getting-started/sign-up.html

.. |flow| image:: ../../../_static/img/flow/sharepoint/provision-pnp-template-to-sp.png
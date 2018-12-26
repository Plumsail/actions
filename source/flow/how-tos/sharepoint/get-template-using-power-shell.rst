How to get a PnP template using PowerShell and then apply in MS Flow
============================================================================================================================

This article will show how to create a PnP template via power shell. As a result we'll have an XML file 
which can be used in Plumsail action Provision PnP template to SharePoint.

Create a SharePoint list with custom columns
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

First of all you need to connect to the source site using this command

.. code : Connect-PnPOnline -Url https://mycompany.sharepoint.com/sites/mysite

Conclusion
----------

That is it. These few simple steps can help you to manage your company's projects more effectively.

.. hint::
  You may also be interested in `this article <https://plumsail.com/docs/actions/v1.x/flow/how-tos/sharepoint/create-site-by-custom-template-and-grant-permissions.html>`_ explaining how to Create SharePoint site by a custom template and grant permissions in Microsoft Flow and Azure Logic Apps.


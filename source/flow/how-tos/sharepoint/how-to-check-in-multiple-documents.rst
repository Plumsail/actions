How to check-in multiple SharePoint documents in Microsoft Flow and Azure Logic Apps
====================================================================================

This article will show how to check-in multiple documents using Microsoft Flow. 

For example, we have a situation where during a day people work with documents in SharePoint Document library. To work with some document a user takes it to work and mark it as check-out, but at the end of the day, every document should be checked-in back.

For this case, I will use *‘Get files (properties only)‘* from SharePoint Connector for getting properties of documents that need to be checked-in. I will also use `Check In SharePoint Document <../../actions/sharepoint-processing.html#check-in-sharepoint-document>`_ from Plumsail SP connector, which is a part of `Plumsail Actions <https://plumsail.com/actions>`_ for each document that will be found on the first step.

Below you can find an example of the small flow that gets all documents in check-out status and does check-in for each one:

.. image:: ../../../_static/img/flow/how-tos/sharepoint/check-in-multiple-documents.png
   :alt: Check-in Multiple Documents

Manually trigger a flow
------------------------

For this case, I'm using the trigger to manual start of the flow. You can use any other trigger available in Microsoft Flow.

.. _getFilesProperties:

Get files (properties only)
---------------------------

.. image:: ../../../_static/img/flow/how-tos/sharepoint/get-files-preporties-check-in.png
   :alt: Get Files Properties

On this step, I get all documents in check-out status:

*‘Site Address‘* as :code:`https://contoso.sharepoint.com/sites/subSite` - The URL of the site. 

*‘Library Name‘* as :code:`"Documents"` - The name of the source folder.

The action is using `OData filter <http://www.odata.org/documentation/odata-version-3-0/url-conventions/>`_ as a value of *‘Filter Query‘* field. I compare "CheckOutUser" field from document's properties with the null value. If the value of this field is not equal null then that is mean this file has check-out status.

Check In SharePoint Document
-----------------------------

The action `Check In SharePoint Document <../../actions/sharepoint-processing.html#check-in-sharepoint-document>`_ is used in "each" cycle that based on results of :ref:`getFilesProperties` action.

As value for *Document URL‘* I'm using the value of *‘Link to item‘* parameter from *‘Get files (properties only)‘* response:

.. image:: ../../../_static/img/flow/how-tos/sharepoint/check-in-document.png
   :alt: Check-in Document

*‘SharePoint Site URL‘* I specified as :code:`"https://contoso.sharepoint.com/sites/subSite"` - The URL of the site.

*‘Comment‘* as :code:`"Comment"` - The comment to accompany document check in.

Conclusion
----------

That's all! These few simple steps can help ease the work with documents for users.
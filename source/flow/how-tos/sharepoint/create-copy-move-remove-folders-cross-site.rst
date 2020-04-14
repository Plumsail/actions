Create, copy, move and remove SharePoint folders cross-site in Power Automate (Microsoft Flow) and Azure Logic Apps
==================================================================================================

This article will show how to use Power Automate (Microsoft Flow) to create SharePoint folders in two ways, copy, move these folders to another site and remove the source folder after copying.

For example, we consider the following case:

We need to create 2 folders in a document library, then move them to another site.

For the first folder, I will use `Create SharePoint Folder by URL <../../actions/sharepoint-processing.html#create-sharepoint-folder-by-url>`_ for creating the folder and `Move SharePoint Folder from Library <../../actions/sharepoint-processing.html#move-sharepoint-folder-from-library>`_ for moving it to a different site.

For the second folder, I will use `Create SharePoint Folder in List <../../actions/sharepoint-processing.html#create-sharepoint-folder-in-list>`_ for creating it. Then instead of moving it with a single action, I will copy this folder to another site by `Copy SharePoint Folder from Library <../../actions/sharepoint-processing.html#copy-sharepoint-folder-from-library>`_ action and then remove the source folder by `Remove SharePoint Folder by URL <../../actions/sharepoint-processing.html#remove-sharepoint-folder-by-url>`_ action.

All these actions are from Plumsail SP connector, which is a part of `Plumsail Actions <https://plumsail.com/actions>`_.

This article is divided into cases:

- :ref:`createMove`
- :ref:`createCopyRemove`

.. _createMove:

Creating a folder by URL and moving it to another site
------------------------------------------------------
In this case, I created the flow based on *‘Create SharePoint Folder by URL‘* and *‘Move SharePoint Folder from Library‘* actions and configured it to start manually.

You can find more information about specific parameters of the flow actions in `the documentation <https://plumsail.com/docs/actions/v1.x>`_ .

The complete flow is below:
 
.. image:: ../../../_static/img/flow/how-tos/sharepoint/create-folder-by-url-move.png
   :alt: Creating folder by URL and moving it to another site

Manually trigger a flow
~~~~~~~~~~~~~~~~~~~~~~~

For this case, I used the trigger to manually start the flow. You can use any other triggers available in Power Automate (Microsoft Flow).

Create SharePoint Folder by URL
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In this action, I specified the following parameters:

*‘Folder URL‘* as :code:`"https://contoso.sharepoint.com/sites/firstSubSite/Shared%20Documents/FirstFolder"` - The URL of the folder that I want to create. 
For this simple case, I used raw link, but you can get it dynamically based on your logic. The new folder will be created in *‘Shared Documents‘* library and will be called *‘FirstFolder‘*.

.. note:: You can create several folders with a single link. For example, if you specify the value for this field as :code:`"https://contoso.sharepoint.com/sites/firstSubSite/Shared%20Documents/FirstFolder/AnotheFolder"` then the action will create *‘FirstFolder‘* folder inside your destination library and *‘AnotherFolder‘* folder inside *‘FirstFolder‘*.

*‘SharePoint Site URL‘* as :code:`"https://contoso.sharepoint.com/sites/firstSubSite"` - The URL of the site.


Move SharePoint Folder from Library
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For the *‘Source URL‘* parameter I used the value of the *‘Folder URL‘* parameter from *‘Create SharePoint Folder by URL‘* response:

.. image:: ../../../_static/img/flow/how-tos/sharepoint/move-folder-dynamic-content.png
   :alt: Folder Info Dynamic Content

*‘Destination URL‘* is specified as :code:`"https://contoso.sharepoint.com/sites/secondSubSite/Shared%20Documents/"` - The URL of *‘Shared Documents‘* library on *‘secondSubSite‘* site (it is a target site for moving).

.. note:: If *‘Destination URL‘* ends with slash '/' the folder will be placed in the folder or library without name changes. Otherwise, the folder will be renamed.

And finally, *‘SharePoint Site URL‘* is specified as :code:`"https://contoso.sharepoint.com/sites/firstSubSite"` - The URL of the site for the **source** folder.

.. _createCopyRemove:

Creating a folder in a library, copying it to another site and removing the source library
------------------------------------------------------------------------------------------
In this case, I created the flow based on *‘Create SharePoint Folder in List‘*, *‘Copy SharePoint Folder from Library‘* and *‘Remove SharePoint Folder by URL‘* actions and configured it to start manually.

You can find more information about specific parameters of the flow actions in `the documentation <https://plumsail.com/docs/actions/v1.x>`_ .

The complete flow is below. You can find step by step description next to the picture.

.. image:: ../../../_static/img/flow/how-tos/sharepoint/create-folder-in-list-copy-remove.png
   :alt: Creating a folder in a list, copying it to another site and remove the source folder

Manually trigger a flow
~~~~~~~~~~~~~~~~~~~~~~~

For this case, I used the trigger for manually start the flow. You can use any other triggers availalbe in Power Automate (Microsoft Flow).

Create SharePoint Folder in List
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In this action, I specified the following parameters:

*‘Target List‘* as :code:`"Documents"` - The name of the document library where I want to create the folder. 

.. note:: This action is most useful when you do not have the opportunity for getting the full URL of your document library or list because you can specify only the name or partial URL of the library or the list

*‘Folder Path‘* as :code:`"SecondFolder"` - The path for the folder that will be created. It is a simple example with only one folder in the path. You can create several folders if you specify the value for this field, for example as :code:`"SecondFolder/AnotheFolder"`. The action will create *‘SecondFolder‘* folder inside your destination library and *‘AnotherFolder‘* folder inside *‘SecondFolder‘*.

*‘SharePoint Site URL‘* as :code:`"https://contoso.sharepoint.com/sites/firstSubSite"` - The URL of the site.


Copy SharePoint Folder from Library
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

As in the previous case, I used the value of *‘Folder URL‘* parameter from *‘Create SharePoint Folder in List‘* response as the value for *‘Source URL‘*:

.. image:: ../../../_static/img/flow/how-tos/sharepoint/copy-folder-dynamic-content.png
   :alt: Folder Info Dynamic Content

*‘Destination URL‘* is specified as :code:`"https://contoso.sharepoint.com/sites/secondSubSite/Shared%20Documents/"` - The URL of *‘Shared Documents‘* library on *‘secondSubSite‘* site (it is a target site for copying the folder)

**Note:** If *‘Destination URL‘* ends with slash '/' the folder will be placed in the folder or library without name changes. Otherwise, the folder will be renamed.

*‘SharePoint Site URL‘* as :code:`"https://contoso.sharepoint.com/sites/firstSubSite"` - The URL of the site for the **source** folder.

Remove SharePoint Folder by URL
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In this action, I also used the value of *‘Folder URL‘* parameter from *‘Create SharePoint Folder in List‘* response as the value for *‘Source URL‘*:

.. image:: ../../../_static/img/flow/how-tos/sharepoint/remove-folder-dynamic-content.png
   :alt: Folder Info Dynamic Content

*‘SharePoint Site URL‘* as :code:`"https://contoso.sharepoint.com/sites/firstSubSite"` - The URL of the site for the source folder.

.. hint:: You can put your URLs into variables in Power Automate (Microsoft Flow). Then put those variables into actions.
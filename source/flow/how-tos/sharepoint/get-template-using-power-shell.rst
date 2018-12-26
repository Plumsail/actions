How to get a PnP template using PowerShell and then apply in MS Flow
============================================================================================================================

This article will show how to create a PnP template via power shell. As a result we'll have an XML file 
which can be used with Plumsail SharePoint connector `Provision PnP template to SharePoint`_ .

Create a SharePoint list with custom columns
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

First of all you need to connect to the source site using this command

.. code: Connect-PnPOnline -Url https://mycompany.sharepoint.com/sites/mysite

Conclusion
----------

That is it. These few simple steps can help you to manage your company's projects more effectively.

.. hint::
  You may also be interested in `this article <https://plumsail.com/docs/actions/v1.x/flow/how-tos/sharepoint/create-site-by-custom-template-and-grant-permissions.html>`_ explaining how to Create SharePoint site by a custom template and grant permissions in Microsoft Flow and Azure Logic Apps.


.. _Plumsail SharePoint connector: https://plumsail.com/actions/sharepoint/
.. _Provision PnP template to SharePoint: ../../actions/sharepoint-processing.rst#provision-pnp-template-to-sharepoint
.. _registering an account: ../../../getting-started/sign-up.html

.. |flow| image:: ../../../_static/img/flow/sharepoint/get-items-using-CAML-flow.png
.. |flow-trigger| image:: ../../../_static/img/flow/sharepoint/get-items-using-CAML-trigger.png
.. |flow-get-items-using-CAML-action| image:: ../../../_static/img/flow/sharepoint/get-items-using-CAML-action.png
.. |flow-copy-document-action| image:: ../../../_static/img/flow/sharepoint/get-items-using-CAML-copy-document-action.png

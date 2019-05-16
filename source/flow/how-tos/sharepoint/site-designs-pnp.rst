How to start a flow with PnP provision from a site design
===========================================================================================================================================

This article will show how to automatically start a MS flow with PnP provision action from a site design.

Site design allows starting a MS flow where you can deploy PnP provisioning template and add some extra features to your site.
In this article we'll review a case where a site design triggers MS flow which create a modern page using PnP provisioning template.

Creating a PnP provisioning template
---------------------------------------------------------
Our plan is to start a Microsoft flow from site design and deploy a PnP provisioning template.
In the example, we will create a SharePoint Modern page using PnP provision template and for this we need to prepare the PnP template.
This article explains how to create this template using Powershell commands. As a result we will have an XML file;
keep it handy, we'll need it on the next step.


Creating a flow
---------------------------------------------------------
Create a flow from blank and add When an HTTP request is received trigger

.. image:: ../../../_static/img/flow/how-tos/when-http-request.png

HTTP POST URL will be empty until you save the flow; We'll need the URL when creating our site script.

On the next steps we get the created PnP template and place it to Plumsail action.


.. image:: ../../../_static/img/flow/how-tos/apply-modern-page-site-design.png

WebURL value is the created website. We pass the parameter to Plumsail action so it will know where to apply the PnP template.

On the next steps we need to start the Flow automatically once the site is created. 


Creating a site design and site script
---------------------------------------------------------

Site design is a container which includes one or more site scripts. This `Microsoft article <https://docs.microsoft.com/en-us/sharepoint/dev/declarative-customization/site-design-pnp-provisioning#create-the-site-design>`_ explains how to add

site design. When you select the site design it triggers our Microsoft Flow.

Starting MS Flow from site design
---------------------------------------------------------

The last step is when you select the site design it triggers the created flow and deploy the PnP template with modern page.

.. image:: ../../../_static/img/flow/how-tos/site-designs-list.png

That is all! Now you can create Modern SharePoint sites and apply custom templates to them.

.. hint::
  You may also be interested in `this article <create-modern-page-pnp-template.html.html>`_ explaining how to create SharePoint lists or document libraries using PnP template.
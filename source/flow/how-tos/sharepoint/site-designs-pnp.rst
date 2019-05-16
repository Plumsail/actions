How to start a flow with PnP provision from a site design
===========================================================================================================================================

This article will show how to automatically start a MS flow with PnP provision action from a site design.

Site design allows starting a MS flow where you can deploy PnP provisioning template and add some extra features to your site.
In this article we'll review a case where a site design triggers MS flow which create a modern page using PnP provisioning template.

Creating a PnP provisioning template
---------------------------------------------------------
Our plan is to start a Microsoft flow from site design and deploy a PnP provisioning template.
In the example, we will create a SharePoint Modern page using PnP provision template and for this we need to prepare the PnP template.
`This article <create-modern-page-pnp-template.html.html>`_ explains how to create this template using Powershell commands. As a result we will have an XML file;
keep it handy, we'll need it on the next step.


Creating a flow
---------------------------------------------------------
Create a flow from blank and add When an HTTP request is received trigger

.. image:: ../../../_static/img/flow/how-tos/when-http-request.png

Then add this JSON to the request body

.. code-block:: XML

  {
    "type": "object",
    "properties": {
        "webUrl": {
            "type": "string"
        },
        "parameters": {
            "type": "object",
            "properties": {
                "event": {
                    "type": "string"
                },
                "product": {
                    "type": "string"
                }
            }
        }
    }
    }




HTTP POST URL will be empty until you save the flow; We'll need the URL when creating our site script.

Then we get the created PnP template and place it to Plumsail action.

.. image:: ../../../_static/img/flow/how-tos/apply-modern-page-site-design.png

As you can see  we  select WebURL value in Sharepoint site URL field. It is a dynamic value and provides the newly created site URL. 
We pass the parameter to Plumsail action so it will know where to apply the PnP template.

On the next steps we need to start the Flow automatically once the site is created. 


Creating a site design and site script
---------------------------------------------------------

Site design is a container which includes one or more site scripts. This `Microsoft article <https://docs.microsoft.com/en-us/sharepoint/dev/declarative-customization/site-design-pnp-provisioning#create-the-site-design>`_ explains how to add

site design. When you select the site design it triggers our Microsoft Flow. You can add as many site designs as you would like and each site design will start its own MS Flow depending on the situation and requirements.


Starting MS Flow from site design
---------------------------------------------------------

The last step is when you select the site design it triggers the created flow and deploy the PnP template with modern page.

.. image:: ../../../_static/img/flow/how-tos/site-designs-list.png

That is all! Using Site designs and Plumsail action Provision PnP template to sharepoint together 
significantly expands the possibilities and automates creating unique site structures.

.. hint::
  You may also be interested in `this article <create-modern-page-pnp-template.html.html>`_ explaining how to create SharePoint lists or document libraries using PnP template.
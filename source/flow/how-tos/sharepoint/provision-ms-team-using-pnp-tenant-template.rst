How to provision Microsoft Team using PnP tenant template
===================================================================================

Plumsail Actions have action for provisioning PnP Tenant templates. 
Those templates are basically the same PnP templates, 
but instead of provisioning some lists and libraries to specific site 
you can create entities of a higher level. For example, you can provision Microsoft Team.


Automating provisioning of a new Microsoft Team for new projects.
===================================================================================

Let's say, you have a SharePoint list called "Projects". This list has only two fields:

Title - Project name
Owner - SP User, project manager.


When a new item is added to this list 
we'll set up workspace for new project team and create a Microsoft Team automatically using Power Automate Flow.

We can use this PnP code to create the workspace:

.. code-block:: XML

  <pnp:Teams>
    <pnp:Team DisplayName="Title" Description="" Visibility="Private" Photo="TeamData/TEAM_ef3020c6-1953-4367-b7c5-a6da8e24d049/photo_ef3020c6-1953-4367-b7c5-a6da8e24d049_432X432.jpg" Specialization="None">
      <pnp:FunSettings />
      <pnp:GuestSettings AllowCreateUpdateChannels="false" />
      <pnp:MembersSettings />
      <pnp:MessagingSettings />
      <pnp:Security>
        <pnp:Owners>
          <pnp:User UserPrincipalName="Owner" />
        </pnp:Owners>
        <pnp:Members>
          <pnp:User UserPrincipalName="user@domain.com" />
        </pnp:Members>
      </pnp:Security>
      <pnp:DiscoverySettings ShowInTeamsSearchAndSuggestions="false" />
      <pnp:Channels>
        <pnp:Channel DisplayName="General" Description="test" ID="19:796d063baf3fad3ffa2231aeaf092c8fb9b44e@thread.skype">
          <pnp:Tabs>
            <pnp:Tab DisplayName="Lists and Pages" TeamsAppId="2a527703-1f6f-4559-a332-d8a7d288cd88"/>
            <pnp:Tab DisplayName="Docs" TeamsAppId="com.microsoft.teamspace.tab.files.sharepoint">
              <pnp:Configuration EntityId="" ContentUrl="https://tenant.sharepoint.com/sites/mynewsite/Shared%20Documents" RemoveUrl="" WebsiteUrl="" />
            </pnp:Tab>
          </pnp:Tabs>
        </pnp:Channel>
      </pnp:Channels>
    </pnp:Team>
  </pnp:Teams>

The sample creates a team, adds a channel, and adds 2 tabs to the channel.

The complete flow is below. 

.. image:: ../../../_static/img/flow/how-tos/sharepoint/move-documents-to-archive.png
   :alt: Move Documents To Archive


Conclusion
----------

That's all! These few steps can help you to create a simple archive system that moves old documents from a source folder to your archive.

You may also extend this system by creating a specific folder for every run of this flow with `Create SharePoint Folder by URL <../../actions/sharepoint-processing.html#create-sharepoint-folder-by-url>`_  and `Create SharePoint Folder in List <../../actions/sharepoint-processing.html#create-sharepoint-folder-in-list>`_ actions.

It may be very useful if you need to archive your documents into the folder. For example, you may want to put a current date in the name.
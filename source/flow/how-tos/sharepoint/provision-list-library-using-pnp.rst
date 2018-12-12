Provision SharePoint list or library with custom columns using PnP
============================================================================================================================

This article will show how to use a PnP script to create a SharePoint list or library and how to use this script in Microsoft Flow.
We will use `Provision PnP template to SharePoint  <../../actions/sharepoint-processing.html#provision-pnp-template-to-sharepoint>`_ action from `Plumasail SP connector <https://plumsail.com/actions/sharepoint/>`_, which is a part of `Plumsail Actions <https://plumsail.com/actions>`_.
This action allows you to create different objects such as: pages, lists with custom columns, libraries, subsites, etc.


Create a SharePoint list with custom columns
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Let's say we need to create a Sharepoint list with 3 text columns. PnP script allows creting diffeetn list types: 
GenericList, DocumentLibrary, Survey, etc. To define the list type we need to use tag TemplateType

<pnp:ListInstance Title="Employees" TemplateType="100" Url="Lists/Employees">

TemplateType = 100 means GenericList.

Also we decided to create 3 text columns. Then we need to use tag Type:

<Field Type="Text" DisplayName="Test1" Required="FALSE" EnforceUniqueValues="FALSE" Indexed="FALSE" MaxLength="255" ID="{78698283-db53-488b-8a8b-c097c8a29026}"/>

The whole script looks like this:

<pnp:Provisioning xmlns:pnp="http://schemas.dev.office.com/PnP/2018/07/ProvisioningSchema">
  <pnp:Preferences Generator="OfficeDevPnP.Core, Version=3.3.1811.0, Culture=neutral, PublicKeyToken=null" />
  <pnp:Templates ID="CONTAINER-LISTDEMO">
    <pnp:ProvisioningTemplate ID="LISTDEMO" Version="1" Scope="Undefined">
      <pnp:Lists>
        <pnp:ListInstance Title="Employees" TemplateType="100" Url="Lists/Employees">
          <pnp:Views>
            <View Name="MainView" DefaultView="TRUE" MobileView="TRUE" MobileDefaultView="TRUE" Type="HTML" DisplayName="All Items" Url="/Employees/AllItems.aspx">

              <ViewFields>
                <FieldRef Name="Test1" />
                <FieldRef Name="Test2" />
                <FieldRef Name="Test3" />
              </ViewFields>

            </View>
          </pnp:Views>

          <pnp:Fields>
            <Field Type="Text" DisplayName="Test1" Required="FALSE" EnforceUniqueValues="FALSE" Indexed="FALSE" MaxLength="255" ID="{78698283-db53-488b-8a8b-c097c8a29026}"/>
            <Field Type="Text" DisplayName="Test2" Required="FALSE" EnforceUniqueValues="FALSE" Indexed="FALSE" MaxLength="255" ID="{78698283-db53-488b-8a8b-c097c8a29027}"/>
            <Field Type="Text" DisplayName="Test3" Required="FALSE" EnforceUniqueValues="FALSE" Indexed="FALSE" MaxLength="255" ID="{78698283-db53-488b-8a8b-c097c8a29028}"/>
          </pnp:Fields>
  
        </pnp:ListInstance>
      </pnp:Lists>
    </pnp:ProvisioningTemplate>
  </pnp:Templates>
</pnp:Provisioning>


Conclusion
----------

That is it. These few simple steps can help you to manage your company's projects more effectively.

.. hint::
  You may also be interested in `this article <https://plumsail.com/docs/actions/v1.x/flow/how-tos/sharepoint/create-site-by-custom-template-and-grant-permissions.html>`_ explaining how to Create SharePoint site by a custom template and grant permissions in Microsoft Flow and Azure Logic Apps.


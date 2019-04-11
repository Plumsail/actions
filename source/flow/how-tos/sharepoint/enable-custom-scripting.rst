Enable custom scripting on site
===============================

For correct operation of the provisioning functional, you must enable custom scripting feature. You can do it in 2 ways:

By the help of the PowerShell
-------------------------

First of all, you need to install SharePoint PowerShell. Follow `the installation instruction <https://docs.microsoft.com/en-us/powershell/sharepoint/sharepoint-online/connect-sharepoint-online?view=sharepoint-ps>`_.

.. code-block:: powershell

  Connect-SPOService -Url https://[yourtenant]-admin.sharepoint.com -credential admin@[yourtenant].onmicrosoft.com 
  Set-SPOSite -Identity https://[yourtenant].sharepoint.com/[siteurl] -DenyAddAndCustomizePages 0



By the help of the PnP PowerShell
-----------------------------

First of all, you need to install PnP PowerShell. Follow `the installation instruction <https://docs.microsoft.com/en-us/powershell/sharepoint/sharepoint-pnp/sharepoint-pnp-cmdlets?view=sharepoint-ps#installation>`_.

.. code-block:: powershell

  Connect-PnPOnline -Url 'https://[yourtenant]-admin.sharepoint.com/' -Credentials (Get-Credential)

  $DenyAddAndCustomizePagesStatusEnum = [Microsoft.Online.SharePoint.TenantAdministration.DenyAddAndCustomizePagesStatus]

  $context = Get-PnPContext
  $site = Get-PnPTenantSite -Detailed -Url 'https://[yourtenant].sharepoint.com/'
  
  $site.DenyAddAndCustomizePages = $DenyAddAndCustomizePagesStatusEnum::Disabled

  $site.Update()
  $context.ExecuteQuery()
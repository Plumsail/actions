$tenant = "yourdomain"
$username = ""
$siteScriptTitle = "EmployeesListScript"
$siteScriptDescription = ""
$global:siteScriptId = "" 

function addSiteScript($siteScriptTitle, $siteScriptDescription, $script) {
  $siteScripts = Get-SPOSiteScript 
  $siteScriptObj = $siteScripts | Where-Object {$_.Title -eq $siteScriptTitle} 
  if ($siteScriptObj) {
    $confirmation = Read-Host "There is an existing site script with the same name. Update that?"  
    if ($confirmation -eq 'y') {
      Set-SPOSiteScript -Identity $siteScriptObj.Id -Content $script
      $global:siteScriptId= $siteScriptObj.Id
    }
  }
  else {
    $siteScriptObj = Add-SPOSiteScript -Title $siteScriptTitle -Description $siteScriptDescription -Content $script
    $global:siteScriptId= $siteScriptObj.Id
  }
}
$script = @'
{
  "$schema": "schema.json",
  "actions": [
    {
      "verb": "setRegionalSettings",
      "locale": 1033,
      "sortOrder": 25
    },
    {
      "verb": "addPrincipalToSPGroup",
      "principal": "ContosoAdmins",
      "group": "Visitors"
    },
    {
      "verb": "createSPList",
      "listName": "Employees",
      "templateType": 100,
      "subactions": [
        {
          "displayName": "Full name",
          "internalName": "fullName",
          "isRequired": true,
          "addToDefaultView": false,
          "fieldType": "Text",
          "enforceUnique": false,
          "verb": "addSPField"
        },
        {
          "displayName": "Job Title",
          "internalName": "jobTitle",
          "isRequired": true,
          "addToDefaultView": false,
          "fieldType": "Text",
          "enforceUnique": false,
          "verb": "addSPField"
        },
        {
          "displayName": "Department",
          "internalName": "department",
          "isRequired": true,
          "addToDefaultView": false,
          "fieldType": "Text",
          "enforceUnique": false,
          "verb": "addSPField"
        },
        {
          "displayName": "Office",
          "internalName": "office",
          "isRequired": true,
          "addToDefaultView": false,
          "fieldType": "Text",
          "enforceUnique": false,
          "verb": "addSPField"
        },
        {
          "displayName": "Work Phone",
          "internalName": "workPhone",
          "isRequired": true,
          "addToDefaultView": false,
          "fieldType": "Text",
          "enforceUnique": false,
          "verb": "addSPField"
        },
        {
          "displayName": "Work Email",
          "internalName": "workEmail",
          "isRequired": true,
          "addToDefaultView": false,
          "fieldType": "Text",
          "enforceUnique": false,
          "verb": "addSPField"
        },
        {
          "verb": "setTitle",
          "title": "employees"
        }
      ]
    }
  ],
  "bindata": {},
  "version": 1
}
'@
Connect-SPOService -Url https://yourdomain-admin.sharepoint.com -Credential $username
addSiteScript $siteScriptTitle $siteScriptDescription $script

function addToSiteDesign($siteDesignTitle) {
  $siteScripts = Get-SPOSiteScript 
  $siteScriptObj = $siteScripts | Where-Object {$_.Title -eq $siteScriptTitle} 
  if($siteScriptObj) {
    $siteDesigns = Get-SPOSiteDesign
    $siteDesignsLength = @($siteDesigns).length
    if($siteDesignsLength -gt 1) {
      $siteDesign = $siteDesigns | Where-Object {$_.Title -eq $siteDesignTitle}
    } elseIf($siteDesignsLength -eq 1){
      if($siteDesigns.Title -eq $siteDesignTitle) {
        $siteDesign = $siteDesigns
      }
    }
    $siteScriptIds = $siteDesign.SiteScriptIds
    if (!($siteDesign.SiteScriptIds -match $siteScriptObj.Id)){
      $siteScriptIds += $siteScriptObj.Id
      Set-SPOSiteDesign -Identity $siteDesign.Id -SiteScripts $siteScriptIds
    }
  } else {
    "No Site Design found with a title " + $siteDesignTitle
  }
}

function addToNewSiteDesign($siteDesignTitle,$siteDesignWebTemplate, $siteScriptId) {
  if($siteScriptId -ne "") {
    Add-SPOSiteDesign -Title $siteDesignTitle -WebTemplate $siteDesignWebTemplate -SiteScripts $siteScriptId
  }
}
addToNewSiteDesign "EmployeesListSiteDesign" 68 $global:siteScriptId

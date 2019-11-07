Import-Module WebAdministration

function Website-Exists
{
    Param(
         [string]$websiteName
    )
    return Test-Path IIS:\Sites\$websiteName
}

function Create-Website
{
     Param(
         [string]$websiteName
    )
     
    if(Website-Exists -websiteName $websiteName)
    {
        Write-Host "Website already exists" -ForegroundColor Yellow
    }
    else
    {
        Write-Host "Creating new website..." -ForegroundColor Green
        #New-Item IIS:\Sites\TestSite -bindings @{protocol="http";bindingInformation=":88:TestSite"} -physicalPath c:\test grant
    }
}

function Remove-Webiste
{
  
}



# Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
# Set-ExecutionPolicy -ExecutionPolicy AllSigned -Scope CurrentUser

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
         [string]$websiteName, 
         [string]$bindings, 
         [string]$physicalPath
    )
     
    if(Website-Exists -websiteName $websiteName)
    {
        Write-Host "Website '$websiteName' already exists" -ForegroundColor Yellow
    }
    else
    {
        Write-Host "Creating new website '$websiteName' ..." -ForegroundColor Green
        New-Item IIS:\Sites\$websiteName -bindings $bindings -physicalPath $physicalPath
    }
}

function Drop-Website
{
     Param(
         [string]$websiteName
    )

     if(Website-Exists -websiteName $websiteName)
        {
          Write-Host "Removing website '$websiteName' ..." -ForegroundColor Green
          Remove-Website -Name $websiteName
          
          if(Website-Exists -websiteName $websiteName)
            {
              Write-Host "Error: was not able to remove website '$websiteName' ..." -ForegroundColor Red
            }
            else
            {
              Write-Host "Successfully dropped '$websiteName' ..." -ForegroundColor Green
            }
        }
     else
     {
       Write-Host "Cannot find website '$websiteName' ..." -ForegroundColor Yellow
     }
}

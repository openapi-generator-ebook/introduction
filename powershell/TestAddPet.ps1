# general setting of the PowerShell module, e.g. base URL, authentication, etc
$Configuration = Get-Configuration
# Configure OAuth2 access token for authorization: petstore_auth
$Configuration.AccessToken = "YOUR_ACCESS_TOKEN"

$Id = Get-Random -Maximum 10000

$Body = (Initialize-Pet -Id $Id -Category (Initialize-Category -Id $Id -Name "Name_example") -Name "openapi-generator-ebook-test" -PhotoUrls @("PhotoUrls_example") -Tags @((Initialize-Tag -Id $Id -Name "Name_example")) -Status "available") # Pet | Pet object that needs to be added to the store

# Add a new pet to the store
try {
     $Result = Add-Pet -Body $Body
     Write-Host ("Added a Pet with ID {0} successfully" -f $Id)
} catch {
    Write-Host ("Exception occured when calling Add-Pet: {0}" -f ($_.ErrorDetails | ConvertFrom-Json))
    Write-Host ("Response headers: {0}" -f ($_.Exception.Response.Headers | ConvertTo-Json))
}

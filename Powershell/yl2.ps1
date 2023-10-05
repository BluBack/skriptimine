
$firstName = Read-Host "Sisesta kasutaja eesnimi"
$lastName = Read-Host "Sisesta kasutaja perenimi"
$userName = $firstName.Substring(0,1).ToLower() + $lastName.ToLower()

Try {
   Remove-LocalUser -Name $userName -Confirm:$false
   Write-Host "Kasutaja $userName on edukalt kustutatud."
}
Catch{
   Write-Host "Kasutaja kustutamine ebaõnnestus. Veateade: $($_.Exception.Message)" -ForegroundColor Red
}

$ErrorActionPreference = "SilentlyContinue"

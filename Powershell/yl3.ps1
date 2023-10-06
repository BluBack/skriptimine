$firstName = Read-Host "Sisesta kasutaja eesnimi"
$lastName = Read-Host "Sisesta kasutaja perenimi"
$userName = $firstName.Substring(0,1).ToLower() + $lastName.ToLower()

$existingUser = Get-ADUser -Filter "SamAccountName -eq '$userName'" -ErrorAction SilentlyContinue

if($existingUser){
    Write-Host "Kasutaja nimega $userName juba eksisteerib. Kasutaja lisamine pole võimalik." -ForegroundColor Yellow
}
else {
    $password = Read-Host "Sisesta uue kasutaja parool" -AsSecureString
    New-ADUser -Name "$firstName $lastName" -SamAccountName $userName -UserPrincipalName "$userName@domain.com" -AccountPassword $password -Enabled $true -PasswordNeverExpires $true
    if($? -eq $true){
        Write-Host "Kasutaja $userName on edukalt lisatud." -ForegroundColor Green
    }
    else {
        Write-Host "Kasutaja lisamine ebaõnnestus." -ForegroundColor Red
    }
}
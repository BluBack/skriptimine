# Skript kustutab kasutaja AD-st kasutaja ees- ja perenime põhjal

# Küsi kasutaja ees- ja perenimi
$firstname = Read-Host "Enter user's first name:"
$lastname = Read-Host "Enter user's last name:"

# Loo kasutajanimi
$username = $firstname.ToLower() + "." + $lastname.ToLower() | ForEach-Object {$_ -replace "[^a-z]",""}

# Kustuta kasutaja
$deleteUser = Get-ADUser -Filter "SamAccountName -eq '$username'" -ErrorAction SilentlyContinue
if($deleteUser){
    Remove-ADUser -Identity $deleteUser -Confirm:$false -ErrorAction SilentlyContinue
    if( -not (Get-ADUser -Filter "SamAccountName -eq '$username'" -ErrorAction SilentlyContinue)){
        Write-Output "User '$firstname $lastname' was successfully deleted from AD."
    }else{
        Write-Output "There was some error with deleting the user '$firstname $lastname'."
    }
}else{
    Write-Output "User '$firstname $lastname' was NOT found in AD or there was some other issue with deleting the user."
}

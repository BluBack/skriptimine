$firstName = Read-Host "Sisesta kasutaja eesnimi"
$lastName = Read-Host "Sisesta kasutaja perenimi"
$userName = $firstName.Substring(0,1).ToLower() + $lastName.ToLower()

$existingUser = Get-ADUser -Filter "SamAccountName -eq '$userName'" -ErrorAction SilentlyContinue

if($existingUser){
    Write-Host "Kasutaja nimega $userName juba eksisteerib. Kasutaja lisamine pole võimalik." -ForegroundColor Yellow
}
else {
    Write-Host "Genereerin parooli kasutajale $userName"
    $password = -join ((65..90) + (97..122) + (48..57) | Get-Random -Count 12 | ForEach-Object {[char]$_})
    New-ADUser -Name "$firstName $lastName" -SamAccountName $userName -UserPrincipalName "$userName@domain.com" -AccountPassword $password -Enabled $true -PasswordNeverExpires $true
    if($? -eq $true){
        Write-Host "Kasutaja $userName on edukalt lisatud." -ForegroundColor Green
        # salvestame kasutaja info faili
        $filePath = "$userName.csv"
        $fileExists = Test-Path $filePath
        if($fileExists){
            $fileContent = Import-Csv $filePath
            $newUser = New-Object PSObject -Property @{
                UserName = $userName
                Password = $password
            }
            $fileContent += $newUser
            $fileContent | Export-Csv $filePath -NoTypeInformation
        }
        else{
            $newUser = New-Object PSObject -Property @{
                UserName = $userName
                Password = $password
            }
            $newUser | Export-Csv $filePath -NoTypeInformation
        }
    }
    else {
        Write-Host "Kasutaja lisamine ebaõnnestus." -ForegroundColor Red
    }
}
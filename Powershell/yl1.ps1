1. $eesnimi = Read-Host "Sisestage oma eesnimi"
$perenimi = Read-Host "Sisestage oma perenimi"

2. $kasutajanimi = ($eesnimi + "." + $perenimi).ToLower()

3. New-LocalUser -Name $kasutajanimi -Description "$eesnimi $perenimi konto" -Password (ConvertTo-SecureString "Parool1!" -AsPlainText -Force)

4. If ($? -eq $false) {
Write-Host "Kasutaja loomine ebaõnnestus"
}
# PURPOSE: Sets the workstation's DNS server and joins it to the domain.

param(
    [string]$domainName,
    [string]$adminUser,
    [string]$adminPass
)

# Set DNS to point to the Domain Controller (statically set to 10.0.0.4 in the ARM template)
Write-Host "Setting primary DNS server to 10.0.0.4..."
Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses "10.0.0.4"

# Give DNS time to register and for the DC to be ready
Write-Host "Waiting 60 seconds before attempting domain join..."
Start-Sleep -Seconds 60

# Join to domain
Write-Host "Attempting to join domain $domainName..."
$credential = New-Object System.Management.Automation.PSCredential ("$domainName\$adminUser", (ConvertTo-SecureString -AsPlainText $adminPass -Force))
Add-Computer -DomainName $domainName -Credential $credential -Restart -Force

# The VM will restart automatically after this script completes.
# PURPOSE: Installs Active Directory Domain Services and promotes the server to a Domain Controller.

param(
    [string]$domainName = "corp.local"
)

# Install AD Domain Services Role
Write-Host "Installing AD Domain Services role..."
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools

# Promote to Domain Controller
Write-Host "Promoting server to Domain Controller for domain $domainName..."
Install-ADDSForest `
    -CreateDnsDelegation:$false `
    -DatabasePath "C:\Windows\NTDS" `
    -DomainMode "Win2016" `
    -DomainName $domainName `
    -DomainNetbiosName "CORP" `
    -ForestMode "Win2016" `
    -InstallDns:$true `
    -LogPath "C:\Windows\NTDS" `
    -NoRebootOnCompletion:$false `
    -SysvolPath "C:\Windows\SYSVOL" `
    -Force:$true

# The VM will restart automatically after this script completes.
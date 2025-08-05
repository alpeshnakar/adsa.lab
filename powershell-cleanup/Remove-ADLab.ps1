<#
.SYNOPSIS
    Removes all resources created by the azuredeploy.json template.

.DESCRIPTION
    This script prompts the user for the base name and student count used during deployment.
    It then loops through and deletes the entire resource group for each student.
    This is a destructive action and will permanently delete all VMs, disks, and network components.
#>

# --- Get Deployment Details from User ---
$baseName = Read-Host -Prompt "Enter the 'baseName' used during deployment (e.g., adsec-lab)"
$studentCount = Read-Host -Prompt "Enter the number of students deployed"

# --- Validate Input ---
if (-not ($studentCount -as [int])) {
    Write-Error "Student count must be a number. Please run the script again."
    return
}

# --- Main Processing Loop ---
for ($i = 1; $i -le $studentCount; $i++) {
    $studentPrefix = "student${i}"
    $rgName = "${baseName}-${studentPrefix}-rg"

    Write-Host "----------------------------------------------------" -ForegroundColor Red
    Write-Host "Initiating deletion of Resource Group: $rgName for Student $i" -ForegroundColor Yellow
    
    # Check if the resource group exists before trying to remove it
    $rg = Get-AzResourceGroup -Name $rgName -ErrorAction SilentlyContinue
    if ($rg) {
        Remove-AzResourceGroup -Name $rgName -Force -AsJob
        Write-Host "Deletion job started for $rgName." -ForegroundColor Green
    }
    else {
        Write-Host "Resource Group $rgName not found. Skipping." -ForegroundColor Gray
    }
}

Write-Host "----------------------------------------------------" -ForegroundColor Cyan
Write-Host "Cleanup process initiated for all specified labs."
Write-Host "Check the status of the deletion jobs in the Azure Portal." -ForegroundColor Cyan
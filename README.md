Active Directory Security Lab Environment
This repository contains the necessary files to automatically deploy a complete, multi-student lab environment in Microsoft Azure for an Active Directory security course.

Lab Environment
For each student, the deployment will create a dedicated resource group containing:

A Virtual Network with one subnet, secured by a Network Security Group.

Domain Controller: A Windows Server 2022 VM.

Workstation: A Windows 10 VM (will be automatically joined to the domain).

Attacker VM: A Kali Linux VM.

One-Click Deployment
Click the button below to deploy the lab environment to your Azure subscription. You will be prompted to enter parameters such as the number of students and the URLs for the helper scripts.

Instructions
1. Prerequisites

An active Azure subscription.

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https://raw.githubusercontent.com/alpeshnakar/lab/refs/heads/master/azuredeploy.json)


2. Deploy the Lab

Click the updated "Deploy to Azure" button in your repository's README.

You will be redirected to the Azure Portal. Fill in the required parameters:

Student Count: The number of lab environments to build.

Admin Password: A complex password for the labadmin account.

Dc Script Url: The raw URL to your Install-DC.ps1 file.

Workstation Script Url: The raw URL to your Join-Workstation.ps1 file.

Click "Review + create", then "Create".

6. Clean Up

After the lab is complete, remember to delete the resource groups to avoid incurring further costs. You can do this manually in the Azure portal or use the Remove-ADLab.ps1 script located in the powershell-cleanup folder.

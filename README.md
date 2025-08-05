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

2. Get Helper Script URLs

You will need the raw URLs for the helper scripts during deployment.

https://raw.githubusercontent.com/alpeshnakar/adsa.lab/main/helper-scripts/Install-DC.ps1

https://raw.githubusercontent.com/alpeshnakar/adsa.lab/main/helper-scripts/Join-Workstation.ps1

https://alpeshnakar.github.io/adsa.lab/azuredeploy.json

https%3A%2F%2Fraw.githubusercontent.com%2Falpeshnakar%2Fadsa.lab%2Fmain%2Fazuredeploy.json

3. Deploy the Lab

Click the "Deploy to Azure" button at the top of this README.

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https://alpeshnakar.github.io/adsa.lab/azuredeploy.json)

You will be redirected to the Azure Portal. Fill in the required parameters.

Click "Review + create", then "Create".

5. Clean Up

After the lab is complete, remember to delete the resource groups to avoid incurring further costs. You can do this manually in the Azure portal or use the Remove-ADLab.ps1 script located in the powershell-cleanup folder.


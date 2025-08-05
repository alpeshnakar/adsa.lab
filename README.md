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

A public GitHub repository to host your files.

2. Fork or Create Your Repository

Fork this repository or create your own and add the files from this guide.

3. Get Helper Script URLs

Ensure the Install-DC.ps1 and Join-Workstation.ps1 files are in the helper-scripts folder of your public repository. For each file, click on it, then click the "Raw" button to get its unique URL. You will need these URLs for the deployment.

4. Update the "Deploy to Azure" Button

You must edit this README.md file and update the "Deploy to Azure" button's link to point to the azuredeploy.json file in your own repository.

Find this line in the README.md:

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FYOUR_USERNAME%2FYOUR_REPOSITORY%2Fmain%2Fazuredeploy.json)

Replace YOUR_USERNAME and YOUR_REPOSITORY with your GitHub username and repository name.

5. Deploy the Lab

Click the updated "Deploy to Azure" button in your repository's README.

You will be redirected to the Azure Portal. Fill in the required parameters:

Student Count: The number of lab environments to build.

Admin Password: A complex password for the labadmin account.

Dc Script Url: The raw URL to your Install-DC.ps1 file.

Workstation Script Url: The raw URL to your Join-Workstation.ps1 file.

Click "Review + create", then "Create".

6. Clean Up

After the lab is complete, remember to delete the resource groups to avoid incurring further costs. You can do this manually in the Azure portal or use the Remove-ADLab.ps1 script located in the powershell-cleanup folder.

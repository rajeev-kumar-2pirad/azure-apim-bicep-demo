# azure-apim-bicep-demo
Managing infrastructure deployments on Azure as IaaC through Bicep scripts

# What is IaaC?
![What is IaaC?](images/image-2.png)

# What is Bicep?
![What is Bicep?](images/image-3.png)

# AZURE Bicep Setup Prerequisites
![AZURE Bicep Setup Prerequisites](images/image.png)

![Bicep VS Code Extension](images/image-1.png)

# AZURE Bicep Playground
![What is AZURE Bicep Playground?](images/image-4.png)

![AZURE Bicep Playground](images/image-5.png)

# Must Set COST BUDGET ALERT to the SUBSCRIPTION
![cost-budget-alert](images/image-6.png)

# AZURE PORTAL LOGIN using AZURE CLI
az login

# SET SUBSCRIPTION using AZURE CLI
az account set --subscription f62c4e26-ce53-44a7-94a2-40ae82d69ba6 

# CREATE RESOURCE GROUP in certain LOCATION using AZURE CLI
az group create --name <<<resource-group-name>>> --location eastus

# EXECUTE/SUBMIT ARMTEMPLATE.JSON file to AZURE ENGINE using AZURE CLI
aaz deployment group create --resource-group <<<resource-group>>> --template-file <<<armtemplatefile.json>>>

# EXECUTE/SUBMIT AZUREBICEPTEMPLATE.BICEP file to AZURE ENGINE using AZURE CLI
az deployment group create --resource-group <<<resource-group>>> --template-file <<<biceptemplatefile.bicep>>>
#Bash script to automate creating a virtual machine with Nginx
#Runs from the Windows Power Shell and requires Azure CLI to be installed on Windows.

##### variables to configure environment
$location = "westus"
$resourcegroupname = "HW6b"
$vmname = "colbert-vmb"
$NSGname = "colbert-vmbNSG"

# create a resource group
Write-Host "Started creating resource group"
az group create -l $location -n $resourcegroupname

#create a virtual machine
Write-Host "Started creating virtual machine"
az vm create --resource-group $resourcegroupname --name $vmname --image UbuntuLTS --size Standard_B1s `
--admin-username azureuser --public-ip-sku Standard --generate-ssh-keys

# use an extension set to run a script on the vm
Write-Host "Started running customization script"
az vm extension set --resource-group $resourcegroupname --vm-name $vmname --name customScript `
--publisher Microsoft.Azure.Extensions --version 2.1 `
--settings '{\"fileUris\": [\"https://raw.githubusercontent.com/mikecolbert/AzureVM/main/configure-nginx.sh\"],\"commandToExecute\": \"./configure-nginx.sh\"}'

#create a network security group rule to allow web traffic to your new server
Write-Host "Started adding rule to network security group"
az network nsg rule create --resource-group $resourcegroupname --nsg-name $NSGname --name allow-http `
--protocol tcp --priority 100 --destination-port-range 80 --access Allow

Write-Host "Done."

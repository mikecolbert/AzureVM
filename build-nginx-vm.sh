#Bash script to automate creating a virtual machine with Nginx
#Runs from the Mac terminal and requires Azure CLI to be installed on the Mac.

# create a resource group
az group create -l westus -n HW6a

#create a virtual machine
az vm create --resource-group HW6a \
--name colbert-vm \
--image UbuntuLTS \
--size Standard_B1s \
--admin-username azureuser \
--public-ip-sku Standard \
--generate-ssh-keys

# use and extension set to run a script on the vm
az vm extension set \
  --resource-group HW6a \
  --vm-name colbert-vm \
  --name customScript \
  --publisher Microsoft.Azure.Extensions \
  --version 2.1 \
  --settings '{"fileUris":["https://raw.githubusercontent.com/mikecolbert/AzureVM/main/configure-nginx.sh"]}' \
  --protected-settings '{"commandToExecute": "./configure-nginx.sh"}'

#create a network security group rule to allow web traffic to your new server
az network nsg rule create \
  --resource-group HW6a \
  --nsg-name colbert-vmNSG \
  --name allow-http \
  --protocol tcp \
  --priority 100 \
  --destination-port-range 80 \
  --access Allow

## crate container for the state file with az cli

# create a new resource group for the state file
$ az group create --name <rg-name>  --location westeurope

# create a new storage account within the new resource group
$ az storage account create -n <storage-account-name>  -g <rg-name> -l westeurope --sku Standard_LRS

# get account key of the storage account
$ az storage account keys list -g <rg-name> -n <storage-account-name>  --query '[0].value' -o tsv

# create a new container within the new account storage
$ az storage container create --account-name <storage-account-name> --name <container-name> --public-access off --account-key <account-key>
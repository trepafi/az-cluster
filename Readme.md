# Infrastructure for K8s cluster on Azure

## Considerations
+ CI/CD using GitHub actions
+ IaC using Terraform
+ Azure as Cloud provider
+ Helm Charts for Kubernetes manifests
  
## Prerequisites

### Setting up secrets

+ Log in Azure Portal
```bash
$ az login
```

### GitHub resources
+ Creating a service principal for Github under the subscription id
```bash
$ export subscription_id=caae468d-7924-43ad-8446-fa7218c64e54
$ az ad sp create-for-rbac --name "github" --role contributor --scopes /subscriptions/${subscription_id} --sdk-auth
```

+ Set output json block (including brackets) to `AZURE_CREDENTIALS` in GitHub secrets
+ From that same output, set the following secrets in Github using the values of the similar named output fields:
  + `ARM_CLIENT_ID`
  + `ARM_CLIENT_SECRET`
  + `ARM_SUBSCRIPTION_ID`
  + `ARM_TENANT_ID`
  
### Terraform resources
+ Create a resource group ad a storage for Terraform state
```bash
$ export storage_account_name="azk8sstorage"
$ export resource_group_name="az-k8s-rg"
$ export tfstate_filename="tfstate"
$ export region="westeurope"
$ az group create --location ${region} --resource-group ${resource_group_name} 
$ az storage account create --name ${storage_account_name} --resource-group ${resource_group_name}
$ az storage container create --name ${tfstate_filename} --account-name ${storage_account_name}
$ az storage account keys list -g ${resource_group_name} -n ${storage_account_name} | jq -r ".[0].value"
```
  + Set the output of the last command to `TF_ARM_ACCESS_KEY` in GitHub secrets.

### Kubectl resources
+ Getting credentials for Kubectl
```bash
$ az aks get-credentials --resource-group relaxing-parrot-rg --name relaxing-parrot-aks
```

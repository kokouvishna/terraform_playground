# Azure Provider: Authenticating using a Service Principal with a Client Secret

Should you have more than one Subscription, you can specify the Subscription to use via the following command:
$ az account set --subscription="<subscription-id>"

We can now create the Service Principal which will have permissions to manage resources in the specified Subscription using the following command:
$ az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/<subscription-id>"
This command will output 5 values:
{
  "appId": "<client_id>",
  "displayName": "azure-cli-2017-06-05-10-41-15",
  "name": "http://azure-cli-2017-06-05-10-41-15",
  "password": "<client_secret>",
  "tenant": "<tenant_id>"
}

Finally, it's possible to test these values work as expected by first logging in:
az login --service-principal -u CLIENT_ID -p CLIENT_SECRET --tenant TENANT_ID

# Configuring the Service Principal in Terraform
For instance in a shell script:
# sh
export ARM_CLIENT_ID="00000000-0000-0000-0000-000000000000"
export ARM_CLIENT_SECRET="12345678-0000-0000-0000-000000000000"
export ARM_TENANT_ID="10000000-0000-0000-0000-000000000000"
export ARM_SUBSCRIPTION_ID="20000000-0000-0000-0000-000000000000"
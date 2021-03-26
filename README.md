# Learning all about Key Vault

This is a project that demos the following:

- Deploy a Key Vault using the Azure CLI (az) and a bicep template (main.bicep)
- C# code to work with the Key Vault
    - The console app uses the *Azure.Identity* and *Azure.Security.KeyVault.Secrets* nuget packages.
    - It shows you how to:
        - Authenticate to a vault
        - List secrets in the vault
        - Add a new secret to the vault

## Set up the Key Vault

1. Update the bicep/main.bicep file with your params
2. Create a resource group

        az group create --name <resource group name> --location <azure region>

3. Build the bicep file from the bicep folder

        bicep build .\main.bicep

4. Update the params.json file with your values
5. Deploy the Key Vault

        az deployment group create -f ./main.json -g <resource group name> --parameters ./params.json

## Run the console example

1. F5 in Visual Studio Code

## Clean up

1. Delete the resource group

        az group delete --name <resource group name>
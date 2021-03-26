# Learning about Azure Key Vault

This is a project I created to learn how to work with Azure Key Vault.

In this repo we do the following:

- Deploy a Key Vault using the Azure CLI (az) and a bicep template ([main.bicep](bicep/main.bicep))
    - Also adds a secret, key and certificate to the vault
- C# code to work with the Key Vault
    - The console app uses the *Azure.Identity* and *Azure.Security.KeyVault.Secrets* nuget packages.
    - The code shows how to:
        - Authenticate to a vault
        - Read a secret from the vault
        - Add a new secret to the vault

## Set up the Key Vault

1. Update the *bicep/main.bicep* file with your params
2. Create a Resource Group

        az group create --name <resource group name> --location <azure region>

3. Build the [main.bicep](bicep/main.bicep) file from the *bicep* folder

        bicep build .\main.bicep

4. Update the [params.json](bicep/params.json) file with your own parameter values
5. Deploy the Key Vault using the Azure CLI

        az deployment group create -f ./main.json -g <resource group name> --parameters ./params.json

## Run the C# Console app

1. F5 in Visual Studio Code or "dotnet run" in the terminal

## Clean up

1. Delete the resource group

        az group delete --name <resource group name>
using System;
using Azure.Identity;
using Azure.Security.KeyVault.Secrets;

namespace learn_key_vault
{
    class Program
    {
        static void Main(string[] args)
        {

            // Authenticate with Azure Key Vault

            Console.Write("What's the name of your Key Vault?");
            string keyVaultName = Console.ReadLine();
            
            var kvUri = "https://" + keyVaultName + ".vault.azure.net";
            var client = new SecretClient(new Uri(kvUri), new DefaultAzureCredential());
            
            // Add a secret to the Key Vault

            Console.Write("Input the name of your secret > ");
            string secretName = Console.ReadLine();

            Console.Write("Input the value of your secret > ");
            string secretValue = Console.ReadLine();

            Console.Write("Creating a secret in " + keyVaultName + " called '" + secretName + "' with the value '" + secretValue + "` ...");

            client.SetSecret(secretName, secretValue);

            Console.WriteLine(" done.");
            
            // Get a secret from the Key Vault

            KeyVaultSecret secret = client.GetSecret(secretName);
            
            Console.WriteLine(string.Format("Your secret value read from the vault: {0}", secret.Value.ToString()));
        }
    }
}
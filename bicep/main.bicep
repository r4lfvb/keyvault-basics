param tenantId string = subscription().tenantId

@secure()
param objectId string

param location string = resourceGroup().location

param keyVaultName string
param skuName string = 'standard'

param enabledForDeployment bool = false
param enabledForDiskEncryption bool = false
param enabledForTemplateDeployment bool = false

//@allowed(['All','Decrypt','Encrypt','UnwrapKey','WrapKey','Verify','Sign','Get','List','Update','Create','Import','Delete','Backup','Restore','Recover','Purge'])
param keysPermissions array = [
  'list'
]

//@allowed(['all', 'get', 'list', 'set', 'delete', 'backup', 'restore', 'recover', 'purge'])
param secretsPermissions array = [
  'list'
]

resource vault 'Microsoft.KeyVault/vaults@2019-09-01' = {
  name: keyVaultName
  location: location
  tags: {
    displayName: 'KeyVault'
    createdBy: 'ARM'
  }
  properties: {
    enabledForDeployment: enabledForDeployment
    enabledForTemplateDeployment: enabledForTemplateDeployment
    enabledForDiskEncryption: enabledForDiskEncryption
    enableSoftDelete: false
    tenantId: tenantId
    accessPolicies: [
      {
        objectId: objectId
        tenantId: tenantId
        permissions: {
          keys: keysPermissions
          secrets: secretsPermissions
        }
      }
    ]
    sku: {
      name: skuName
      family: 'A'
    }
    networkAcls: {
      defaultAction: 'Allow'
      bypass: 'AzureServices'
    }
  }
}

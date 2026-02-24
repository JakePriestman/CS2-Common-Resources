param names namingType
param blobContainers array
param tables array
param location string = resourceGroup().location

resource keyVault 'Microsoft.KeyVault/vaults@2024-11-01' = {
  name: names.keyVault
  location: location
  properties: {
    sku: {
      name: 'standard'
      family: 'A'
    }
    tenantId: tenant().tenantId
    enableRbacAuthorization: true
  }
}

resource appServicePlan 'Microsoft.Web/serverfarms@2024-04-01' = {
  name: names.appServicePlan
  location: location
  sku: {
    name: 'F1'
    tier: 'Free'
    size: 'F1'
    capacity: 1
  }
  properties: {
    reserved: false
    perSiteScaling: false
    maximumElasticWorkerCount: 1
  }
}

resource storageAccount 'Microsoft.Storage/storageAccounts@2024-01-01' = {
  name:  names.storageAccount
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
  properties: {
    allowBlobPublicAccess: true
   networkAcls: {
        defaultAction: 'Deny'
      }
    }
  }
}

resource blobContainer 'Microsoft.Storage/storageAccounts/blobServices/containers@2025-06-01' = [
  for name in blobContainers: {
    name: '${storageAccount.name}/default/${name}'
    properties: {
      publicAccess: 'Blob'
    }
  }
]


resource table 'Microsoft.Storage/storageAccounts/tableServices/tables@2025-06-01' = [
  for name in tables: {
    name: '${storageAccount.name}/default/${name}'
  }
]

type  namingType = {
  keyVault: string
  storageAccount: string
  appServicePlan: string
}

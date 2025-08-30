param name string = deployment().name

param location string = resourceGroup().location 

param sku string

resource storage 'microsoft.storage/storageAccounts@2022-05-01' = {
  name: name
  location: location
  sku: {
    name: sku
  }
  kind: 'StorageV2'
  properties: {
    minimumTlsVersion: 'TLS1_2'
    supportsHttpsTrafficOnly: true
    allowBlobPublicAccess: false
  }
}

resource blobService 'microsoft.storage/storageAccounts/blobServices@2022-05-01' = {
  parent: storage
  name: 'default'
  properties: {
    deleteRetentionPolicy: {
      enabled: true
      days: 7
    }
    isVersioningEnabled: true
    containerDeleteRetentionPolicy: {
      enabled: true
      days: 7
    }
  }
}

resource fileService 'microsoft.storage/storageAccounts/fileServices@2022-05-01' = {
  parent: storage
  name: 'default'
  properties: {
    shareDeleteRetentionPolicy: {
      enabled: true
      days: 7
    }
  }
}

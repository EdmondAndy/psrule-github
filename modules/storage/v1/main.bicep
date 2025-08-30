param location string = resourceGroup().location 

resource storage 'microsoft.storage/storageAccounts@2022-05-01' = {
  name: 'sttest0001'
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}

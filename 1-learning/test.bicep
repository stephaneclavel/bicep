param location string = resourceGroup().location

//@minLength(3)
//@maxLength(24)
//param storageAccountName string = 'uniquestorage001sc' // must be globally unique

var storageSku = 'Standard_LRS' // declare variable and assign value

resource stg 'Microsoft.Storage/storageAccounts@2019-06-01' = {
//  name: storageAccountName
  name: uniqueString(resourceGroup().id) // generates unique name based on resource group ID
  location: location
  kind: 'Storage'
  sku: {
    name: storageSku // reference variable
  }
}

output storageId string = stg.id // output resourceId of storage account

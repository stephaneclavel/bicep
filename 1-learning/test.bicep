param location string = resourceGroup().location
param namePrefix string = 'storage'
param limitedRedundancy bool = true // defaults to true, but can be overridden

//1 @minLength(3)
//1 @maxLength(24)
//1 param storageAccountName string = 'uniquestorage001sc' // must be globally unique

//3 var storageSku = 'Standard_LRS' // declare variable and assign value
var storageAccountName = '${namePrefix}${uniqueString(resourceGroup().id)}'

resource stg 'Microsoft.Storage/storageAccounts@2019-06-01' = {
//1  name: storageAccountName
//2  name: uniqueString(resourceGroup().id) // generates unique name based on resource group ID
  name: storageAccountName 
  location: location
  kind: 'Storage'
  sku: {
    //3 name: storageSku // reference variable
    name: limitedRedundancy ? 'Standard_LRS' : 'Standard_GRS' // if true --> LRS, else --> GRS
  }
}

output storageId string = stg.id // output resourceId of storage account

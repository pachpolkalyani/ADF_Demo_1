#create Azure RG
resource "azurerm_resource_group" "QuickCloudPOC"{
name ="QuickCloudPOC-RG"
location = "northeurope"
}


#create Azure Data factory
resource "azurerm_data_factory" "QuickCloudPOC"{
name ="QuickCloudPOC"
location = azurerm_resource_group.QuickCloudPOC.location
resource_group_name = azurerm_resource_group.QuickCloudPOC.name
}

#create ADF linked web services
resource "azurerm_data_factory_linked_service_web" "QuickCloudPOC"{
name = "QuickCloudPOClinkedservice"
resource_group_name = azurerm_resource_group.QuickCloudPOC.name
data_factory_name = azurerm_data_factory.QuickCloudPOC.name
authentication_type = "Anonymous"
url = "https://www.bing.com"
}

#Create ADF data set http
resource "azurerm_data_factory_dataset_http" "QuickCloudPOC"{
name="QuickCloudPOCDataSet"
resource_group_name = azurerm_resource_group.QuickCloudPOC.name
data_factory_name = azurerm_data_factory.QuickCloudPOC.name
linked_service_name = azurerm_data_factory_linked_service_web.QuickCloudPOC.name
relative_url = "http://www.bing.com"
request_body = "foo-bar"
request_method = "POST"
}


# Azure EventHub Terraform Module

This Terraform module creates an Azure EventHub resource within an existing EventHub Namespace.

## Usage

```hcl
module "event_hub" {
  source = "./event-hub"

  namespace_id      = azurerm_eventhub_namespace.example.id
  event_hub_name    = "my-event-hub"
  partition_count   = 2
  message_retention = 7
}
```

## Requirements

- Terraform >= 1.0
- Azure Provider >= 3.0
- An existing EventHub Namespace (provide the namespace ID via `namespace_id` variable)

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| namespace_id | The ID of the EventHub Namespace | string | n/a | yes |
| event_hub_name | The name of the EventHub | string | n/a | yes |
| partition_count | The number of partitions for the EventHub (1-32) | number | 2 | no |
| message_retention | The number of days to retain messages (1-90) | number | 1 | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the EventHub |
| name | The name of the EventHub |
| partition_count | The number of partitions in the EventHub |

## Example

See the module in action with a complete namespace and event hub:

```hcl
resource "azurerm_eventhub_namespace" "example" {
  name                = "example-namespace"
  location            = "East US"
  resource_group_name = azurerm_resource_group.example.name
  sku                 = "Standard"
  capacity            = 1
}

module "event_hub" {
  source = "./event-hub"

  namespace_id      = azurerm_eventhub_namespace.example.id
  event_hub_name    = "processing-events"
  partition_count   = 4
  message_retention = 7
}
```

output "id" {
  description = "The ID of the EventHub"
  value       = azurerm_eventhub.this.id
}

output "name" {
  description = "The name of the EventHub"
  value       = azurerm_eventhub.this.name
}

output "partition_count" {
  description = "The number of partitions in the EventHub"
  value       = azurerm_eventhub.this.partition_count
}

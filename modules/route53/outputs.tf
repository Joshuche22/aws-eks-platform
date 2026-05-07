output "public_zone_id" {
  description = "ID of the public hosted zone"
  value       = var.create_public_zone ? aws_route53_zone.public[0].zone_id : ""
}

output "public_zone_name" {
  description = "Name of the public hosted zone"
  value       = var.create_public_zone ? aws_route53_zone.public[0].name : ""
}

output "private_zone_id" {
  description = "ID of the private hosted zone"
  value       = var.create_private_zone ? aws_route53_zone.private[0].zone_id : ""
}

output "private_zone_name" {
  description = "Name of the private hosted zone"
  value       = var.create_private_zone ? aws_route53_zone.private[0].name : ""
}

output "public_zone_name_servers" {
  description = "Name servers for the public hosted zone"
  value       = var.create_public_zone ? aws_route53_zone.public[0].name_servers : []
}

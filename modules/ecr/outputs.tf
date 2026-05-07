output "repository_urls" {
  description = "Map of repository names to their URLs"
  value       = { for k, v in aws_ecr_repository.main : k => v.repository_url }
}

output "repository_arns" {
  description = "Map of repository names to their ARNs"
  value       = { for k, v in aws_ecr_repository.main : k => v.arn }
}

output "registry_id" {
  description = "The registry ID where the repositories were created"
  value       = length(var.repositories) > 0 ? values(aws_ecr_repository.main)[0].registry_id : ""
}

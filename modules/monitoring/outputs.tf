output "sns_topic_arn" {
  description = "ARN of the SNS topic for CloudWatch alarms"
  value       = var.enable_cloudwatch_alarms ? aws_sns_topic.alarms[0].arn : ""
}

output "prometheus_namespace" {
  description = "Kubernetes namespace where Prometheus is deployed"
  value       = "monitoring"
}

output "grafana_service_name" {
  description = "Kubernetes service name for Grafana"
  value       = "prometheus-stack-grafana"
}

output "cpu_alarm_arn" {
  description = "ARN of the CPU utilisation CloudWatch alarm"
  value       = var.enable_cloudwatch_alarms ? aws_cloudwatch_metric_alarm.node_cpu[0].arn : ""
}

output "memory_alarm_arn" {
  description = "ARN of the memory utilisation CloudWatch alarm"
  value       = var.enable_cloudwatch_alarms ? aws_cloudwatch_metric_alarm.node_memory[0].arn : ""
}
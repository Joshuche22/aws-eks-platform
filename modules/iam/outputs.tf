output "eks_cluster_role_arn" {
  description = "ARN of the EKS cluster IAM role"
  value       = aws_iam_role.eks_cluster.arn
}

output "eks_cluster_role_name" {
  description = "Name of the EKS cluster IAM role"
  value       = aws_iam_role.eks_cluster.name
}

output "eks_node_group_role_arn" {
  description = "ARN of the EKS node group IAM role"
  value       = aws_iam_role.eks_node_group.arn
}

output "eks_node_group_role_name" {
  description = "Name of the EKS node group IAM role"
  value       = aws_iam_role.eks_node_group.name
}

output "irsa_load_balancer_controller_role_arn" {
  description = "ARN of the load balancer controller IRSA role"
  value       = var.enable_irsa ? aws_iam_role.irsa_load_balancer_controller[0].arn : ""
}

output "irsa_cluster_autoscaler_role_arn" {
  description = "ARN of the cluster autoscaler IRSA role"
  value       = var.enable_irsa ? aws_iam_role.irsa_cluster_autoscaler[0].arn : ""
}

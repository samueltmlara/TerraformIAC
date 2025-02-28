output "subnetpublic" {
  description = "Id da subnet pública"
  value       = aws_subnet.subnetpublic.id
}

output "subnetprivate" {
  description = "Id da subnet privadao"
  value       = aws_subnet.subnetprivate.id
}

output "security_group_id" {
  description = "ID da Security group"
  value       = aws_security_group.Terraform_SG.id

}
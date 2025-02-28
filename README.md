# Projeto Terraform - Infraestrutura AWS

Este projeto implementa uma infraestrutura na AWS utilizando Terraform como IaC (Infrastructure as Code).

## Descrição
A infraestrutura criada inclui:
- Uma VPC personalizada
- Uma subnet pública e uma privada
- Um Internet Gateway para a subnet pública
- Uma tabela de rotas pública e uma privada
- Um NAT Gateway para a subnet privada
- Instâncias EC2 rodando Ubuntu e Amazon Linux
- Uso do S3 como backend remoto para o estado do Terraform

## Requisitos
- Terraform >= 1.3.0
- AWS CLI configurado
- Chave SSH pública para acesso às instâncias

## Como Usar
```sh
terraform init
terraform plan
terraform apply -auto-approve
```

<!DOCTYPE html>
<html>
<body>
    <h1>Projeto Terraform - Infraestrutura AWS</h1>
    <p>Este projeto implementa uma infraestrutura na AWS utilizando Terraform como IaC (Infrastructure as Code).</p>
    
    <h2>Descrição</h2>
    <p>A infraestrutura criada inclui:</p>
    <ul>
        <li>Uma VPC personalizada</li>
        <li>Uma subnet pública e uma privada</li>
        <li>Um Internet Gateway para a subnet pública</li>
        <li>Uma tabela de rotas pública e uma privada</li>
        <li>Um NAT Gateway para a subnet privada</li>
        <li>Instâncias EC2 rodando Ubuntu e Amazon Linux</li>
        <li>Uso do S3 como backend remoto para o estado do Terraform</li>
    </ul>
    
    <h2>Requisitos</h2>
    <ul>
        <li>Terraform >= 1.3.0</li>
        <li>AWS CLI configurado</li>
        <li>Chave SSH pública para acesso às instâncias</li>
    </ul>

    <h2>Como Usar</h2>
    <pre>
    terraform init
    terraform plan
    terraform apply -auto-approve
    </pre>

    <h2>Licença</h2>
    <p>Este projeto é open-source e pode ser utilizado livremente.</p>
</body>
</html>

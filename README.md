# Projeto de Infraestrutura RDS Postgres na AWS

Este repositório contém o código-fonte e a automação para provisionamento e gerenciamento de um banco de dados RDS Postgres na AWS utilizando Terraform e GitHub Actions. Além disso, integra um processo de Integração Contínua e Implantação Contínua (CI/CD) para automatizar o fluxo de desenvolvimento, teste e implantação.

## Visão Geral

Este projeto visa automatizar o processo de criação e gerenciamento de um banco de dados RDS Postgres na AWS. Ele utiliza o Terraform para definir a infraestrutura como código (IaC) e GitHub Actions para automação de implantação. O processo de CI/CD envolve a seguinte sequência:

1. **Integração Contínua (CI)**: Cada vez que há uma alteração no repositório, os testes automatizados são executados para garantir a integridade do código e evitar regressões.

2. **Implantação Contínua (CD)**: Após a aprovação dos testes, o código é implantado automaticamente no banco de dados RDS Postgres na AWS, garantindo um fluxo de entrega rápido e confiável.

Este processo automatizado permite uma entrega contínua de valor aos usuários finais, reduzindo o tempo de desenvolvimento e aumentando a eficiência da equipe.

## Componentes

O projeto consiste nos seguintes componentes principais:

1. **Terraform**: O Terraform é uma ferramenta de infraestrutura como código que permite definir e provisionar recursos de infraestrutura de forma declarativa.

2. **RDS Postgres**: O RDS Postgres é um serviço gerenciado de banco de dados relacional da AWS, que oferece escalabilidade, segurança e alta disponibilidade.

3. **AWS (Amazon Web Services)**: O AWS é o provedor de serviços em nuvem onde a infraestrutura será provisionada. Isso inclui o RDS Postgres, grupos de segurança, sub-redes, etc.

4. **GitHub Actions**: GitHub Actions é uma ferramenta de automação integrada ao GitHub, que permite criar fluxos de trabalho automatizados para compilar, testar, implantar e automatizar processos de desenvolvimento de software.

## Pré-requisitos

Antes de começar, você precisa ter os seguintes requisitos:

- Conta na AWS com as credenciais de acesso configuradas.
- Conta no GitHub.
- Terraform instalado localmente. Você pode encontrar instruções de instalação em [Terraform Installation Guide](https://learn.hashicorp.com/tutorials/terraform/install-cli).
- AWS CLI (Command Line Interface) instalada e configurada com as credenciais da sua conta AWS.

## Configuração Local

1. Clone este repositório:

    ```bash
    git clone https://github.com/seu-usuario/nome-do-repositorio.git
    cd nome-do-repositorio
    ```

2. Defina as variáveis de ambiente:

    ```bash
    export TF_VAR_access_key=valor_da_chave
    export TF_VAR_secret_key=valor_da_chave
    export TF_VAR_vpc_id=id_da_vpc
    export TF_VAR_list_subnet=lista_de_subredes
    export TF_VAR_db_username=nome_usuario_banco
    export TF_VAR_db_password=senha_banco
    ```


3. Utilize os comandos:

    ```bash
    terraform init
    terraform fmt
    terraform plan
    terraform apply
    ```

## Configuração para uso do Github Actions

1. Defina as secrets para o projeto no Github:

    - `ACCESS_KEY`
    - `SECRET_KEY`
    - `AMI_KEY_PAIR_NAME`
    - `VPC_ID`
    - `DB_USERNAME`
    - `DB_PASSWORD`

2. Suba um novo commit para que sua infraestrutura seja gerada.

**Observação**:

Não se esqueça de excluir suas alterações na AWS para evitar gastos desnecessários, utilize o comando:

```bash
terraform destroy

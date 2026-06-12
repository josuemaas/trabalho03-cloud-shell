# Trabalho 03 - Linux, Shell Script e Cloud Computing

## Aluno

Josué Maas

## Instituição

UNIDAVI

## Tema

Infraestrutura para um Pequeno Escritório Contábil

## Descrição do Projeto

Este projeto simula um ambiente Linux utilizado por um pequeno escritório contábil em um cenário de Cloud Computing. O ambiente foi criado com Docker e Ubuntu, utilizando Apache para hospedar um site estático e scripts Shell para automatizar rotinas operacionais.

As automações desenvolvidas contemplam atualização do sistema, instalação e validação do Apache, criação de estrutura de diretórios, backup de arquivos contábeis, deploy do site, gerenciamento de processos, monitoramento do sistema, configuração de usuários e permissões e geração de relatório operacional.

## Tecnologias Utilizadas

- Linux Ubuntu 22.04
- Docker
- Docker Compose
- Apache
- Shell Script
- GitHub
- DockerHub

## Estrutura do Projeto

```text
trabalho03-cloud-shell/
├── Dockerfile
├── docker-compose.yml
├── README.md
├── scripts/
│   ├── 01_update.sh
│   ├── 02_apache.sh
│   ├── 03_estrutura.sh
│   ├── 04_backup.sh
│   ├── 05_deploy.sh
│   ├── 06_processos.sh
│   ├── 07_monitoramento.sh
│   ├── 08_usuarios_permissoes.sh
│   ├── 09_relatorio.sh
│   └── menu.sh
├── source/
│   ├── index.html
│   ├── sobre.html
│   └── assets/
├── backups/
├── logs/
└── evidencias/
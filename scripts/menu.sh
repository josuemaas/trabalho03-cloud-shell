#!/bin/bash

opcao=99

while [ "$opcao" != "0" ]
do
    clear

    echo "==================================="
    echo "Criado por: Josué Maas"
    echo "Instituição: UNIDAVI"
    echo "Tema: Escritório Contábil"
    echo "==================================="
    echo ""
    echo "===== MENU DEVOPS CLOUD ====="
    echo "1 - Atualizar sistema"
    echo "2 - Instalar Apache"
    echo "3 - Criar estrutura do projeto"
    echo "4 - Realizar backup"
    echo "5 - Fazer deploy"
    echo "6 - Ver processos"
    echo "7 - Monitorar sistema"
    echo "8 - Configurar usuários e permissões"
    echo "9 - Gerar relatório"
    echo "0 - Sair"
    echo ""

    read -p "Escolha uma opção: " opcao

    case $opcao in

        1)
            /app/scripts/01_update.sh
            ;;

        2)
            /app/scripts/02_apache.sh
            ;;

        3)
            /app/scripts/03_estrutura.sh
            ;;

        4)
            /app/scripts/04_backup.sh
            ;;

        5)
            /app/scripts/05_deploy.sh
            ;;

        6)
            6)
    clear
    echo "===== GERENCIAMENTO DE PROCESSOS ====="
    echo "1 - Listar processos"
    echo "2 - Buscar processo por nome"
    echo "3 - Matar processo por PID"
    echo "0 - Voltar"
    echo ""

    read -p "Escolha uma opção: " opcao_processo

    case "$opcao_processo" in
        1)
            /app/scripts/06_processos.sh listar
            ;;
        2)
            read -p "Digite o nome do processo: " nome_processo
            /app/scripts/06_processos.sh buscar "$nome_processo"
            ;;
        3)
            read -p "Digite o PID do processo: " pid_processo
            /app/scripts/06_processos.sh matar "$pid_processo"
            ;;
        0)
            echo "Voltando ao menu principal..."
            ;;
        *)
            echo "Opção inválida."
            ;;
    esac
    ;;

        7)
            /app/scripts/07_monitoramento.sh
            ;;

        8)
            /app/scripts/08_usuarios_permissoes.sh
            ;;

        9)
            /app/scripts/09_relatorio.sh
            ;;

        0)
            echo "Saindo..."
            ;;

        *)
            echo "Opção inválida."
            ;;
    esac

    echo ""
    read -p "Pressione ENTER para continuar..."
done

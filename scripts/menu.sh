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
            echo ""
            echo "Para testar processos execute:"
            echo "./06_processos.sh listar"
            echo "./06_processos.sh buscar apache"
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
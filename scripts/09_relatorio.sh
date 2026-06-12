#!/bin/bash

RELATORIO="/app/logs/relatorio_execucao.txt"

gerar_relatorio() {

    echo "=========================================" > $RELATORIO
    echo "RELATÓRIO OPERACIONAL" >> $RELATORIO
    echo "Projeto: Infraestrutura para Pequeno Escritório Contábil" >> $RELATORIO
    echo "Data: $(date)" >> $RELATORIO
    echo "=========================================" >> $RELATORIO

    echo "" >> $RELATORIO
    echo "===== ESPAÇO EM DISCO =====" >> $RELATORIO
    df -h >> $RELATORIO

    echo "" >> $RELATORIO
    echo "===== DIRETÓRIOS DO PROJETO =====" >> $RELATORIO
    du -sh /app/* >> $RELATORIO 2>/dev/null

    echo "" >> $RELATORIO
    echo "===== STATUS DO APACHE =====" >> $RELATORIO

    if pgrep apache2 > /dev/null; then
        echo "Apache: EM EXECUÇÃO" >> $RELATORIO
    else
        echo "Apache: PARADO" >> $RELATORIO
    fi

    echo "" >> $RELATORIO
    echo "===== BACKUPS =====" >> $RELATORIO
    ls -lh /app/backups >> $RELATORIO

    echo "" >> $RELATORIO
    echo "===== LOGS =====" >> $RELATORIO
    ls -lh /app/logs >> $RELATORIO

    echo "" >> $RELATORIO
    echo "===== SITE PUBLICADO =====" >> $RELATORIO
    ls -lh /var/www/html >> $RELATORIO

    echo "" >> $RELATORIO
    echo "===== USUÁRIOS =====" >> $RELATORIO
    grep contador_user /etc/passwd >> $RELATORIO

    echo "" >> $RELATORIO
    echo "===== PERMISSÕES =====" >> $RELATORIO
    ls -ld /app/escritorio_contabil/clientes >> $RELATORIO

    echo ""
    echo "[OK] Relatório gerado com sucesso!"
    echo "Arquivo: $RELATORIO"
}

gerar_relatorio
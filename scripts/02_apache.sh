#!/bin/bash

LOG="/app/logs/apache.log"

instalar_apache() {
    echo "===== INSTALAÇÃO DO APACHE =====" | tee -a "$LOG"
    echo "Data: $(date)" | tee -a "$LOG"

    apt update
    apt install -y apache2

    if [ $? -eq 0 ]; then
        echo "[OK] Apache instalado com sucesso." | tee -a "$LOG"
    else
        echo "[ERRO] Falha ao instalar Apache." | tee -a "$LOG"
    fi
}

verificar_apache() {
    echo "===== VERIFICAÇÃO DO APACHE =====" | tee -a "$LOG"

    if command -v apache2 > /dev/null; then
        echo "[OK] Apache encontrado no sistema." | tee -a "$LOG"
    else
        echo "[ERRO] Apache não encontrado." | tee -a "$LOG"
    fi
}

versao_apache() {
    echo "===== VERSÃO DO APACHE =====" | tee -a "$LOG"
    apache2 -v | tee -a "$LOG"
}

instalar_apache
verificar_apache
versao_apache
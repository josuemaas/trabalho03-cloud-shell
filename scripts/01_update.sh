#!/bin/bash

LOG="/app/logs/update.log"

atualizar_sistema() {
    echo "===== ATUALIZAÇÃO DO SISTEMA =====" | tee -a "$LOG"
    echo "Data: $(date)" | tee -a "$LOG"

    apt update && apt upgrade -y

    if [ $? -eq 0 ]; then
        echo "[OK] Sistema atualizado com sucesso." | tee -a "$LOG"
    else
        echo "[ERRO] Falha ao atualizar o sistema." | tee -a "$LOG"
    fi
}

atualizar_sistema
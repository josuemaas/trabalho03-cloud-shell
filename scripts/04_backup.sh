#!/bin/bash

LOG="/app/logs/backup.log"
ORIGEM="/app/escritorio_contabil"
DESTINO="/app/backups"
DATA=$(date +"%Y-%m-%d_%H-%M")
ARQUIVO="backup_escritorio_contabil_$DATA.tar.gz"

realizar_backup() {
    echo "===== BACKUP DO ESCRITÓRIO CONTÁBIL =====" | tee -a "$LOG"
    echo "Data: $(date)" | tee -a "$LOG"

    mkdir -p "$DESTINO"

    if [ ! -d "$ORIGEM" ]; then
        echo "[ERRO] Diretório de origem não encontrado: $ORIGEM" | tee -a "$LOG"
        exit 1
    fi

    tar -czf "$DESTINO/$ARQUIVO" "$ORIGEM"

    if [ -f "$DESTINO/$ARQUIVO" ]; then
        echo "[OK] Backup criado com sucesso: $DESTINO/$ARQUIVO" | tee -a "$LOG"
    else
        echo "[ERRO] Falha ao criar backup." | tee -a "$LOG"
    fi
}

realizar_backup
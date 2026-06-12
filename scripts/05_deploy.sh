#!/bin/bash

LOG="/app/logs/deploy.log"
ORIGEM="/app/source"
DESTINO="/var/www/html"

realizar_deploy() {

    echo "===== DEPLOY DO SITE CONTÁBIL =====" | tee -a "$LOG"
    echo "Data: $(date)" | tee -a "$LOG"

    rm -rf ${DESTINO:?}/*

    cp -r "$ORIGEM"/* "$DESTINO"/

    echo "===== ARQUIVOS PUBLICADOS =====" | tee -a "$LOG"

    ls -la "$DESTINO" | tee -a "$LOG"

    if [ -f "$DESTINO/index.html" ]; then
        echo "[OK] Deploy realizado com sucesso." | tee -a "$LOG"
    else
        echo "[ERRO] index.html não encontrado." | tee -a "$LOG"
    fi
}

realizar_deploy
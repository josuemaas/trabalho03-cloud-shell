#!/bin/bash

LOG="/app/logs/permissoes.log"

GRUPO="contabilidade_ops"
USUARIO="contador_user"
DIRETORIO="/app/escritorio_contabil/clientes"

configurar_permissoes() {

    echo "===== USUÁRIOS E PERMISSÕES =====" | tee -a "$LOG"
    echo "Data: $(date)" | tee -a "$LOG"

    if ! getent group $GRUPO > /dev/null; then
        groupadd $GRUPO
        echo "[OK] Grupo criado: $GRUPO" | tee -a "$LOG"
    fi

    if ! id $USUARIO > /dev/null 2>&1; then
        useradd -m -g $GRUPO $USUARIO
        echo "[OK] Usuário criado: $USUARIO" | tee -a "$LOG"
    fi

    chown -R $USUARIO:$GRUPO $DIRETORIO

    chmod -R 750 $DIRETORIO

    echo "[OK] Permissões aplicadas." | tee -a "$LOG"

    ls -ld $DIRETORIO | tee -a "$LOG"
}

configurar_permissoes
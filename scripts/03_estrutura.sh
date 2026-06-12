#!/bin/bash

LOG="/app/logs/estrutura.log"
BASE="/app/escritorio_contabil"

criar_estrutura() {
    echo "===== CRIAÇÃO DA ESTRUTURA DO ESCRITÓRIO CONTÁBIL =====" | tee -a "$LOG"
    echo "Data: $(date)" | tee -a "$LOG"

    if [ -d "$BASE" ]; then
        echo "[INFO] Estrutura antiga encontrada. Removendo com segurança..." | tee -a "$LOG"
        rm -rf "$BASE"
    fi

    mkdir -p "$BASE/clientes"
    mkdir -p "$BASE/documentos_fiscais"
    mkdir -p "$BASE/folha_pagamento"
    mkdir -p "$BASE/impostos"
    mkdir -p "$BASE/backups"
    mkdir -p "$BASE/logs"
    mkdir -p "$BASE/publicacao"

    touch "$BASE/clientes/lista_clientes.txt"
    touch "$BASE/documentos_fiscais/notas_fiscais.txt"
    touch "$BASE/folha_pagamento/funcionarios.txt"
    touch "$BASE/impostos/guias_impostos.txt"

    echo "[OK] Estrutura criada em $BASE" | tee -a "$LOG"
    ls -R "$BASE" | tee -a "$LOG"
}

criar_estrutura
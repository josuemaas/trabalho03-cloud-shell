#!/bin/bash

LOG="/app/logs/processos.log"

listar_processos() {
    echo "===== PROCESSOS ATIVOS =====" | tee -a "$LOG"
    ps aux | tee -a "$LOG"
}

buscar_processo() {

    if [ -z "$1" ]; then
        echo "[ERRO] Informe o nome do processo."
        echo "Exemplo: ./06_processos.sh buscar apache"
        exit 1
    fi

    echo "===== BUSCANDO PROCESSO: $1 =====" | tee -a "$LOG"

    ps aux | grep "$1" | grep -v grep | tee -a "$LOG"
}

matar_processo() {

    if [ -z "$1" ]; then
        echo "[ERRO] Informe o PID."
        echo "Exemplo: ./06_processos.sh matar 1234"
        exit 1
    fi

    echo "===== ENCERRANDO PROCESSO =====" | tee -a "$LOG"

    kill "$1"

    if [ $? -eq 0 ]; then
        echo "[OK] Processo encerrado." | tee -a "$LOG"
    else
        echo "[ERRO] Não foi possível encerrar o processo." | tee -a "$LOG"
    fi
}

case "$1" in

listar)
    listar_processos
    ;;

buscar)
    buscar_processo "$2"
    ;;

matar)
    matar_processo "$2"
    ;;

*)
    echo ""
    echo "Uso:"
    echo "./06_processos.sh listar"
    echo "./06_processos.sh buscar apache"
    echo "./06_processos.sh matar PID"
    ;;
esac
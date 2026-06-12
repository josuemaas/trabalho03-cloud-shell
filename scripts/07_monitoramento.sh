#!/bin/bash

LOG="/app/logs/monitoramento.log"

monitorar_sistema() {
    echo "===== MONITORAMENTO DO SISTEMA =====" | tee -a "$LOG"
    echo "Data: $(date)" | tee -a "$LOG"

    CPU=$(top -bn1 | grep "Cpu" | awk '{print 100 - $8}')
    MEMORIA=$(free | awk '/Mem:/ {printf("%.0f", $3/$2 * 100)}')
    DISCO=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

    echo "Uso de CPU: $CPU%" | tee -a "$LOG"
    echo "Uso de Memória RAM: $MEMORIA%" | tee -a "$LOG"
    echo "Uso de Disco: $DISCO%" | tee -a "$LOG"

    if (( $(echo "$CPU > 80" | bc -l) )); then
        echo "[ALERTA] Uso de CPU acima de 80%" | tee -a "$LOG"
    else
        echo "[OK] Uso de CPU dentro do esperado." | tee -a "$LOG"
    fi

    if [ "$MEMORIA" -gt 80 ]; then
        echo "[ALERTA] Uso de memória acima de 80%" | tee -a "$LOG"
    else
        echo "[OK] Uso de memória dentro do esperado." | tee -a "$LOG"
    fi

    if [ "$DISCO" -gt 80 ]; then
        echo "[ALERTA] Uso de disco acima de 80%" | tee -a "$LOG"
    else
        echo "[OK] Uso de disco dentro do esperado." | tee -a "$LOG"
    fi

    if pgrep apache2 > /dev/null; then
        echo "[OK] Apache em execução." | tee -a "$LOG"
    else
        echo "[ALERTA] Apache não está em execução." | tee -a "$LOG"
    fi
}

monitorar_sistema
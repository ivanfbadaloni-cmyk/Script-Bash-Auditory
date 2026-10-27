#!/bin/bash

# =====================================
# Auditoría Linux
# =====================================

FECHA=$(date +"%Y-%m-%d_%H-%M-%S")
LOG="/var/log/auditoria_${FECHA}.log"

echo "Generando reporte en: $LOG"

{
echo " REPORTE DE AUDITORÍA"
echo " Fecha: $(date)"
echo " Host: $(hostname)"
echo " Kernel: $(uname -r)"

echo
echo "===== SISTEMA ====="
hostnamectl

echo
echo "===== UPTIME ====="
uptime

echo
echo "===== USO DE DISCO ====="
df -h

echo
echo "===== MEMORIA ====="
free -h

echo
echo "===== USUARIOS CONECTADOS ====="
who

echo
echo "===== PUERTOS EN ESCUCHA ====="
ss -tulnp

echo
echo "===== PUERTOS ABIERTOS ====="
ufw status verbose

echo
echo "===== PROCESOS QUE MÁS CPU CONSUMEN ====="
ps aux --sort=-%cpu | head -15

echo
echo "===== PROCESOS QUE MÁS RAM CONSUMEN ====="
ps aux --sort=-%mem | head -15

echo
echo "===== ÚLTIMOS LOGINS EXITOSOS ====="
if command -v last >/dev/null 2>&1; then
    last -n 20
else
    echo "Comando 'last' no disponible."
fi

echo
echo "===== INTENTOS DE LOGIN SSH FALLIDOS ====="

# Ubuntu/Debian modernos
journalctl -u ssh --since "24 hours ago" | grep "Failed password"

echo
echo "===== IPs CON MÁS INTENTOS FALLIDOS ====="

journalctl -u ssh --since "24 hours ago" \
| grep "Failed password" \
| awk '{print $(NF-3)}' \
| sort \
| uniq -c \
| sort -nr

echo
echo "===== USUARIOS EXISTENTES ====="
cut -d: -f1 /etc/passwd

echo
echo "===== ACTUALIZACIONES DISPONIBLES ====="
apt list --upgradable 2>/dev/null

} > "$LOG" 2>&1

echo
echo "Reporte guardado correctamente."
echo "Ubicación: $LOG

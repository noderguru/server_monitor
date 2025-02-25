#!/bin/bash

# Настройки Telegram
TG_BOT_TOKEN=""
TG_CHAT_ID=""
TG_THREAD_ID=""  # опционально (для чатов)
SERVER_NAME="имя сервера"
DISK_MAX=70    # Максимальное допустимое использование диска (в %)
CPU_MAX=70     # Максимальная допустимая загрузка CPU (в %)
RAM_MAX=80     # Максимальное допустимое использование RAM (в %)

DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')
CPU_USAGE=$(mpstat 1 5 | awk '/Average:/ {printf "%.1f", 100 - $NF}')
RAM_USAGE=$(free | grep Mem | awk '{printf "%.0f", $3/$2 * 100.0}')

TIME_INFO="⏰ Time: $(date +'%Y-%m-%d %H:%M:%S')"
IP_INFO="🔒 Local IP: $(hostname -I | awk '{print $1}')"

DISK_ALERT="⚠️ DISK WARNING! ⚠️
${TIME_INFO}
${IP_INFO}
🖥 Server: $SERVER_NAME
💾 Disk usage: $DISK_USAGE%"

CPU_ALERT="🚨 CPU OVERLOAD! 🚨
${TIME_INFO}
${IP_INFO}
🖥 Server: $SERVER_NAME
🔥 CPU load: $CPU_USAGE%"

RAM_ALERT="🔴 RAM CRITICAL! 🔴
${TIME_INFO}
${IP_INFO}
🖥 Server: $SERVER_NAME
🧠 Memory usage: $RAM_USAGE%"

send_tg_notify() {
    local message=$1
    curl -s -X POST "https://api.telegram.org/bot${TG_BOT_TOKEN}/sendMessage" \
        -d chat_id="${TG_CHAT_ID}" \
        -d message_thread_id="${TG_THREAD_ID}" \
        -d text="${message}" \
        -d parse_mode="HTML"
}

if [ $DISK_USAGE -gt $DISK_MAX ]; then
    send_tg_notify "$DISK_ALERT"
fi

if (( $(echo "$CPU_USAGE > $CPU_MAX" | bc -l) )); then
    send_tg_notify "$CPU_ALERT"
fi

if [ $RAM_USAGE -gt $RAM_MAX ]; then
    send_tg_notify "$RAM_ALERT"
fi

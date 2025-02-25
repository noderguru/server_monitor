# server_monitor

Скрипт для мониторинга ресурсов сервера с уведомлениями в Telegram. Отслеживает использование диска, CPU и RAM, отправляя алерты при превышении заданных порогов.

🌟 Особенности

Мониторинг в реальном времени:

Дисковое пространство

Нагрузка CPU

Использование RAM

Кастомизируемые пороговые значения

Интеграция с Telegram

Поддержка тредов в группах

Автоматическое определение:

Локального IP

Текущего времени

⚙️ Установка:

Скачайте скрипт:

```git clone https://github.com/noderguru/server_monitor```

Сделайте исполняемым:

```chmod +x server_monitor.sh```

Установите зависимости:

```sudo apt install sysstat bc -y```

🔧 Настройка

Создайте Telegram бота через @BotFather

Получите ID чата через @userinfobot

Отредактируйте скрипт:

nano server_monitor.sh
bash
Copy
# Настройки Telegram
TG_BOT_TOKEN="123456:ABC-DEF1234ghIkl-zyx57W2v1u123ew11"
TG_CHAT_ID="-1001234567890"
TG_THREAD_ID="123"  # опционально (для тредов в группах)

# Кастомизация сервера
SERVER_NAME="My Awesome Server"

# Пороговые значения
DISK_MAX=70    # Максимум диска (%)
CPU_MAX=70     # Максимум CPU (%)
RAM_MAX=80     # Максимум RAM (%)
🚀 Использование
Ручной запуск:

bash
Copy
./server_monitor.sh
Автоматизация через cron (проверка каждые 15 минут):

bash
Copy
crontab -e
Добавьте строку:

bash
Copy
*/15 * * * * /path/to/server_monitor.sh >/dev/null 2>&1
📨 Пример уведомления
Copy
🚨 CPU OVERLOAD! 🚨
⏰ Time: 2024-03-15 14:30:45
🔒 Local IP: 192.168.1.100
🖥 Server: My Awesome Server
🔥 CPU load: 85.3%

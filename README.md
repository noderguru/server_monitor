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

```git clone https://github.com/noderguru/server_monitor.git```

Сделайте исполняемым:

```chmod +x server_monitor.sh```

Установите зависимости:

```sudo apt install sysstat bc -y```

🔧 Настройка

Создайте Telegram бота через @BotFather (нужен для TG_BOT_TOKEN) затем зайдите в него и нажмите "start"

Получите ID чата через @userinfobot (нужен для TG_CHAT_ID)

Отредактируйте скрипт:

```nano server_monitor.sh```

# Настройки Telegram

TG_BOT_TOKEN="123456:ABC-DEF1234ghIkl-zyx57W2v1u123ew11 это пример!!!"

TG_CHAT_ID="-1001234567890 это пример!!!"

TG_THREAD_ID=""  # опционально (для тредов в группах) если не надо для чатов, то оставляем значение в кавычках пустым

# Кастомизация сервера

SERVER_NAME="My Awesome Server"

# Пороговые значения

DISK_MAX=70    # Максимум диска (%)

CPU_MAX=70     # Максимум CPU (%)

RAM_MAX=80     # Максимум RAM (%)

🚀 Использование

Ручной запуск (можно использовать для проверки работоспособности и корректной настройки):

```./server_monitor.sh```

Автоматизация через cron (проверка каждые 15 минут):

```crontab -e```

Добавьте строку:

*/15 * * * * /путь к файлу/server_monitor.sh >/dev/null 2>&1

📨 Пример уведомления

🚨 CPU OVERLOAD! 🚨
⏰ Time: 2024-03-15 14:30:45
🔒 Local IP: 192.168.1.100
🖥 Server: My Awesome Server
🔥 CPU load: 85.3%

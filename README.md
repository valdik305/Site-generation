# 🔒 Nginx + SSL Production Setup

Готовая конфигурация Nginx с SSL-сертификатами от Let's Encrypt (Certbot), включающая лучшие практики безопасности и производительности.

## ✨ Возможности
- ✅ Полная поддержка HTTPS с автоматическим перенаправлением с HTTP
- ✅ SSL-настройки уровня Intermediate (рекомендации Mozilla)
- ✅ Заголовки безопасности (OWASP)
- ✅ HTTP/2 для ускорения загрузки
- ✅ Кеширование статики
- ✅ Готовый скрипт для быстрой настройки сертификатов
- ✅ Автоматическое обновление сертификатов

## 📁 Структура проекта
nginx_ssl_setup/
├── site_gen.com # Тестовый сайт
├── nginx/
│ ├── sites-available/
│ │ └── nginx_site.conf # Шаблон конфига с SSL
│ └── snippets/
│ ├── ssl-params.conf # SSL-настройки (протоколы, шифры)
│ └── security-headers.conf # Заголовки безопасности
├── scripts/
│ └── init-ssl.sh # Скрипт настройки SSL
└── README.md

text

## 🚀 Быстрый старт

### 1️⃣ Клонируйте репозиторий
```bash
git clone https://github.com/your-username/nginx-ssl-setup.git
cd nginx-ssl-setup
2️⃣ Настройте конфиг под ваш домен

bash
# Отредактируйте файл конфигурации
nano nginx/sites-available/nginx_site.conf
# Замените example.com на ваш домен
3️⃣ Установите конфиг в Nginx

bash
# Копируем конфигурацию
sudo cp nginx/sites-available/nginx_site.conf /etc/nginx/sites-available/
sudo cp -r nginx/snippets /etc/nginx/

# Создаём симлинк
sudo ln -s /etc/nginx/sites-available/nginx_site.conf /etc/nginx/sites-enabled/
4️⃣ Создайте директорию для сайта

bash
# Создаём папку и копируем тестовый сайт
sudo mkdir -p /var/www/html1
sudo cp site_gen.com /var/www/html1/
5️⃣ Настройте SSL

bash
# Для тестового домена используйте localhost
sudo ./scripts/init-ssl.sh localhost
6️⃣ Проверьте результат

bash
# Проверка конфигурации
sudo nginx -t

# Перезагрузка Nginx
sudo systemctl reload nginx
📋 Требования

ОС: Ubuntu/Debian (или любой Linux с Nginx)
Nginx: версия 1.14+
Certbot: для получения SSL-сертификатов
Домен: должен быть направлен на ваш сервер (порты 80 и 443 открыты)
🔧 Для продакшена

При использовании на реальном домене:

Замените localhost на ваш домен в скрипте
Убедитесь, что DNS-записи указывают на ваш сервер
Проверьте открытые порты: 80 и 443
📚 Полезные команды

Проверка SSL-сертификата

bash
sudo certbot certificates
Обновление сертификата вручную

bash
sudo certbot renew --dry-run  # тест
sudo certbot renew            # реальное обновление
Просмотр логов Nginx

bash
sudo tail -f /var/log/nginx/error.log
sudo tail -f /var/log/nginx/access.log
🛡️ Проверка безопасности

После установки проверьте ваш сайт:

SSL Labs Test — оценка SSL-конфигурации
Security Headers — проверка заголовков
📄 Лицензия

MIT

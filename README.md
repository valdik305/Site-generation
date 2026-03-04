# 🔒 Nginx + SSL Production Setup

Готовая конфигурация моего сайта на Nginx с SSL-сертификатами от Let's Encrypt (Certbot), включающая лучшие практики безопасности и производительности.

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


## 🚀 Быстрый старт

## 1️⃣ Клонируйте репозиторий
git clone https://github.com/your-username/nginx-ssl-setup.git
cd nginx-ssl-setup

##2️⃣  Настройте конфиг под ваш домен
Отредактируйте файл конфигурации:
bash
nano nginx/sites-available/nginx_site.conf
Важно: Замените example.com на ваш реальный домен.

##3️⃣ Установите конфиг в Nginx
#Перейдите в папку проекта:
bash
cd /home/user/nginx_ssl_setup
#Скопируйте конфигурацию:
bash
sudo cp nginx/sites-available/nginx_site.conf /etc/nginx/sites-available/
sudo cp -r nginx/snippets /etc/nginx/
#Создайте симлинк для активации сайта:
bash
sudo ln -s /etc/nginx/sites-available/nginx_site.conf /etc/nginx/sites-enabled/

##4️⃣ Создайте директорию для сайта
#Создайте папку и перейдите в неё:
bash
cd /var/www && sudo mkdir -p html1 && cd html1
#Скопируйте тестовый сайт:
bash
sudo cp /home/user/nginx_ssl_setup/site_gen.com .

##5️⃣ Настройте SSL
#Запустите скрипт настройки SSL:
bash
sudo ./scripts/init-ssl.sh localhost
#Для реального домена замените localhost на ваш домен.

##6️⃣ Проверьте результат
#Проверьте конфигурацию Nginx:
bash
sudo nginx -t
#Перезагрузите Nginx:
bash
sudo systemctl reload nginx

##📋 Требования
ОС: Ubuntu/Debian (или любой Linux с Nginx)
Nginx: версия 1.14+
Certbot: для получения SSL-сертификатов
Домен: должен быть направлен на ваш сервер (порты 80 и 443 открыты)
🔧 Для продакшена (реальный домен)

Замените localhost на ваш домен в скрипте init-ssl.sh
Убедитесь, что DNS-записи указывают на ваш сервер
Проверьте, что порты 80 и 443 открыты в firewall


##📚 Полезные команды
Проверка SSL-сертификата

bash
sudo certbot certificates
Обновление сертификата вручную

bash
# Тестовый прогон
sudo certbot renew --dry-run

# Реальное обновление
sudo certbot renew
Просмотр логов Nginx

bash
# Ошибки
sudo tail -f /var/log/nginx/error.log

# Доступы
sudo tail -f /var/log/nginx/access.log


🛡️ Проверка безопасности

После установки проверьте ваш сайт:

SSL Labs Test — оценка SSL-конфигурации
Security Headers — проверка заголовков


📄 Лицензия

MIT


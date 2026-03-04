# 🔒 Nginx + SSL Production Setup

Сайт на Nginx с SSL-сертификатами от Let's Encrypt (Certbot), включающая лучшие практики безопасности и производительности.

## ✨ Возможности
- Полная поддержка HTTPS с автоматическим перенаправлением с HTTP
- SSL-настройки уровня Intermediate (рекомендации Mozilla)
- Заголовки безопасности (OWASP)
- HTTP/2 для ускорения загрузки
- Кеширование статики
- Готовый скрипт для быстрой настройки сертификатов
- Автоматическое обновление сертификатов

## 📁 Структура
nginx_ssl_setup/
│── site_gen.com # наполнение сайта
├── nginx/
│ ├── sites-available/
│ │ └── nginx_site.conf # Шаблон конфига сайта с SSL
│ └── snippets/
│ ├── ssl-params.conf # SSL-настройки (протоколы, шифры)
│ └── security-headers.conf # Заголовки безопасности
├── scripts/
│ └── init-ssl.sh # Скрипт для быстрой настройки SSL
└── docs/
└── certbot-setup.md # Инструкция по Certbot

text

## 🚀 Быстрый старт

1. **Клонируйте репозиторий**
   ```bash
   git clone https://github.com/your-username/nginx-ssl-setup.git
   cd nginx-ssl-setup
Настройте конфиг под ваш домен

#Установите конфиг в Nginx
bash
cd /home/user/nginx_ssl_setup
sudo cp nginx/sites-available/nginx_site.conf /etc/nginx/sites-available/
sudo cp -r nginx/snippets /etc/nginx/
sudo ln -s /etc/nginx/sites-available/nginx_site.conf /etc/nginx/sites-enabled/

# Из корня переместите файл site_gen.com в дирректорию /var/www/html1
cd /var/www && mkdir html1 && cd html1
cp /home/user/nginx_ssl_setup/site_gen.com ./

#Настройте SSL
bash
sudo ./scripts/init-ssl.sh localhost

#Проверьте результат
bash
sudo nginx -t
sudo systemctl reload nginx


#Tребования
Ubuntu/Debian (или любой Linux с Nginx)
Nginx 1.14+
Certbot
Домен, направленный на ваш сервер (порты 80 и 443 открыты)

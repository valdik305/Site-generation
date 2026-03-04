#!/bin/bash

# Скрипт для первоначальной настройки SSL через Certbot
# Использование: ./init-ssl.sh example.com

set -e  # Прерывать при ошибке

DOMAIN=$1
EMAIL="admin@$DOMAIN"  # Или укажи свой email

if [ -z "$DOMAIN" ]; then
    echo "❌ Ошибка: укажите домен"
    echo "Использование: $0 example.com"
    exit 1
fi

echo "🚀 Начинаем настройку SSL для $DOMAIN"

# Проверка, что Certbot установлен
if ! command -v certbot &> /dev/null; then
    echo "📦 Certbot не найден. Устанавливаем..."
    sudo apt update
    sudo apt install -y certbot python3-certbot-nginx
fi

# Проверка конфигурации Nginx
echo "🔍 Проверяем конфигурацию Nginx..."
sudo nginx -t

# Получение сертификата
echo "🔐 Получаем SSL-сертификат для $DOMAIN..."
sudo certbot --nginx -d "$DOMAIN" -d "www.$DOMAIN" --email "$EMAIL" --agree-tos --no-eff-email --redirect

# Генерация параметров DH (для усиления безопасности)
if [ ! -f /etc/nginx/dhparam.pem ]; then
    echo "🔑 Генерируем параметры DH (это может занять несколько минут)..."
    sudo openssl dhparam -out /etc/nginx/dhparam.pem 2048
fi

# Перезагрузка Nginx
echo "🔄 Перезагружаем Nginx..."
sudo systemctl reload nginx

echo "✅ Готово! SSL настроен для $DOMAIN"
echo "📝 Сертификат будет обновляться автоматически"

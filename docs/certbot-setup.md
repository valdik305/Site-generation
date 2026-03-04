# Настройка SSL с Certbot

## Установка Certbot
```bash
sudo apt update
sudo apt install certbot python3-certbot-nginx

#Получение сертификата

bash
sudo certbot --nginx -d example.com -d www.example.com
#Следуйте инструкциям на экране. Certbot автоматически:

1 Получит сертификат
2 Обновит конфигурацию Nginx
3 Настроит автоматическое продление

#Проверка автоматического продления

bash
sudo certbot renew --dry-run
#Важные команды

 sudo certbot certificates #Просмотр сертификатов
 sudo certbot renew --force-renewal #Принудительное обновление
 sudo certbot delete --cert-name example.com #Удаление сертификата

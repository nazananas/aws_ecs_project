# Используем официальный образ Nginx
FROM nginx:latest

# Создаем директорию для изображений
RUN mkdir -p /app/media

# Копируем конфигурацию Nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Копируем файлы из локальной директории в контейнер
COPY media /app/media
COPY index.html /usr/share/nginx/html/index.html

# Даем права на доступ к media
RUN chmod -R 755 /app/media && chown -R nginx:nginx /app/media

# Открываем порт 80
EXPOSE 80

# Запуск Nginx
CMD ["nginx", "-g", "daemon off;"]


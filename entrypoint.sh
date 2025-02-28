#!/bin/bash

# Выполняем миграции
python manage.py migrate

# Собираем статические файлы
python manage.py collectstatic --noinput

# Запускаем сервер
gunicorn --bind 0.0.0.0:8000 mysite.wsgi 
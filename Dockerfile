FROM python:3.8-slim

WORKDIR /app

# Установка системных зависимостей
RUN apt-get update && apt-get install -y \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Копирование requirements.txt и установка зависимостей
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Копирование проекта
COPY . .

# Создадим директорию для базы данных и дадим права
RUN mkdir -p /app/data && \
    chmod 777 /app/data

# Переменные окружения
ENV PYTHONUNBUFFERED=1
ENV DJANGO_SETTINGS_MODULE=mysite.settings

# Порт
EXPOSE 8000

# Создадим скрипт для запуска
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

# Изменяем команду запуска напрямую
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
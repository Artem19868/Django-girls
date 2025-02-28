#!/bin/bash

# Загружаем переменные окружения
source .env

# Авторизуемся в registry
echo $DOCKER_PASSWORD | docker login $DOCKER_REGISTRY -u $DOCKER_USERNAME --password-stdin

# Собираем образ
docker build -t $DOCKER_REGISTRY/$DOCKER_USERNAME/django-girls:latest .

# Публикуем образ
docker push $DOCKER_REGISTRY/$DOCKER_USERNAME/django-girls:latest
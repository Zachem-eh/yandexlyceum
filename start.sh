#!/bin/bash

set -eu

export PYTHONUNBUFFERED=true

VIRTUALENV=./venv

# Проверяем наличие python3 нужной версии
if ! command -v python3 &> /dev/null; then
    echo "Python3 не установлен. Обновите настройки Glitch."
    exit 1
fi

# Создаем виртуальное окружение с правильной версией Python
if [ ! -d $VIRTUALENV ]; then
  python3 -m venv $VIRTUALENV
fi

# Устанавливаем pip и зависимости
$VIRTUALENV/bin/pip install --upgrade pip
$VIRTUALENV/bin/pip install -r requirements.txt

# Запускаем приложение
$VIRTUALENV/bin/python3 server.py
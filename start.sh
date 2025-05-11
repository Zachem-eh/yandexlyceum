#!/bin/bash

set -eu
export PYTHONUNBUFFERED=true

VIRTUALENV=./venv

# Проверяем доступность Python 3
if ! command -v python3 &> /dev/null; then
  echo "❌ Python3 не установлен. Добавьте '.python-version' файл с версией Python 3."
  exit 1
fi

# Создаем виртуальное окружение с явным указанием python3
if [ ! -d "$VIRTUALENV" ]; then
  echo "Создаем виртуальное окружение..."
  python3 -m venv "$VIRTUALENV" --without-pip
  # Устанавливаем pip вручную, если он не добавлен автоматически
  curl -sS https://bootstrap.pypa.io/get-pip.py | "$VIRTUALENV/bin/python"
fi

# Устанавливаем зависимости через venv/bin/pip
"$VIRTUALENV/bin/pip" install -r requirements.txt

# Запускаем приложение
"$VIRTUALENV/bin/python3" server.py
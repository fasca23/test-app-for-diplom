#!/bin/bash

# Проверяем, есть ли незакоммиченные изменения (опционально)
if [ -n "$(git status --porcelain)" ]; then
  echo "ℹ️ Найдены локальные изменения. Добавляю всё..."
else
  echo "ℹ️ Нет изменений. Нечего коммитить."
  exit 0
fi

# Добавляем все изменения
echo "📦 Выполняю 'git add .' ..."
git add .

# Запрашиваем или получаем версию
if [ -n "$1" ]; then
  VERSION="$1"
else
  read -p "Введите версию (например, v3.19.0): " VERSION
fi

# Проверка на пустой ввод
if [ -z "$VERSION" ]; then
  echo "❌ Ошибка: версия не может быть пустой"
  exit 1
fi

MESSAGE="релиз_$VERSION"

echo "🚀 Начинаем релиз версии $VERSION"

# Коммитим с версией как сообщением
git commit -m "$VERSION"

# Пушим в основную ветку (предположим, это master)
git push origin master

# Создаём аннотированный тег
git tag -a "$VERSION" -m "$MESSAGE"

# Пушим тег
git push origin "$VERSION"

echo "✅ Релис $VERSION успешно опубликован!"
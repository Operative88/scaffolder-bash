#!/bin/bash

# Tworzymy folder bin w katalogu domowym użytkownika, jeśli nie istnieje
mkdir -p "$HOME/.local/bin"

# Tworzymy link symboliczny (skrót) do naszego skryptu
# Dzięki temu każda zmiana w kodzie w tym repo będzie od razu widoczna w systemie
ln -sf "$(pwd)/bin/start-project" "$HOME/.local/bin/start-project"

echo "✅ Zainstalowano! Upewnij się, że $HOME/.local/bin jest w Twoim PATH."
echo "Możesz teraz używać komendy: start-project"
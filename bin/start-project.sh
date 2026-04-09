#!/bin/bash

# 1. Walidacja argumentów wejściowych
# Sprawdzamy, czy użytkownik podał dokładnie 2 argumenty (język i nazwę)
if [ "$#" -ne 2 ]; then
    echo "Błąd: Nieprawidłowa liczba argumentów."
    echo "Użycie: start-project <język> <nazwa_projektu>"
    echo "Dostępne języki: python, web"
    exit 1
fi

LANGUAGE=$1
PROJECT_NAME=$2

echo "Rozpoczynam budowę projektu: $PROJECT_NAME..."

# 2. Tworzenie głównego katalogu i przejście do niego
mkdir -p "$PROJECT_NAME"
cd "$PROJECT_NAME" || exit

# 3. Tworzenie uniwersalnej struktury folderów
mkdir -p src tests docs

# 4. Tworzenie pliku README.md
echo "# $PROJECT_NAME" > README.md
echo "Projekt wygenerowany automatycznie za pomocą Project Scaffoldera." >> README.md

# 5. Inicjalizacja Git
git init > /dev/null 2>&1
echo "Zainicjalizowano repozytorium Git."

# 6. Logika specyficzna dla wybranego języka
case $LANGUAGE in
    python)
        echo "🐍 Konfiguracja środowiska Python..."
        
        # Tworzenie plików
        touch requirements.txt
        echo "print('Witaj w projekcie $PROJECT_NAME!')" > src/main.py
        
        # Generowanie pliku .gitignore dla Pythona
        echo "__pycache__/" > .gitignore
        echo "venv/" >> .gitignore
        echo "*.pyc" >> .gitignore
        ;;
        
    web)
        echo "Konfiguracja środowiska Web (HTML/JS/CSS)..."
        
        # Tworzenie plików
        echo "<!DOCTYPE html><html><head><title>$PROJECT_NAME</title></head><body><h1>Witaj!</h1></body></html>" > src/index.html
        touch src/style.css src/script.js
        
        # Generowanie pliku .gitignore dla projektów webowych
        echo "node_modules/" > .gitignore
        ;;
        
    *)
        # Jeśli użytkownik wpisze nieznany język, sprzątamy po sobie i przerywamy
        echo "Błąd: Nieznany szablon języka '$LANGUAGE'."
        echo "Dostępne języki: python, web"
        cd ..
        rm -rf "$PROJECT_NAME"
        exit 1
        ;;
esac

# 7. Wykonanie pierwszego commita
echo "💾 Tworzenie pierwszego commita..."
git add .
git commit -m "Initial commit: wygenerowano strukturę projektu ($LANGUAGE)" > /dev/null 2>&1

# 8. Podsumowanie
echo "✅ Gotowe! Twój projekt jest gotowy do pracy."
echo "Wpisz: cd $PROJECT_NAME"
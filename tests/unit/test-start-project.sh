#!/bin/bash

# Proste testy dla skryptu start-project
# Uruchom: bash tests/unit/test-start-project.sh

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
START_PROJECT="$SCRIPT_DIR/bin/start-project"
TEST_DIR="/tmp/bashpr-test-$$"

# Kolory dla outputu
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

PASSED=0
FAILED=0

# Funkcja do testowania
test_case() {
    local test_name=$1
    local test_func=$2
    
    echo -n "Testing: $test_name... "
    
    if $test_func; then
        echo -e "${GREEN}✓ PASS${NC}"
        ((PASSED++))
    else
        echo -e "${RED}✗ FAIL${NC}"
        ((FAILED++))
    fi
}

# Przygotowanie
setup() {
    rm -rf "$TEST_DIR"
    mkdir -p "$TEST_DIR"
    cd "$TEST_DIR"
}

# Czyszczenie
teardown() {
    cd /
    rm -rf "$TEST_DIR"
}

# Test 1: Brak argumentów powinien zwrócić błąd
test_no_arguments() {
    bash "$START_PROJECT" 2>&1 | grep -q "Błąd: Nieprawidłowa liczba argumentów" || return 1
    return 0
}

# Test 2: Tworzenie projektu Python
test_python_project() {
    bash "$START_PROJECT" python test-python > /dev/null 2>&1 || return 1
    [ -d "test-python" ] || return 1
    [ -d "test-python/src" ] || return 1
    [ -d "test-python/tests" ] || return 1
    [ -d "test-python/docs" ] || return 1
    [ -f "test-python/.gitignore" ] || return 1
    return 0
}

# Test 3: Plik main.py powinien być utworzony
test_python_main_created() {
    bash "$START_PROJECT" python test-py2 > /dev/null 2>&1 || return 1
    [ -f "test-py2/src/main.py" ] || return 1
    grep -q "print" "test-py2/src/main.py" || return 1
    return 0
}

# Test 4: Git repo powinien być zainicjalizowany
test_git_initialized() {
    bash "$START_PROJECT" python test-git > /dev/null 2>&1 || return 1
    [ -d "test-git/.git" ] || return 1
    return 0
}

# Test 5: README.md powinien zawierać nazwę projektu
test_readme_contains_project_name() {
    PROJECT_NAME="my-test-project"
    bash "$START_PROJECT" python "$PROJECT_NAME" > /dev/null 2>&1 || return 1
    grep -q "# $PROJECT_NAME" "$PROJECT_NAME/README.md" || return 1
    return 0
}

# --- Uruchamianie testów ---
echo "================================"
echo "  Project Scaffolder Tests"
echo "================================"

setup

test_case "No arguments error" test_no_arguments
test_case "Python project creation" test_python_project
test_case "Python main.py created" test_python_main_created
test_case "Git repository initialized" test_git_initialized
test_case "README contains project name" test_readme_contains_project_name

teardown

echo "================================"
echo -e "Results: ${GREEN}$PASSED passed${NC}, ${RED}$FAILED failed${NC}"
echo "================================"

[ $FAILED -eq 0 ] && exit 0 || exit 1

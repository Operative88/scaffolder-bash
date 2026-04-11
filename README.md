# Project Scaffolder (Bash)

Light and fast CLI tool for quick development of new software
## Functions
- Creates standart structure of project (`src/`, `tests/`, `docs/`).
- Automatically initializes Git repository.
- Generates appropriate files `.gitignore` i `README.md`.
- Supports templates: Python, Web, C++ (w przygotowaniu).

## Installation
```bash
git clone [https://github.com/TwojUser/project-scaffolder.git](https://github.com/TwojUser/project-scaffolder.git)
cd project-scaffolder
chmod +x bin/start-project tests/run-tests.sh tests/unit/*.sh
sudo ln -s $(pwd)/bin/start-project /usr/local/bin/start-project
```

## Testing (Testy automatyczne)

Projekt zawiera kompleksowe testy automatyczne w Bash i Python.

### Uruchomienie wszystkich testów
```bash
bash tests/run-tests.sh
```

### Uruchomienie poszczególnych testów

**Testy bash:**
```bash
bash tests/unit/test-start-project.sh
```

**Testy Python:**
```bash
python -m pytest tests/unit/test_python_template.py
# lub
python tests/unit/test_python_template.py
```

### Testy w CI/CD

Projekt zawiera GitHub Actions workflow w `.github/workflows/tests.yml` 
który automatycznie uruchamia wszystkie testy przy każdym push-ie lub pull request-cie
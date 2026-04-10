# Project Scaffolder (Bash)

Light and fast CLI tool for quick development of new software
## Functions
- Creates standart structire of project (`src/`, `tests/`, `docs/`).
- Automatycznie inicjalizuje repozytorium Git.
- Generuje odpowiednie pliki `.gitignore` i `README.md`.
- Wspiera szablony: Python, Web, C++ (w przygotowaniu).

## Installation
```bash
git clone [https://github.com/TwojUser/project-scaffolder.git](https://github.com/TwojUser/project-scaffolder.git)
cd project-scaffolder
chmod +x start-project
sudo ln -s $(pwd)/start-project /usr/local/bin/start-project
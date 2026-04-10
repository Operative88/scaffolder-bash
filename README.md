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
chmod +x start-project
sudo ln -s $(pwd)/start-project /usr/local/bin/start-project
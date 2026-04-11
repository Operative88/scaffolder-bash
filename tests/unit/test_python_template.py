#!/usr/bin/env python3
"""
Testy dla szablonu Python
Uruchom: python -m pytest tests/unit/test_python_template.py
lub: python tests/unit/test_python_template.py
"""

import unittest
import subprocess
import shutil
import os
from pathlib import Path


class TestPythonTemplate(unittest.TestCase):
    """Testy dla szablonu Python"""
    
    @classmethod
    def setUpClass(cls):
        """Przygotowanie testu"""
        cls.script_path = Path(__file__).parent.parent.parent / "bin" / "start-project"
        cls.test_dir = Path("/tmp/python-template-test")
        
    def setUp(self):
        """Czyszczenie przed każdym testem"""
        if self.test_dir.exists():
            shutil.rmtree(self.test_dir)
        self.test_dir.mkdir(parents=True)
    
    def tearDown(self):
        """Czyszczenie po teście"""
        if self.test_dir.exists():
            shutil.rmtree(self.test_dir)
    
    def test_main_py_exists(self):
        """Test: Plik main.py powinien być utworzony"""
        os.chdir(self.test_dir)
        subprocess.run(
            [f"bash {self.script_path} python test-project"],
            shell=True,
            capture_output=True,
            check=True
        )
        main_py = self.test_dir / "test-project" / "src" / "main.py"
        self.assertTrue(main_py.exists(), "main.py nie został utworzony")
    
    def test_main_py_is_executable(self):
        """Test: main.py powinien być wykonywalny"""
        os.chdir(self.test_dir)
        subprocess.run(
            [f"bash {self.script_path} python test-project"],
            shell=True,
            capture_output=True,
            check=True
        )
        main_py = self.test_dir / "test-project" / "src" / "main.py"
        
        result = subprocess.run(
            [f"python {main_py}"],
            shell=True,
            capture_output=True,
            text=True
        )
        self.assertEqual(result.returncode, 0, "main.py nie wykonał się prawidłowo")
    
    def test_requirements_txt_created(self):
        """Test: requirements.txt powinien być utworzony"""
        os.chdir(self.test_dir)
        subprocess.run(
            [f"bash {self.script_path} python test-project"],
            shell=True,
            capture_output=True,
            check=True
        )
        req_file = self.test_dir / "test-project" / "requirements.txt"
        self.assertTrue(req_file.exists(), "requirements.txt nie został utworzony")


if __name__ == "__main__":
    unittest.main(verbosity=2)

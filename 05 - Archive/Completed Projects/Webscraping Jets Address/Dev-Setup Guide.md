# **Web Scraping Development Environment Setup Guide**

## **1. Development Environment Setup**

### **1.1 Python Environment**

```powershell
# Install Python (if not already installed)
winget install Python.Python.3.11

# Verify installation
python --version

# Create virtual environment
python -m venv venv

# Activate virtual environment (Windows)
.\venv\Scripts\activate

# Activate virtual environment (Mac/Linux)
source venv/bin/activate
```

---

### **1.2 Required Dependencies**

```powershell
# Install core dependencies
pip install requests  # HTTP requests
pip install beautifulsoup4  # HTML parsing
pip install pandas  # Data processing and structuring
pip install lxml  # HTML/XML parsing
pip install tqdm  # Progress bar for scraping
pip install fake_useragent  # Randomized user-agents to avoid blocking

# Install development dependencies
pip install black  # Code formatting
pip install flake8  # Code linting
pip install pytest  # Testing
pip install pytest-cov  # Test coverage
pip install pre-commit  # Git hooks

# Save dependencies
pip freeze > requirements.txt
```

---

## **2. Project Structure**

```
webscraper_project/
│
├── .git/
├── .gitignore
├── .env.example
├── README.md
├── requirements.txt
├── setup.py
│
├── src/
│   ├── __init__.py
│   ├── config/
│   │   ├── __init__.py
│   │   └── settings.py
│   │
│   ├── scrapers/
│   │   ├── __init__.py
│   │   ├── jets_pizza_scraper.py
│   │
│   ├── processors/
│   │   ├── __init__.py
│   │   └── data_processor.py
│   │
│   └── utils/
│       ├── __init__.py
│       ├── logger.py
│       └── helpers.py
│
├── tests/
│   ├── __init__.py
│   ├── test_scraper.py
│   ├── test_processor.py
│
├── data/
│   ├── raw/
│   ├── processed/
│   └── archived/
│
└── docs/
    ├── requirements.md
    ├── technical_spec.md
    └── api_documentation.md
```

---

## **3. Configuration Files**

### **3.1 `.gitignore`**

```gitignore
# Virtual Environment
venv/
env/

# Python Bytecode
__pycache__/
*.py[cod]

# Logs
logs/
*.log

# Environment Variables
.env
.env.*  
!.env.example

# Data
data/raw/*
data/processed/*
data/archived/*
!data/raw/.gitkeep
!data/processed/.gitkeep
!data/archived/.gitkeep
```

---

### **3.2 `.env.example`**

```ini
# Scraping Configuration
BASE_URL=https://www.jetspizza.com/stores/
REQUESTS_PER_SECOND=1
MAX_RETRIES=3
RETRY_DELAY=5

# Proxy Configuration (optional)
PROXY_HOST=
PROXY_PORT=
PROXY_USER=
PROXY_PASS=
```

---

### **3.3 `pre-commit-config.yaml`**

```yaml
repos:
-   repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v4.4.0
    hooks:
    -   id: trailing-whitespace
    -   id: end-of-file-fixer
    -   id: check-yaml
    -   id: check-added-large-files

-   repo: https://github.com/psf/black
    rev: 23.3.0
    hooks:
    -   id: black

-   repo: https://github.com/PyCQA/flake8
    rev: 6.0.0
    hooks:
    -   id: flake8
```

---

## **4. Initial Setup Script**

### **`setup.py`**

```python
from setuptools import setup, find_packages

setup(
    name="webscraper_project",
    version="0.1.0",
    packages=find_packages(),
    install_requires=[
        "requests>=2.28.0",
        "beautifulsoup4>=4.11.0",
        "pandas>=2.0.0",
        "lxml>=4.9.0",
        "tqdm>=4.64.0",
        "fake_useragent>=1.0.0",
    ],
    extras_require={
        "dev": [
            "pytest>=7.3.1",
            "pytest-cov>=4.1.0",
            "black>=23.3.0",
            "flake8>=6.0.0",
            "pre-commit>=3.3.3",
        ],
    },
)
```

---

## **5. Development Tools Setup**

### **5.1 VSCode Settings (`settings.json`)**

```json
{
    "python.formatting.provider": "black",
    "python.linting.enabled": true,
    "python.linting.flake8Enabled": true,
    "editor.formatOnSave": true,
    "python.testing.pytestEnabled": true,
    "python.testing.pytestArgs": [
        "tests"
    ]
}
```

---

## **6. Quick Start Guide**

```powershell
# Clone the repository
git clone <repository-url>
cd webscraper_project

# Create and activate virtual environment
python -m venv venv
.\venv\Scripts\activate  # Windows
source venv/bin/activate  # Mac/Linux

# Install dependencies
pip install -e ".[dev]"

# Set up pre-commit hooks
pre-commit install

# Create necessary directories
mkdir -p data/{raw,processed,archived}

# Copy environment file
copy .env.example .env

# Run tests
pytest tests/
```

---

## **7. Example Web Scraper (`jets_pizza_scraper.py`)**

```python
import requests
from bs4 import BeautifulSoup
import csv
import logging
import time

# Logging setup
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

class JetsPizzaScraper:
    def __init__(self):
        self.base_url = "https://www.jetspizza.com/stores/"
        self.session = requests.Session()
        self.state_urls = []
        self.store_data = []

    def fetch_states(self):
        """Fetch state URLs"""
        logging.info("Fetching state URLs...")
        response = self.session.get(self.base_url)
        soup = BeautifulSoup(response.text, "html.parser")
        state_links = soup.find_all("a", class_="pge-find-store__state-item")

        for link in state_links:
            state_name = link.find("h2").text.strip()
            state_url = link["href"]
            self.state_urls.append((state_name, state_url))

        logging.info(f"Found {len(self.state_urls)} states.")

    def fetch_store_addresses(self):
        """Fetch store addresses"""
        for state_name, state_url in self.state_urls:
            logging.info(f"Scraping stores for {state_name}...")
            response = self.session.get(state_url)
            soup = BeautifulSoup(response.text, "html.parser")
            store_items = soup.find_all("div", class_="pge-find-store__item")

            for store in store_items:
                address_elements = store.find_all("p")
                if len(address_elements) > 1:
                    address = address_elements[1].text.strip()
                    self.store_data.append((state_name, address))

        logging.info(f"Extracted {len(self.store_data)} store addresses.")

    def save_to_csv(self, filename="jets_pizza_stores.csv"):
        """Save data to CSV"""
        with open(filename, "w", newline="", encoding="utf-8") as file:
            writer = csv.writer(file)
            writer.writerow(["State", "Store Address"])
            writer.writerows(self.store_data)

    def run(self):
        """Run the scraper"""
        self.fetch_states()
        self.fetch_store_addresses()
        self.save_to_csv()

# Execute
if __name__ == "__main__":
    scraper = JetsPizzaScraper()
    scraper.run()
```


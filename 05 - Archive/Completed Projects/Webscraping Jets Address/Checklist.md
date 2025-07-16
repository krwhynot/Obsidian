# **Web Scraping Project Checklist**

## **🔧 1. Initial Setup**

✅ **Set up a virtual environment**

```powershell
python -m venv venv
.\venv\Scripts\activate  # Windows
source venv/bin/activate  # Mac/Linux
```

✅ **Install required dependencies**

```powershell
pip install requests beautifulsoup4 pandas tqdm lxml
pip install black flake8 pytest pre-commit
pip freeze > requirements.txt
```

✅ **Set up version control (Git)**

```powershell
git init
git add .
git commit -m "Initial project setup"
git branch -M main
```

✅ **Set up `.gitignore`**  
Add exclusions for `venv/`, `__pycache__/`, `.env`, and data files.

✅ **Create project structure**

```
webscraper_project/
│
├── src/
│   ├── scrapers/
│   │   ├── jets_pizza_scraper.py
│   ├── processors/
│   │   ├── data_processor.py
│   ├── utils/
│   │   ├── logger.py
│
├── data/
│   ├── raw/
│   ├── processed/
│
├── tests/
│   ├── test_scraper.py
│
├── requirements.txt
├── README.md
├── .gitignore
```

---

## **📡 2. Scraper Development**

✅ **Inspect website structure**

- **Visit** `https://www.jetspizza.com/stores/`
- **Identify state links** (`a.pge-find-store__state-item`)
- **Check store addresses** (`div.pge-find-store__item > p:nth-child(2)`)
- **Ensure compliance with `robots.txt`**

✅ **Write the scraper to get state URLs**

- Use `requests` to fetch the HTML
- Parse the HTML with `BeautifulSoup`
- Extract all state links

✅ **Write the scraper to get store addresses**

- Loop through each state’s store page
- Extract store addresses
- Handle missing or malformed data

✅ **Implement rate limiting**

- **Add a delay between requests** (`time.sleep(1)`)
- **Use session management** (`requests.Session()`)

✅ **Handle errors and retries**

```python
def retry_request(url, retries=3, delay=5):
    for attempt in range(retries):
        response = requests.get(url)
        if response.status_code == 200:
            return response
        time.sleep(delay)
    return None
```

✅ **Save extracted data to a CSV file**

```python
import csv

def save_to_csv(data, filename="jets_pizza_stores.csv"):
    with open(filename, "w", newline="", encoding="utf-8") as file:
        writer = csv.writer(file)
        writer.writerow(["State", "Store Address"])
        writer.writerows(data)
```

---

## **🛠 3. Data Processing**

✅ **Clean and transform extracted data**

- **Remove duplicates**
- **Standardize addresses**

✅ **Validate extracted data**

- Check for missing store addresses
- Ensure correct formatting

✅ **Save cleaned data to a new CSV file**

```python
import pandas as pd

df = pd.read_csv("jets_pizza_stores.csv")
df.drop_duplicates(inplace=True)
df.to_csv("cleaned_stores.csv", index=False)
```

---

## **🔍 4. Testing & Debugging**

✅ **Write unit tests for scraper functions**

```python
def test_fetch_states():
    scraper = JetsPizzaScraper()
    scraper.fetch_states()
    assert len(scraper.state_urls) > 0
```

✅ **Test data extraction accuracy**

- Print sample extracted data
- Compare against actual website

✅ **Run test suite**

```powershell
pytest tests/
```

✅ **Fix any issues in scraping logic**

---

## **📊 5. Logging & Monitoring**

✅ **Set up logging for debugging**

```python
import logging

logging.basicConfig(level=logging.INFO, format="%(asctime)s - %(levelname)s - %(message)s")
```

✅ **Monitor request failures**

- Log error messages when requests fail
- Track request success rate

✅ **Alert on excessive errors**

- Send notifications if failure rate > 10%

---

## **🚀 6. Deployment & Execution**

✅ **Run the scraper**

```powershell
python src/scrapers/jets_pizza_scraper.py
```

✅ **Verify the generated CSV file**

- Ensure all states are included
- Check store addresses for accuracy

✅ **Schedule periodic scraping (Optional)**

```powershell
# Run scraper every day at midnight
echo "0 0 * * * python src/scrapers/jets_pizza_scraper.py" | crontab -
```

✅ **Backup extracted data**

- Save CSV files to cloud storage

---

## **📈 7. Future Enhancements**

✅ **Improve scraper efficiency**

- Implement multithreading for faster requests
- Store data in a database instead of CSV

✅ **Add proxy support**

```python
proxies = {
    "http": "http://yourproxy.com",
    "https": "https://yourproxy.com",
}
requests.get(url, proxies=proxies)
```

✅ **Develop an API to serve store data**

- Create a Flask/Django API to access the scraped data

---

### **🎯 Final Steps:**

✅ **Check logs for errors**  
✅ **Ensure CSV file is complete**  
✅ **Review scraped data quality**  
✅ **Store backups of extracted data**  
✅ **Plan for future optimizations**

🚀 **Project Complete! 🎉**
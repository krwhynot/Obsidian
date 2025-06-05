# **Web Scraping Technical Specification**

## **1. System Architecture**

### **1.1 Component Overview**

The web scraping system consists of the following components:

- **Scraper Module** – Fetches state-wise store data from Jet’s Pizza.
- **Data Processing Module** – Cleans and structures the extracted addresses.
- **Storage Module** – Saves data in a CSV file.
- **Monitoring Module** – Logs scraping activities and errors.

### **1.2 Technology Stack**

- **Programming Language:** Python
- **Key Libraries:**
    - **Web Scraping:** `requests`, `BeautifulSoup`
    - **Data Processing:** `pandas`
    - **Database/Storage:** CSV file (`csv` module)
    - **Monitoring:** `logging`

---

## **2. Implementation Details**

### **2.1 Scraper Module**

```python
import requests
from bs4 import BeautifulSoup
import csv
import logging

# Logging setup
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

class JetsPizzaScraper:
    def __init__(self, base_url="https://www.jetspizza.com/stores/"):
        self.base_url = base_url
        self.session = requests.Session()
        self.state_urls = []
        self.store_data = []

    def fetch_states(self):
        """Fetch all state URLs from the main store locator page"""
        logging.info("Fetching state URLs...")
        response = self.session.get(self.base_url)
        if response.status_code != 200:
            logging.error(f"Failed to fetch state URLs: {response.status_code}")
            return
        
        soup = BeautifulSoup(response.text, "html.parser")
        state_links = soup.find_all("a", class_="pge-find-store__state-item")

        for link in state_links:
            state_name = link.find("h2").text.strip()
            state_url = link["href"]
            self.state_urls.append((state_name, state_url))
        
        logging.info(f"Found {len(self.state_urls)} states.")

    def fetch_store_addresses(self):
        """Fetch store addresses from each state page"""
        for state_name, state_url in self.state_urls:
            logging.info(f"Scraping stores for {state_name}...")
            response = self.session.get(state_url)
            if response.status_code != 200:
                logging.error(f"Failed to fetch stores for {state_name}: {response.status_code}")
                continue
            
            soup = BeautifulSoup(response.text, "html.parser")
            store_items = soup.find_all("div", class_="pge-find-store__item")

            for store in store_items:
                address_elements = store.find_all("p")
                if len(address_elements) > 1:
                    address = address_elements[1].text.strip()
                    self.store_data.append((state_name, address))
        
        logging.info(f"Extracted {len(self.store_data)} store addresses.")

    def save_to_csv(self, filename="jets_pizza_stores.csv"):
        """Save extracted store data to a CSV file"""
        logging.info(f"Saving data to {filename}...")
        with open(filename, "w", newline="", encoding="utf-8") as file:
            writer = csv.writer(file)
            writer.writerow(["State", "Store Address"])
            writer.writerows(self.store_data)
        logging.info("Data successfully saved.")

    def run(self):
        """Run the full scraper workflow"""
        self.fetch_states()
        self.fetch_store_addresses()
        self.save_to_csv()

# Execute scraping
if __name__ == "__main__":
    scraper = JetsPizzaScraper()
    scraper.run()
```

---

### **2.2 Data Processing Pipeline**

```python
import pandas as pd

class DataProcessor:
    def __init__(self, input_file="jets_pizza_stores.csv", output_file="cleaned_stores.csv"):
        self.input_file = input_file
        self.output_file = output_file

    def clean_data(self):
        """Read and clean the CSV data"""
        df = pd.read_csv(self.input_file)
        df.drop_duplicates(inplace=True)  # Remove duplicate addresses
        df.to_csv(self.output_file, index=False)
        print(f"Cleaned data saved to {self.output_file}")

# Execute data processing
if __name__ == "__main__":
    processor = DataProcessor()
    processor.clean_data()
```

---

## **3. Error Handling**

### **3.1 Error Types and Responses**

- **Network Errors:**
    - Handled using status code checks (`if response.status_code != 200`)
    - Logs errors instead of crashing
- **Parsing Errors:**
    - Uses `try-except` when extracting store addresses
- **Data Validation Errors:**
    - Ensures address exists before adding to dataset
- **Storage Errors:**
    - Uses `try-except` when writing to CSV

### **3.2 Retry Logic**

```python
import time

def retry_request(url, retries=3, delay=5):
    """Retries a request in case of failures"""
    for attempt in range(retries):
        response = requests.get(url)
        if response.status_code == 200:
            return response
        logging.warning(f"Retrying ({attempt+1}/{retries}) for {url}")
        time.sleep(delay)
    logging.error(f"Failed to fetch {url} after {retries} attempts.")
    return None
```

---

## **4. Performance Considerations**

### **4.1 Rate Limiting**

```python
import time

class RateLimiter:
    def __init__(self, delay=1):
        self.delay = delay

    def wait(self):
        """Enforces delay between requests"""
        time.sleep(self.delay)
```

- **1-second delay** to avoid being blocked.
- **Uses session management** to reuse connections.

### **4.2 Optimization Strategies**

- **Caching strategy:** Store state URLs locally to avoid repeated requests.
- **Parallel processing approach:** Use `multiprocessing` for scraping multiple states simultaneously.
- **Resource management:** Close sessions after scraping.

---

## **5. Monitoring and Logging**

### **5.1 Logging Configuration**

```python
import logging

logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s'
)
```

### **5.2 Metrics Collection**

- **Performance metrics:** Time taken per request
- **Success/failure rates:** Log errors for failed requests
- **Data quality metrics:** Number of addresses extracted

---

## **6. Testing Strategy**

### **6.1 Test Cases**

- **Unit tests:** Test if state links are correctly extracted
- **Integration tests:** Check if store addresses are fetched correctly
- **End-to-end tests:** Run the full pipeline and verify CSV output

### **6.2 Test Data**

- **Sample dataset:** Mock HTML pages for unit testing
- **Test scenarios:**
    1. Handle missing address elements
    2. Simulate failed network requests
    3. Ensure CSV output has correct formatting


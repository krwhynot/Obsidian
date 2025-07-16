

### **1️⃣ Summary of Audio Files Per Location**

- A breakdown of the **number of audio files** recorded for each store (e.g., Store SS052 has **22 audio files**, Store SS067 has **58 audio files**, etc.).

### **2️⃣ Detailed Call Transcriptions**

For each call, the document provides:

- **Store Information** (Store ID, address, phone number)
- **Agent Name** (e.g., "Gerome," "Paula Garavillas")
- **Customer Phone Number**
- **Order ID**
- **Call Type** (e.g., "agent")
- **Queue Type** (e.g., "jaguar")
- **Call Status** (e.g., "AGENT_MONITOR_REDIRECT," "COMPLETE," "CUSTOMER_HUNG_UP")
- **Call In and Out Time** (Start and end times)
- **Call Duration** (e.g., "0:01:00" for one minute)

### **3️⃣ Full Transcriptions with Speaker Turns**

- Dialog between the **customer and agent**, formatted as a numbered list.
- Example:
    
    ```
    1. "Thank you for choosing Simple Simon's Pizza. You can order with me and skip the wait. Would you like to get started?"
    2. SILENCE (6.479 - 8.375, 1.896 seconds)
    3. "Yes."
    4. "Awesome. This call may be monitored or recorded for quality control purposes."
    5. SILENCE (12.957 - 21.013, 8.056 seconds)
    ```
    
- Silence detection is included and categorized:
    - **Short Silence** (e.g., "SILENCE (6.479 - 8.375, 1.896 seconds)")
    - **Medium Silence**
    - **Long Silence** (e.g., "!!! SILENCE (54.846 - 71.787, 16.941 seconds) !!!")

### **4️⃣ Common Topics & Observations**

- **Order Taking**: Customers ordering pizza, specifying size, crust, toppings.
- **Delivery vs. Pickup Confirmation**.
- **Payment Method Discussions** (e.g., "Would you like to pay when you get to the store or pay with a card now?").
- **Call Disruptions**:
    - Some calls **get transferred** to a store representative.
    - Some calls **end abruptly** (e.g., "CUSTOMER_HUNG_UP").
    - Some calls contain **explicit language** from customers.
- **Speech-to-Text Errors**: Some transcriptions contain **misinterpretations or incorrect words**.

### **5️⃣ Silence Detection for Analysis**

- **Silences are highlighted in different colors**:
    - **Short Silence (Green)**
    - **Medium Silence (Dark Orange)**
    - **Long Silence (Red)**
- Indicates **pauses in conversation**, which could signify:
    - **Customer confusion**
    - **Delays in agent response**
    - **Call handling inefficiencies**


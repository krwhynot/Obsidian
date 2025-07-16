Here's a well-organized and structured version of your steps for installation:

---

**Installation Process & Checklist**

**1. Pre-Call (24-48 Hours Before Installation)**

Validate the following details:

- **Start Time**
- **Address**
- **New Construction Check:**

- Are countertops in place?
- Is electrical ready?
- Has ISP installed a functioning internet connection?
- Is Cat5 ran and terminated?

- **Verify Point of Contact (POC)**
- **Confirm Equipment:**

- Equipment to be installed
- Ensure all required equipment is onsite

---

**2. On-Site Installation Process**

**A. Initial Site Walkthrough**

1. Tech arrives at the designated time.
2. Walk through the site with the client to verify station placement.
3. Inventory all equipment.
4. Remove old equipment (if HWR, pull all data from the old POS before shutting down).

**B. Network & Firewall Setup**

1. Set up the firewall and network equipment.
2. Access modem and configure Static IP.
3. If only one Static IP is available, configure port forwarding to the router:

- **Port Forward 7777** to the router.

**C. Physical Setup**

-                **Physically Setup Equipment**

1.       Set up all terminals
2.       Setup up Station Printers, CC Readers and Cash Drawers
3.        Setup up IP printers.
4.       Setup CallerID
5.       Load the database (DB) to SQL on **Revent1** (may be done in pre-config).
6.       Run **HR-Updater** on all stations.

**D. Software Configuration**

 -  **6-Point System Check (All Stations)**

·        **LAN IP Address of Station**

·        **Station Name**

·        **Printers on Station** (All IP printers should be on **Revent1**)

·        **Reboot Schedule in Windows Task Scheduler**:

o   **Revent1 → 6:00 AM**

o   **All other stations → 6:10 AM**

·        **Config File**

·        **Time Zone**

**E. RM/HROO Setup**

1. **HROO Configuration:**

- Set IP, times, credit card (CC) settings
- Ensure **“Is Online”** is active

1. **RM IP Configuration:**

- Set IP

**F. Software & Credit Card Configuration**

1. Verify **Looking Glass** is in **Installer Mode**.
2. Configure **Credit Card Processing Credentials** on each station and device.
3. Test credit card transactions on all stations.
4. Take **validating screenshots** and send them to the proper distribution list.

**G. POS System & Functionality Tests**

1. **Perform Order Processing Test:**

- Open the cash drawer
- Place an order
- Test printing functionality
- Close the drawer
- Batch CC transactions

1. **Perform a ‘No Sale’ test** on all drawers to verify the open function.

**H. Additional System Checks**

1. Configure and test **Caller ID device**.
2. If **KDS (Kitchen Display System)** is present:

- Verify **stages**
- Check **bump functionality**

1. Check **USB connections** and set up a backup path.

**I. Final Steps**

1. **Cleanup & Cable Maintenance.**
2. **Obtain Owner or POS Sign-Off.**

---

**3. Post-Installation Checklist & Reporting**

- **Logos/Images?** (SharePoint?)
- **Who to email?**
- **Install Completion Reports:**

- CC Verification
- Site Images
- Install (Day 1) Summary Email
- RMA / Escalation Report (if needed)

---

**Required Skills**

- **Networking:** Basic port forwarding, setting IP addresses.
- **Credit Card Configuration:** Credential setup for transactions.
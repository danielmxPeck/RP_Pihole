# Health Check Script and Telegram Bot Integration

This repository contains a Python script that performs a system health check and sends the output to a specified Telegram chat via a bot. The health check includes information about the system's date/time, user details, CPU load, memory usage, disk usage, and Pi-hole status.

## **Features**
- **System Health Check**: Retrieves data about the system such as date/time, user, memory, CPU load, disk usage, and Pi-hole status.
- **Telegram Notification**: Sends the health check results to a Telegram chat using a Telegram bot.
- **Environment Variables**: Utilizes `.env` file to securely store sensitive data like bot token and chat ID.

## **Requirements**

- **Python 3.x**
- **Python Libraries**: `requests`, `python-dotenv`
  - Install the required Python libraries by running:
    ```bash
    pip install -r requirements.txt
    ```
- **Bash**: The health check script (`health_check.sh`) requires a bash shell to run.
- **Pi-hole**: This script checks the status of Pi-hole if installed.

## **Setup and Configuration**

1. **Clone the Repository**:
    ```bash
    git clone [https://github.com/your-username/healthcheck-telegram-bot.git](https://github.com/danielmxPeck/RP_Pihole.git)
    cd RP_Pihole
    ```

2. **Create a `.env` File**:
   In the root directory of the project, create a `.env` file to store your Telegram bot token and chat ID:
   ```bash
   BOT_TOKEN=your-telegram-bot-token
   CHAT_ID=your-telegram-chat-id


3. **Install Dependencies**
   ```bash
   pip install -r requirements.txt

4. **Run the Script**
   ```bash
   python health_check.py

  # Sample Output
  ```
🕰️ Date & Time
Sat Mar 15 06:16:34 PM +08 2025

👤 User
HostName: User
IPV4: 192.168.1.14

🖥️  Pi Health Check
CPU Load:  0.10, 0.12, 0.09
Memory Usage: 919Mi/4.0Gi
Disk Usage: 9.3G/29G
CPU Temp: temp=57.1'C

🔍 Pi-hole Health Check
🆔PI_PID: 32569
📊 CPU Usage: 0.1%
🖥️ Memory Usage: 1.2%
⏳ Time+: 00:35:42
Pi-hole Status: Enabled ✅
Ad Blocking: Working ✅
```

# Troubleshotting
- Missing `.env` file: Make sure you’ve created the `.env` file with the correct bot token and chat ID as mentioned in the setup.
- Permission Issues: Ensure that the script has the necessary permissions to run the health check bash script (`health_check.sh`).
```bash
chmod +x health_check.sh


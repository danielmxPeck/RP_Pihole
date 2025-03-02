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
    git clone https://github.com/your-username/healthcheck-telegram-bot.git
    cd healthcheck-telegram-bot
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
  🕰️ Date & Time: 2025-03-02 12:00:00

  👤 User:
  HostName: raspberrypi
  IPV4: 192.168.1.10

  🖥️ Pi Health Check:
  CPU Load: 1.25
  Memory Usage: 2.5GB / 4GB
  Disk Usage: 1.5GB / 10GB
  CPU Temp: 45.0'C

  🔍 Pi-hole Health Check:
  Pi-hole Status: Enabled ✅
  Ad Blocking: Working ✅
```

# Troubleshotting
- Missing `.env` file: Make sure you’ve created the `.env` file with the correct bot token and chat ID as mentioned in the setup.
- Permission Issues: Ensure that the script has the necessary permissions to run the health check bash script (`health_check.sh`).
```bash
chmod +x health_check.sh





# 🛠️ System Health Check (`Health-Check.sh`)

Automated post-patching and post-upgrade health check script to verify system stability and record logs.
```bash
curl -fsSL https://raw.githubusercontent.com/raznulasri/After-Upgrade-Healthcheck/main/Health-Check.sh | sudo bash
```
---

## ⚡ Quick Start

```bash
# Make script executable
chmod +x Health-Check.sh

# Run health check
sudo ./Health-Check.sh


.
├── Health-Check.sh      # Main health check script
└── logs/                # Log output directory (auto-created)
    └── health-check_YYYYMMDD_HHMMSS.log

This script has made for health check after  patching and upgrading system to check if has any issue and save to folder log

Link Health-Check.sh

# 🛠️ System Health Check (`Health-Check.sh`)

Automated post-patching and post-upgrade health check script to verify system stability and record logs.

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

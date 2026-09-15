# SOC Incident Triage & Log Analysis Suite

A collection of Bash and PowerShell automation scripts designed for SOC Tier 1/2 analysts to automate incident triage, parse security telemetry, search for Indicators of Compromise (IOCs), and analyze enterprise audit logs.

---

## Overview

During active incident response, rapid log collection and correlation are critical to minimizing Mean Time to Respond (MTTR). This repository provides lightweight, standalone automation scripts configured to parse auth logs, system telemetry, and network event streams across Linux and Windows environments.

---

## Features

* **Log Parsing & Keyword Correlation:** Automated scanning of `/var/log/auth.log` and Sysmon logs for brute-force patterns, failed SSH attempts, and privilege escalation events.
* **Automated IOC Hash Verification:** Extracts SHA-256/MD5 file hashes from designated target directories and cross-references them against known threat feeds.
* **Network Connection Triage:** Isolates active TCP/UDP connections, flagging suspicious IP destinations and non-standard port activity.
* **System Hardening Verification:** Audits active UFW firewall rules, key-based SSH configurations, and user privilege levels.

---

## Included Scripts

| Script Name | Environment | Primary Function |
| :--- | :--- | :--- |
| `auth_triage.sh` | Linux (Bash) | Parses authentication logs for brute-force vectors and failed login peaks. |
| `ioc_scanner.sh` | Linux (Bash) | Computes SHA-256 hashes of running processes and directory contents. |
| `sysmon_parser.ps1` | Windows (PowerShell) | Queries Event Viewer for process creation (Event ID 1) and network connections (Event ID 3). |

---

## Quick Start

### Prerequisites
* Bash shell (Linux/macOS) or PowerShell 7.0+ (Windows)
* Standard utilities: `grep`, `awk`, `sha256sum`, `netstat` / `ss`

### Execution

Clone the repository and assign execution permissions to the scripts:

```bash
git clone [https://github.com/jaybean167/SOC-Incident-Triage-and-Log-Analysis.git](https://github.com/jaybean167/SOC-Incident-Triage-and-Log-Analysis.git)
cd SOC-Incident-Triage-and-Log-Analysis
chmod +x scripts/*.sh
./scripts/auth_triage.sh

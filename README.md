# Ransomware Threat Overview Defense Strategy

## Ransomware: Threat Overview &amp; Defense Strategy

### 📌 Overview

Ransomware is a form of malicious software that encrypts a victim's data and demands payment (usually in cryptocurrency) for the decryption key. It continues to be one of the most significant cyber threats across industries, targeting individuals, businesses, and critical infrastructure.

This repository outlines how ransomware works, common attack vectors, and provides actionable safeguards and countermeasures to reduce your exposure and improve your incident response.

### 🔥 How Ransomware Works

  - Infection – Delivered through phishing emails, malicious websites, exploit kits, or RDP vulnerabilities.

  - Execution – Once executed, it encrypts files or entire systems using strong encryption algorithms.

  - Ransom Note – A demand for payment is displayed, often with threats to delete or leak data if unpaid.

  - Payment – Usually requested in Bitcoin or Monero; paying does not guarantee data recovery.

### ⚠️ Common Attack Vectors
| Attack Vector            | Description                                                                 |
|--------------------------|-----------------------------------------------------------------------------|
| **Phishing Emails**      | Malicious links or attachments disguised as trusted communications.         |
| **Remote Desktop (RDP)** | Brute-force or credential stuffing attacks on exposed RDP services.         |
| **Software Vulnerabilities** | Exploiting unpatched systems through CVEs or zero-days.                 |
| **Malvertising**         | Malicious ads that redirect users to exploit kits or drive-by downloads.   |
| **Drive-by Downloads**   | Automatic file downloads from compromised or malicious websites.            |
| **USB/Removable Media**  | Infected USBs used to deliver payloads when inserted into a system.         |
| **Compromised Credentials** | Using leaked or stolen credentials to access internal systems.           |
| **Supply Chain Attacks** | Infiltrating software via updates or third-party tools.                     |
| **Infected Email Attachments** | Office docs, PDFs, or ZIPs with macros or embedded scripts.           |
| **Social Engineering**   | Trickery that convinces users to disable defenses or run malicious files.   |


### ✅ Safeguards & Countermeasures
#### 1. Preventive Controls

 - User Awareness Training
  - Regular phishing simulation and training on how to spot suspicious activity.

 - Patch Management
  - Keep operating systems and applications up-to-date to close known vulnerabilities.

 - Endpoint Protection
  - Use next-gen antivirus (NGAV), EDR, and behavior-based detection tools.

 - Email Filtering
  - Implement strong spam and malware filters.

 - Network Segmentation
  - Limit access between critical systems to prevent lateral movement.

 - Least Privilege Access
  - Follow the principle of least privilege (PoLP) with just-in-time (JIT) access.

#### 2. Detective Controls

 - SIEM/SOC Integration
  Monitor logs and correlate events in real time.

 - Honeypots
  Deploy decoy systems to detect intrusions early.

 - File Integrity Monitoring
  Alerts when protected files are modified or encrypted unexpectedly.

#### 3. Responsive Controls

 - Incident Response Plan
   Create and test a documented ransomware playbook.

 - Offline Backups
   Maintain encrypted, immutable backups that are disconnected from the network.

 - Network Isolation
   Quarantine infected machines quickly to stop spread.

 - Forensic Readiness
   Collect evidence legally for potential law enforcement collaboration.

🧪 Example Scripts & Tools

   Feel free to review the PowerShell script to identify suspicious file extensions and encryption patterns.

# 🛠️ Detect-Ransomware.ps1 – Script Overview

### This PowerShell script is designed to help administrators detect potential ransomware activity by scanning for:

   - Suspicious file extensions commonly used by ransomware

   - High-entropy files, which often indicate encrypted or obfuscated content

    ⚠️ This is a detection aid, not a prevention tool. It's best used as part of a layered defense strategy.

### 🔍 What It Does

   - Scans Directories

        - Monitors configurable paths (e.g., C:\Users, D:\Data)

        - Recursively checks all files in those directories

   - Detects Suspicious Extensions

        - Flags files with extensions like .locked, .crypt, .enc, etc.

        - Outputs any matches to the console

   - Estimates File Entropy (Optional)

        - Reads byte frequency of each file

        - Estimates Shannon entropy: a value > 7.5 typically suggests encryption

        - Flags high-entropy files with a red warning

   - Logs Activity

        - Writes human-readable console alerts for each detection

        - Skips unreadable or locked files silently to avoid interruptions

### ⚙️ How to Use

  #### - Step 1: Run PowerShell as Administrator
  #### - Step 2: Execute the script
   - .\Detect-Ransomware.ps1

         Modify the $PathsToMonitor array to scan custom locations.

### 📁 Output Example

- 🔍 Starting ransomware detection scan...
- ⚠️ Suspicious file detected: C:\Users\testuser\Documents\budget.xlsx.locked
- 🔒 High-entropy (possibly encrypted) file: C:\Users\testuser\Pictures\photo.jpg.enc | Entropy: 7.98
- ✅ Scan completed.


# SSH Key Setup Automation

Automate the configuration and deployment of SSH public and private keys across multiple environments with a single command. This repository provides a secure, streamlined way to manage your SSH credentials using encrypted archives and automated scripts for both Linux and Windows.

[**Leia em Português**](README.pt-br.md)

---

## 🔒 Security Overview

> [!CAUTION]
> **Never store raw private keys in a public repository.**
> This project uses a password-protected **7-Zip** archive (`private-keys.7z`) to safeguard sensitive data. Ensure you use a strong, unique password when creating your archive.

## 📋 Prerequisites

Before running the setup scripts, ensure the following tools are installed and available in your system's `PATH`:

- **Git** (for repository management)
- **7-Zip** (for secure key extraction)
- **SSH Client** (OpenSSH)

## 🚀 Quick Start

### 🐧 Linux / macOS
Run the following command to automatically download the setup script and configure your keys:

```bash
bash <(wget -qO- https://raw.githubusercontent.com/harleysad/ssh/main/install.sh) ~/.ssh
```

### 🪟 Windows (PowerShell)
> [!IMPORTANT]
> **Administrator privileges** are required to start the `ssh-agent` service.

Execute this command in an elevated PowerShell session:

```powershell
Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/harleysad/ssh/main/install.ps1").Content
```

---

## 🛠️ How It Works

1.  **Repository Cloning:** The script clones this repository into your local `.ssh` directory.
2.  **Public Key Setup:** Public keys from the `public-keys/` directory are added to your environment.
3.  **Private Key Extraction:** The script prompts for the password to extract `private-keys.7z`.
4.  **SSH Agent Integration:** Automatically starts the `ssh-agent` and loads your keys, ensuring they are ready for immediate use.

## 📂 Project Structure

- `public-keys/`: Place your public keys here (`.pub` format).
- `private-keys.7z`: A password-protected archive containing your private keys.
- `install.sh`: Setup script for Linux/Unix systems.
- `install.ps1`: Setup script for Windows (PowerShell).
- `load-private-keys.sh`: Helper script to persist keys across shell sessions (Linux).

## 🔧 Customization

To adapt this project for your own use:

1.  **Fork** this repository.
2.  **Update URLs:** Replace the GitHub links in the Quick Start section with your fork's URL.
3.  **Replace Keys:**
    -   Add your public keys to the `public-keys/` folder.
    -   Create a new `private-keys.7z` archive with your private keys and a strong password.

---

## 🔑 Generating New Keys

If you need to generate a new SSH key pair:

### Linux / macOS
```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```

### Windows (PowerShell)
```powershell
ssh-keygen -t ed25519 -C "your_email@example.com"
```

---

*Maintained by [Harley SAD](https://github.com/harleysad).*

# SSH Key Setup Automation

This repository provides scripts to automate the configuration of your public and private SSH keys across multiple machines.

> **Warning:** Storing your keys in a public repository is not secure. Here, the key files are compressed and protected with a password. You should use your own keys and password-protect them before using these scripts.

## Requirements
- Ensure that both **Git** and **7-Zip** are installed and available in your system's PATH before running the setup scripts.

## Usage

### Linux
Run the following command to automatically download and execute the setup script:

```bash
bash <(wget -qO- https://raw.githubusercontent.com/harleysad/ssh/main/install.sh) ~/.ssh
```

> **Note:** If you fork or copy this repository, update the URL above to point to your own repository location.

### Windows
> **Note:** Administrator privileges are required to start the ssh-agent service.

Run the following command in PowerShell:

```powershell
Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/harleysad/ssh/main/install.ps1").Content
```

> **Note:** If you fork or copy this repository, update the URL above to point to your own repository location.

## How It Works
- Downloads your SSH key repository
- Extracts the password-protected archive containing your private keys
- Loads both public and private keys into the ssh-agent

## Preparing Your Keys
- Place your public keys in the `public-keys` folder before pushing or sharing the repository. This allows anyone who clones the project to access the public keys as needed.
- Compress your private keys into the `private-keys.7z` archive using 7-Zip and always set a strong password for the archive. This ensures your private keys remain protected, even if the repository is accessed by others.

## Security Notice
- Never share your private keys or passwords publicly.
- Always use strong, unique passwords to protect your key archives.

## Customization
You can adapt these scripts for your own keys. Make sure to:
- Replace the key files with your own
- Protect your private keys with a strong password
- Update the repository URLs if you fork or move the project

---

## Generating SSH Keys

### Linux
```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```

### Windows (PowerShell)
```powershell
ssh-keygen -t ed25519 -C "your_email@example.com"
```

Follow the prompts to set a file location and passphrase for your new key pair.

---

For questions or suggestions, please open an issue or contact the repository maintainer.

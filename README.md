# Fedora KDE Plasma
Collections of scripts and instructions to setup my personalized Fedora KDE Plasma desktop.

## Installation steps
This repo contains scripts that makes setting up a new device easier.
This should result in a system that has 90% of the desired configuration setup.
The setup is partially automated, and partially manual.

### 1. Pre-installation
- [Download Fedora KDE Plasma Desktop](https://fedoraproject.org/spins/kde/download) and write this to a USB stick.
- Update UEFI:
	+ Disable secure boot
	+ (Optional) Set `SATA Operation` to `AHCI` if the disk is not found during installation.

### 2. Installation
- (Connecting to the internet is not required)
- Complete the installation wizard
	+ Installation destination:
		* Storage configuration: Automatic
		* Free up space by removing or shrinking existing partitions: check
		* Encrypt my data: check
- Reboot into the installed system

### 3. Post-installation
- In "Welcome center": Enable third party repos
- Connect to the internet
- script: `system-setup-automated.sh`
- Open Discover and update all packages
- Reboot system
- script: `bitwarden-setup.sh`
- script: `syncthing-setup.sh`
- script: `system-setup-guided.sh`
- script: `mullvad-setup.sh`
- script: `signal-setup.sh`
- script: `ungoogled-chromium-setup.sh`

## TODO
- Add backup-setup.sh
	- Pika for local backups?
	- Restic for remote backups?
- Add development-setup.sh
	- OSS Code or VSCode
		- Using the official repo?
	- Dbeaver
	- Docker

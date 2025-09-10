# Installing Arch Linux in a new system

## Prepare the installation medium
```bash
sudo dd bs=4M if=PATH_TO_ISO of=/dev/disk/by-id/DEVICE conv=fsync oflag=direct status=progress
```

## Pre-installation steps
### Set keyboard locale
```bash
loadkeys us
```
### Connect to a network with Wi-Fi
Open an iwd interactive session:
```bash
iwctl
```
List all available devices:
```bash
device list
```
Turn on the device:
```bash
device NAME set-property Powered on
```
Initiate a network scan:
```bash
station NAME scan
```
List all available networks:
```bash
station NAME get-networks
```
Connect to a network:
```bash
station NAME connect SSID
```

### Partition the disk
List available disks:
```bash
fdisk -l
```
Launch fdisk on the disk to be partitioned:
```bash
fdisk /dev/DISK
```
Create a new GPT partitioning table:
```bash
g
```
Create an EFI partition from 0 to +512MB:
```bash
n
+512M
```
Change the partition type to EFI (1):
```bash
t
1
```
Create a Linux partition with the rest of the free disk space:
```bash
n
```

Print the table to verify and write the changes to the disk:
```bash
p
```

Write the changes:
```bash
w
```

### Create and mount the disk partitions
Create a FAT file system on the efi partition:
```bash
mkfs.fat -F 32 /dev/EFI_PARTITION
```
Create an ext4 file system on the root partition:
```bash
mkfs.ext4 /dev/ROOT_PARTITION
```
Mount the partitions:
```bash
mount /dev/ROOT_PARTITION /mnt
mkdir /mnt/efi
mount /dev/EFI_PARTITION /mnt/efi
```
## Installation

### Install necessary packages
Install basic packages with packstrap
```bash
pacstrap -K /mnt base linux linux-firmware intel-ucode grub efibootmgr networkmanager sudo man-db man-pages git nano
```
### Save the mount configuration
Save to /mnt/etc/fstab:
```bash
genfstab -U /mnt >> /mnt/etc/fstab
```
Verify:
```bash
cat /mnt/etc/fstab
```

### Set up the new system
Enter the new system:
```bash
arch-chroot /mnt
```

#### Setup the timezone:
```bash
ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
```
Sync the system time to the hardware clock:
```bash
hwclock --systohc
```

#### Set up language and tty keyboard map
Edit /etc/locale.gen and uncomment the entries for your locales.
```bash
nano /etc/locale.gen
```
Generate the locales
```bash
locale-gen
```
Set up locale and display language(s). Add `LANG=fr_FR.UTF-8` and (if desirable) override the display language `LC_MESSAGES=en_GB.UTF-8`
```bash
nano /etc/locale.conf
```
Set up terminal keymap `KEYMAP=us`
```bash
vim /etc/vconsole.conf
```

#### Set up hostname and hosts
Set up the computer's hostname:
```bash
echo "HOSTNAME" > /etc/hostname
```

Edit the /etc/hosts file, add the following:
```bash
127.0.0.1 localhost
::1 localhost
127.0.1.1 HOSTNAME
```

#### Root password and users
Define a root password:
```bash
passwd
```
Add a root (wheel group) user:
```bash
useradd -mG wheel USERNAME
passwd USERNAME
```

Uncomment the line underneath the "Uncomment to let members of group wheel execute any action" text to allow `sudo` for wheel group users
```bash
EDITOR=nano visudo
```

#### Configure grub
Deploy grub
```bash
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB
```
Generate the grub configuration:
```bash
grub-mkconfig -o /boot/grub/grub.cfg
```

#### Exit and reboot
Configure NetworkManager to autostart:
```bash
systemctl enable NetworkManager
```
Exit chroot:
```bash
exit
```
Unmount everything:
```bash
umount -R /mnt
```
Reboot the system and unplug the installation medium:
```bash
reboot
```
#### After the first reboot:
Enable and start the time synchronization service
```bash
timedatectl set-ntp true
```

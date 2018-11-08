#!/usr/bin/env bash
#FIXME this script partially duplicates mount_sdcard.sh
set -e

if [ ! -z "$SUDO_USER" ] || [ "$USER" == "root" ]; then
  echo "Do not run me as root."
  exit 1
fi

read -s -p "LUKS key: " key && echo

device=/dev/mmcblk1p2
name=encrypted_sdcard
mountPoint=/media/$name

echo "Once mounted, unmount with: sudo umount $mountPoint && sudo cryptsetup -q luksClose $name"

if ! sudo cryptsetup isLuks $device
then
  echo "Formatting device with LUKS"
  read -p "Press enter to continue..."
  echo -n "$key" | sudo cryptsetup -q luksFormat $device
  echo -n "$key" | sudo cryptsetup -q luksOpen $device $name
  sudo mkfs.ext4 -m0 /dev/mapper/$name
else
  echo "Opening existing formatted LUKS volume"
  for attempt in 0 1; do
    if ! echo -n "$key" | sudo cryptsetup -q luksOpen $device $name; then
      # Probably already open, close and retry:
      sudo cryptsetup -q luksClose $name
    else
      break
    fi
    if [ "$attempt" == "1" ]; then
      exit 1
    fi
  done
fi

sudo mkdir -p $mountPoint
sudo mount /dev/mapper/$name $mountPoint
sudo chown $USER $mountPoint

echo SUCCESS

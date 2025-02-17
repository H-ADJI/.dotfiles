#!/bin/bash
# safe gards to not break gloabal python installation
# function cd() {
#   builtin cd "$@" # Call the built-in cd command
#   if [ -f "./venv/bin/activate" ]; then
#     source ./venv/bin/activate
#   fi
# }
add_note() {
  echo "- $1" >>~/secondBrain/ideas.md
  bat ~/secondBrain/ideas.md
}

git_release() {
  if [ $# -lt 1 ]; then
    echo "Usage: $0 <new_git_tag>"
    echo "Example: $0 5.345.22"
    return 1
  fi
  git commit -am "update changelog" && git tag $1 && git push && git push origin $1
}

create_bootable_usb() {
  # Check if exactly two arguments are provided
  if [ "$#" -ne 2 ]; then
    echo "Usage: create_bootable_usb <path_to_iso> <device>"
    return 1
  fi

  local iso_path="$1"
  local device="$2"

  # Verify the ISO file exists
  if [ ! -f "$iso_path" ]; then
    echo "Error: ISO file '$iso_path' does not exist."
    return 1
  fi

  # Verify the device exists
  if [ ! -e "$device" ]; then
    echo "Error: Device '$device' does not exist."
    return 1
  fi

  # Check if the device is mounted and unmount it
  if mount | grep -q "$device"; then
    echo "Unmounting $device..."
    sudo umount "$device"*
    if [ $? -ne 0 ]; then
      echo "Error: Failed to unmount $device."
      return 1
    fi
  fi

  # Write the ISO to the device
  echo "Writing $iso_path to $device..."
  sudo dd if="$iso_path" of="$device" bs=4M status=progress oflag=sync
  if [ $? -ne 0 ]; then
    echo "Error: Failed to write ISO to $device."
    return 1
  fi

  # Sync and eject the device
  echo "Syncing data..."
  sync
  echo "Ejecting $device..."
  sudo eject "$device"

  echo "Bootable USB created successfully!"
}

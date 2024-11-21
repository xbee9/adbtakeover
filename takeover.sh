#!/bin/bash
clear
figlet -f slant "xbee9"
sleep 2.0
clear
bash skull5.sh
clear
while true; do
  read -ep 'Enter IP address: ' ip_address

  if ping -c 1 "$ip_address" &> /dev/null; then
    echo "Device is online."

    read -ep "Continue connection? (1-Yes, 2-No): " choice

    case $choice in
      1)
        echo "Establishing connection..."
        apt install android-tools &> /dev/null
        adb connect "$ip_address":5555  #you can change your port here :)
        adb devices
        echo "Connecting to shell in 5 seconds..."
        #clear
        sleep 10.0
        echo "Sending Connection Request"
        sleep 2.0
        echo "Connection Refused"
        sleep 2.0
        echo "Trying Again"
        sleep 2.0
        echo "Installing Backdoor"
        sleep 2.0
        echo "Trying to get in"
        sleep 2.0
        clear
        sleep 2.0
        adb shell
        sleep 15.0
        whoami
        ;;
      2)
        echo "Disconnecting..."
        exit 0
        ;;
      *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
    esac
  else
    echo "Device is offline."

    read -ep "Do you want to (3) Enter another IP, (4) Quit? " choice

    case $choice in
      3)
        continue
        ;;
      4)
        echo "Quitting..."
        exit 0
        ;;
      *)
        echo "Invalid choice. Exiting."
        echo "Shortly you'll be redirected to the socials page!"
        sleep 2.5
        python socials.py
        echo "Thank you for using my tool. :)"
        exit 1
        ;;
    esac
  fi
done

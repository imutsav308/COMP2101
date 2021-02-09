#!/bin/bash
#
# This script is for the bash lab on variables, dynamic data, and user input
# Download the script, do the tasks described in the comments
# Test your script, run it on the production server, screenshot that
# Send your script to your github repo, and submit the URL with screenshot on Blackboard

# Get the current hostname using the hostname command and save it in a variable
read -s -n 1 -p "Press Enter to check Your Current Host name:"

a=$(cat /etc/hostname)

# Tell the user what the current hostname is in a human friendly way
echo "Your Current Hostname: $a"
# Ask for the user's student number using the read command
echo "To change your Hostname to pcNNNNNNNNN where NNNNNNNNN is your student No."

echo "Enter Your StudentNumber:"

read StudentNumber
# Use that to save the desired hostname of pcNNNNNNNNNN in a variable, where NNNNNNNNN is the student number entered by the user
hostnamectl set-hostname pc$StudentNumber
b=$(hostname)
echo " Your New hostname: $b"
echo "======"
# If that hostname is not already in the /etc/hosts file, change the old hostname in that file to the new name using sed or something similar and
#     tell the user you did that
#e.g. sed -i "s/$oldname/$newname/" /etc/hosts
echo "Your hostname is changed to new one"
sudo sed -i "s/$a/$b/" /etc/hosts
echo "Hostname is changed"
echo "======"
# If that hostname is not the current hostname, change it using the hostnamectl command and
#     tell the user you changed the current hostname and they should reboot to make sure the new name takes full effect
#e.g. hostnamectl set-hostname $newname
hostnamectl set-hostname $b
echo "To apply changes you have done you need to reboot your system... "
read -s -n 1 -p "Press Enter to make changes and reboot your pc"
sudo reboot

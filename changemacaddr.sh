#!/bin/bash

# Generate a random MAC address
random_mac=$(openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//')

# Define the network interface (e.g., en0, en1, wlo1, etc.)
interface="wlo1"

# Print the generated MAC address
echo "Generated MAC Address: $random_mac"

# Disable the network interface
sudo ip link set dev $interface down

# Change the MAC address
sudo ip link set dev $interface address $random_mac

# Enable the network interface
sudo ip link set dev $interface up

# Verify the change
ip link show $interface


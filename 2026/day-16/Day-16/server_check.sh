#!/bin/bash

service="nginx"

read -p "Do you want to check the status of $service? (y/n): " answer

if [ "$answer" = "y" ]; then

    echo "Checking status of $service..."
    systemctl status $service

    if systemctl is-active --quiet $service; then
        echo "$service is running."
    else
        echo "$service is not running."
    fi

elif [ "$answer" = "n" ]; then
    echo "Skipped."

else
    echo "Please enter only y or n."
fi



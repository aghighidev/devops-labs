#!/bin/bash

service="$1"

if [[ -z "$service" ]]; then
	echo -e "\e[31mcorrect usage = <service-name>:<host-name>:<port>\e[0m"
	exit 1
fi

IFS=':' read -r name host port <<< "$service"

if [[ -z "$host" || -z "$port" ]]; then
    echo -e "\e[31minvalid format. correct usage: <service-name>:<host>:<port>\e[0m"
    exit 1
fi

if (timeout 5 bash -c "echo > /dev/tcp/$host/$port") 2>/dev/null; then
	echo -e "\e[32m$name is running :)\e[0m"
else
	echo -e "\e[31m$name is not running\e[0m"
fi

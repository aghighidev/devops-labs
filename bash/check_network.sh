#!/bin/bash


container="$1"
port="$2"

if [[ -z "$container" || -z "$port"  ]]; then
	echo -e "\e[31mUsage : $0 <container_name> <port>\e[0m"
	exit 1
fi

if  (timeout 5 bash -c "echo > /dev/tcp/$container/$port") 2>/dev/null; then
	echo "this container is running healthy :)"
else
		echo "container not running :("
fi

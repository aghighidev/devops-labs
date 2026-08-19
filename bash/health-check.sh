#!/bin/bash
separator() 
{
    echo -e "\e[34m###############\e[0m"
}

echo -e "\e[32mWELCOME!\e[0m"
echo ""
echo -e "\e[35m========== SERVER REPORT ==========\e[0m"
host=$( hostname )
echo "HOST NAME : $host"
separator
time=$( date | awk '{print $4}' )
echo "CURRENT TIME : $time"
separator
uptime=$( uptime -p  )
echo "UPTIME : $uptime"
separator
disk=$(df / | awk 'NR==2 {print int($3/$2*100)}')
if [[ $disk -gt 70 ]]; then
	echo -e "DISK USAGE : \e[31m$disk%\e[0m"
	echo -e "\e[31mYOUR DISK IS ALMOST FULL!\e[0m"
else
	echo -e "DISK USAGE : \e32m$disk%\e[0m"
fi
separator
ram=$(free | awk '/Mem: / {print int($3/$2*100)}')
if [[ $ram -gt 80 ]]; then
        echo -e "RAM USAGE : $ram%. \e[31mYOUR RAM USAGE IS HIGH!\e[0m"
else
	echo -e "RAM USAGE : \e[32m$ram%\e[0m"
fi
separator
docker=$( systemctl is-active docker )
if [[ $docker == "active" ]]; then
	echo -e "DOCKER SERVICE : \e[32m$docker\e[0m"
else
	echo -e "DOCKER SERVICE : \e[31m$docker\e[0m"
fi
separator
if ping -c 1 8.8.8.8 > /dev/null 2>&1 ; then
	echo -e "INTERNET : \e[32mCONNECTED\e[0m"
else
	echo -e "INTERNET : \e[31mDISCONNECTED\e[0m"
fi


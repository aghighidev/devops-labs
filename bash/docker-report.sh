#!/bin/bash


separator()
{
    echo -e "\e[34m#######################\e[0m"
}



echo -e "\e[32m==================== DOCKER SYSTEM REPORT ====================\e[0m"

echo ""

dservice=$(systemctl is-active docker)
separator
echo -e "DOCKER SERVICE : \e[32m$dservice\e[0m"

runcon=$(docker ps | grep -v "CONTAINER" | wc -l)
separator
echo -e "RUNNING CONTAINERS : \e[32m$runcon\e[0m"

stocon=$(docker ps -af "status=exited "| grep -v "CONTAINER" | wc -l)
separator
echo -e "STOPPED CONTAINERS : \e[31m$stocon\e[0m"

image=$(docker images | grep -v "IMAGE" | wc -l)
separator
echo -e "TOTAL IMAGES : \e[32m$image\e[0m"

volume=$(docker volume ls | grep -v "DRIVER" | wc -l)
separator
echo -e "TOTAL VOLUMES : \e[32m$volume\e[0m"

net=$(docker network ls | grep -v "NETWORK" | wc -l)
separator
echo -e "TOTAL NETWORKS : \e[32m$net\e[0m"

echo ""

echo -e "\e[36m============  DOCKER DISK USAGE =============\e[0m"

echo ""

dimage=$(docker system df | awk '/Images/ {print $4}')
separator
echo -e "IMAGES : \e[32m$dimage\e[0m"

dcon=$(docker system df | awk '/Containers/ {print $4}')
separator
echo -e "CONTAINERS : \e[32m$dcon\e[0m"

locvol=$(docker system df | awk '/Local/ {print $5}')
separator
echo -e "LOCAL VOLUMES : \e[32m$locvol\e[0m"

cache=$(docker system df | awk '/Build/ {print $5}')
separator
echo -e "BUILD CACHE : \e[32m$cache\e[0m"
echo ""
echo -e "\e[32m============================================================\e[0m"










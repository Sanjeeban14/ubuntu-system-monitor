#!/bin/bash

GREEN="\e[32m"
RED="\e[31m"
YELLOW="\e[33m"
BLUE="\e[34m"
CYAN="\e[36m"
RESET="\e[0m"

while true
do
	clear
	echo -e "${CYAN}===============================${RESET}"
	echo -e "${CYAN}     UBUNTU SYSTEM MONITOR     ${RESET}"
	echo -e "${CYAN}===============================${RESET}"

	CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8 "%"}')
	echo -e "${YELLOW}CPU USAGE:${RESET} $CPU_USAGE"

	MEMORY=$(free -h | awk '/Mem:/ {print $3 "/" $2}')
	echo -e "${RED}Memory usage:${RESET} $MEMORY"

	DISK=$(df -h | awk 'NR==3 {print $3 "/" $2}')
	echo -e "${YELLOW}Disk usage:${RESET} $DISK"

	UPTIME=$(uptime -p)
	echo -e "${RED}Uptime:${RESET} $UPTIME"

	echo -e "${GREEN}Top 5 processes (CPU):${RESET}"
	ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6

	
	sleep 2
done

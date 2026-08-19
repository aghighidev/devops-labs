#!/bin/bash

echo "$1"
if [[ -f "$1"  ]]; then
	lines=$(wc -l $1 | awk '{print $1}')
	echo "total lines : $lines"
	err=$(grep -ci error "$1")
	echo "ERRORS : $err"
	war=$(grep -ci warning "$1")
	echo "WARNINGS : $war"
	inf=$(grep -ci info "$1")
	echo "INFO : $inf"
	echo ""
	read -p "do you want to see the long report? (y/n)" answer
	if [[ $answer == "y" ]]; then
		clear
		echo "===================="
		echo "Log Report"
		echo "===================="
		echo ""
		echo "FILE : $1"
		echo "LINES : $lines"
		echo "ERRORS : $err"
		echo "WARNINGS : $war"
		echo "INFO : $inf"
	else
		echo "GOODBYE!"
	fi
else
	echo "file not exist"
fi

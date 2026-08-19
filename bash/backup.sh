#!/bin/bash

echo "$1"

if [[ -d "$1" ]]; then
	tar -czvf "$1.tar.gz" "$1"
else
	echo "$1 is not exist"
fi
echo "done! :)"


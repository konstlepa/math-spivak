#!/bin/bash

usage() {
	echo "Usage: $0 <WEBHOOK URL> <FILE>"
}

if [ "$#" -ne 2 ]; then
	usage
	exit 1
fi

curl -F "file1=@$2" $1
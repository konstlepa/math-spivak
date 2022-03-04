#!/bin/bash
#
# This script extracts a page from the file main.pdf as an image, and sends it to Discord's channel.

INPUT_FILE=$2
OUTPUT_FILE=$3

PAGE_NUM=$(($1 - 1))
LAST_PAGE_NUM=$(pdfinfo ${INPUT_FILE} | grep Pages: | tr -d -c 0-9)

usage() {
	echo "Usage: $0 <PAGE NUMBER> <INPUT PDF FILE> <OUTPUT JPG FILE>"
	echo -e "\t Total pages: ${LAST_PAGE_NUM}"
}

if [ "$#" -ne 3 ]; then
	usage
	exit 1
fi

if (($PAGE_NUM < 0 || $PAGE_NUM >= $LAST_PAGE_NUM)); then
	usage
	exit 1
fi

convert -density 600 "${INPUT_FILE}[${PAGE_NUM}]" -quality 600 jpg:- | convert -resize "%25x%25" jpg:- $OUTPUT_FILE


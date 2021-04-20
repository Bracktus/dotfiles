#!/usr/bin/env bash

# Takes the pdf file and generates fdf file
# Fills in fdf file
# Fills in form 
# output to $2

if [ $# -ne 2 ]; then
    echo 1>&2 "Usage: $0 file output"
    exit 3
fi

pdftk "$1" generate_fdf output fields.fdf
# obtain options
fields=$(grep "/T" fields.fdf | cut -c 5- | sed 's/.$//')

for ((line=1; line<=$(echo "${fields}" | wc -l); line++))
do
    linestr=$(echo "$fields" | awk "$line"==NR)
    echo "$linestr"
    read -r input
    sed -i "/${linestr}/!b;n;c/V(${input})" fields.fdf
done

pdftk "$1" fill_form fields.fdf output "$2"
# cleanup
rm fields.fdf


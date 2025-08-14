#!/bin/bash
searchTerm="value_42"

echo "Timing cat testfile_1k.csv and testfile_1m.csv"
time {
    fileData1k=$(cat testfile_1k.csv)
    fileData1m=$(cat testfile_1m.csv)
} 2>&1

echo ""
echo "Measuring 1000x grep 1K"
time {
    for i in {1..1000}; do
        echo "$fileData1k" | grep "$searchTerm" > /dev/null
    done
} 2>&1

echo ""
echo "Measuring 1x grep 1M"
time {
    echo "$fileData1m" | grep "$searchTerm" > /dev/null
} 2>&1
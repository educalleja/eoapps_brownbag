#!/bin/bash

mkdir -p images/L3/

bash 01_download_files.sh
echo "Files downloaded successfully"

bash 02_merge_files.sh
echo "Files merged successfully"
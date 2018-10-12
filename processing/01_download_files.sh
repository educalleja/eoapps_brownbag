#!/bin/bash

set -e

START_YEAR=2003
END_YEAR=2018
YEAR=$START_YEAR
echo "https://oceandata.sci.gsfc.nasa.gov/cgi/getfile/A${START_YEAR}001${END_YEAR}031.L3b_MO_NSST.nc" > files.txt
while [ $YEAR -le $END_YEAR ]
do
  echo "https://oceandata.sci.gsfc.nasa.gov/cgi/getfile/A${YEAR}001${YEAR}031.L3b_MO_NSST.nc" >> files.txt
  YEAR=$(($YEAR+1))
done

mkdir -p images/L3/
wget --content-disposition -i files.txt -P images/L3/
ls -l images/L3/ | grep _NSST.nc | awk {'print $10'} > images/L3/files.txt
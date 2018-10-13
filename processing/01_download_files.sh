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

# Combines all files into a single one
# for each period, generating a new l3bin file
YEAR=$START_YEAR
while [ $YEAR -le $END_YEAR ]
do
  l3mapgen ifile=A${YEAR}001${YEAR}031.L3b_MO_NSST.nc ofile=A${YEAR}001${YEAR}031.L3m_MO_NSST product=sst interp=area north=90 south=-90 west=-180 east=180
  YEAR=$(($YEAR+1))
done
l3mapgen ifile=A${START_YEAR}JAN${END_YEAR}JAN.L3b_MC_NSST.nc ofile=A${START_YEAR}JAN${END_YEAR}JAN.L3m_CL product=sst interp=area north=90 south=-90 west=-180 east=180
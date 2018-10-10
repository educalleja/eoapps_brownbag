#!/bin/bash

set -e

wget --content-disposition -i files.txt -P images/L3/

mkdir -p images/L3/A20032018_3MO_NSST
mkdir -p images/L3/A2003JAN_3MO_NSST
mkdir -p images/L3/A2008JAN_3MO_NSST
mkdir -p images/L3/A2013JAN_3MO_NSST
mkdir -p images/L3/A2018JAN_3MO_NSST

mv images/L3/A200[2-3]*201*.L3b_MC_NSST.nc images/L3/A20032018_3MC_NSST/
mv images/L3/A200[2-3]*200[2-3]*.L3b_MO_NSST.nc images/L3/A2003JAN_3MO_NSST/
mv images/L3/A200[7-8]*200[7-8]*.L3b_MO_NSST.nc images/L3/A2008JAN_3MO_NSST/
mv images/L3/A201[2-3]*201[2-3]*.L3b_MO_NSST.nc images/L3/A2013JAN_3MO_NSST/
mv images/L3/A201[7-8]*201[7-8]*.L3b_MO_NSST.nc images/L3/A2018JAN_3MO_NSST/

# Preparing textfile with files to be processed with l3bin
# Input file for l3bin
ls -l images/L3/A20032018_3MC_NSST | grep .nc | awk {'print $10'} > images/L3/A20032018_3MC_NSST/files.txt
ls -l images/L3/A2003JAN_3MO_NSST | grep .nc | awk {'print $10'} > images/L3/A2003JAN_3MO_NSST/files.txt
ls -l images/L3/A2008JAN_3MO_NSST | grep .nc | awk {'print $10'} > images/L3/A2008JAN_3MO_NSST/files.txt
ls -l images/L3/A2013JAN_3MO_NSST | grep .nc | awk {'print $10'} > images/L3/A2013JAN_3MO_NSST/files.txt
ls -l images/L3/A2018JAN_3MO_NSST | grep .nc | awk {'print $10'} > images/L3/A2018JAN_3MO_NSST/files.txt
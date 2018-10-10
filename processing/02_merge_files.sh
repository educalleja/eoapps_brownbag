#!/bin/bash
# Combines all three files into a single one
# for each period, generating a new l3bin file

cd images/L3/A20032018_3MC_NSST
l3bin in=files.txt out=A20032018.L3b_3MC_NSST

cd ../A2018JAN_3MO_NSST
l3bin in=files.txt out=A2018JAN_3MO_NSST

cd ../A2013JAN_3MO_NSST
l3bin in=files.txt out=A2013JAN_3MO_NSST

cd ../A2008JAN_3MO_NSST
l3bin in=files.txt out=A2008JAN_3MO_NSST

cd ../A2003JAN_3MO_NSST
l3bin in=files.txt out=A2003JAN_3MO_NSST

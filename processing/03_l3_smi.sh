# Creates an SMI Map file from L3 bin files

cd images/L3/A20032018_3MC_NSST
l3mapgen ifile=A20032018.L3b_3MC_NSST ofile=A20032018.L3m_3MC_NSST product=sst interp=area north=90 south=-90 west=-180 east=180

cd ../A2018JAN_3MO_NSST
l3mapgen ifile=A2018JAN_3MO_NSST ofile=A2018JAN.L3m_3MO_NSST product=sst interp=area north=90 south=-90 west=-180 east=180

cd ../A2013JAN_3MO_NSST
l3mapgen ifile=A2013JAN_3MO_NSST ofile=A2013JAN.L3m_3MO_NSST product=sst interp=area north=90 south=-90 west=-180 east=180

cd ../A2008JAN_3MO_NSST
l3mapgen ifile=A2008JAN_3MO_NSST ofile=A2008JAN.L3m_3MO_NSST product=sst interp=area north=90 south=-90 west=-180 east=180

cd ../A2003JAN_3MO_NSST
l3mapgen ifile=A2003JAN_3MO_NSST ofile=A2003JAN.L3m_3MO_NSST product=sst interp=area north=90 south=-90 west=-180 east=180
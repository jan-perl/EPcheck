#!/bin/bash
BAGVERSION=$1
EPCVERSION=$2
echo BAGVERSION ${BAGVERSION} EPCVERSION ${EPCVERSION}
#ls -l data/bag_snapshot_${BAGVERSION}/snapshot_${BAGVERSION}.gpkg
cfgsrc=cfg/EPcheck.dms
cfgtmp=cfg.tmp
runcmd1="wine"
runcmd2="~/.wine/drive_c/Prog*iles/ObjectVision/GeoDms8041/GeoDmsRun.exe" 


sed -e 's+alleen_Ameland *:=.*$+alleen_Ameland := False,+' -e "s+BAGVERSION *:=.*$+BAGVERSION := \"${BAGVERSION}\";+" -e "s+EPCVERSION *:=.*$+EPCVERSION := \"${EPCVERSION}\";+" < $cfgsrc >  $cfgtmp
diff -w $cfgsrc  $cfgtmp
mv $cfgtmp $cfgsrc

if [ -r data/bag_snapshot_${BAGVERSION}/snapshot_${BAGVERSION}.gpkg ]
then
  echo BAG present  
elif [ -r data/bag_snapshot_${BAGVERSION}.zip ]
then  
    mkdir data/bag_snapshot_${BAGVERSION}
    unzip data/bag_snapshot_${BAGVERSION}.zip -d data/bag_snapshot_${BAGVERSION}
else
  echo BAG zip missing
  exit 8
fi

if [ -r intermediate/epdata_f_${EPCVERSION}.fss ]
then
  echo native format epdata present
elif [ -r data/${EPCVERSION}_csv.zip ]
then
   if [ -r data/${EPCVERSION}_csv/${EPCVERSION}_csv.csv ]
   then
     echo EPC csv present
   else
      mkdir data/${EPCVERSION}_csv
      unzip data/${EPCVERSION}_csv.zip -d data/${EPCVERSION}_csv
   fi    
   echo yes | sh -c "$runcmd1 $runcmd2  $cfgsrc ToDbf/i_epdat_fss"
   rm data/${EPCVERSION}_csv/${EPCVERSION}_csv.csv 
   rmdir data/${EPCVERSION}_csv
else
  echo EPC zip missing
  exit 8
fi

echo yes | sh -c "$runcmd1 $runcmd2  $cfgsrc Results/koppel1/pergemeentecatd"


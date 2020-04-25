@echo off
title Get libnx
if not exist libnx ( git clone https://github.com/switchbrew/libnx )
cd libnx 
git pull
cd ..
title Make libnx
make -C libnx -j7

title Copy-libnx
xcopy .\libnx\nx\* /I/E/Y/H/D C:\devkitPro\libnx\

title Aplly sept patch
rm sept/sept-secondary/sept-secondary_00.enc
rm sept/sept-secondary/sept-secondary_01.enc
rm sept/sept-secondary/sept-secondary_dev_00.enc
rm sept/sept-secondary/sept-secondary_dev_01.enc
rem rm payload.bin
rem wget https://github.com/StarDustCFW/StarDustCFWPack/raw/master/SD_card_root/payload.bin
wget --output-file=%temp%\LOG.log -b -P sept/sept-secondary/ https://github.com/StarDustCFW/StarDustCFWPack/raw/master/SD_card_root/sept/sept-secondary_00.enc
wget --output-file=%temp%\LOG.log -b -P sept/sept-secondary/ https://github.com/StarDustCFW/StarDustCFWPack/raw/master/SD_card_root/sept/sept-secondary_01.enc
wget --output-file=%temp%\LOG.log -b -P sept/sept-secondary/ https://github.com/StarDustCFW/StarDustCFWPack/raw/master/SD_card_root/sept/sept-secondary_dev_00.enc
wget --output-file=%temp%\LOG.log -b -P sept/sept-secondary/ https://github.com/StarDustCFW/StarDustCFWPack/raw/master/SD_card_root/sept/sept-secondary_dev_01.enc

title Make Atmosphere
make dist -j7
echo completado
echo %cd%
cmd k
%systemroot%system32timeout.exe 10
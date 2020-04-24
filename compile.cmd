@echo off
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
title Submodule update
git submodule update

title make libnx
make -C libnx

title make dist
make dist
echo completado
echo %cd%
cmd k
%systemroot%system32timeout.exe 10
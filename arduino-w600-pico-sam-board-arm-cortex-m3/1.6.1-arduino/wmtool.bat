:%1 当前脚本所在的工作路径
:%2 处理elf文件的objcopy命令
:%3 elf文件原始路径
:%4 bin 文件路径
:%5 secimg file

:@echo off



@set WORK_PATH=%1
echo work_path=%WORK_PATH%
rem work_path=C:\Users\costycnc\AppData\Local\Arduino15\packages\w600\tools\wmtools\0.3.2
@set armgcc_OBJ_CMD=%2
echo armgcc_OBJ_CMD=%armgcc_OBJ_CMD%
rem armgcc_OBJ_CMD=C:\Users\costycnc\AppData\Local\Arduino15\packages\w600\tools\gcc-arm-none-eabi\4_9-2015q1-20150306/bin/arm-none-eabi-objcopy
@set armgcc_ELF_FILE_PATH=%3
echo armgcc_ELF_FILE_PATH=%armgcc_ELF_FILE_PATH%
rem armgcc_ELF_FILE_PATH=C:\Users\costycnc\AppData\Local\Temp\arduino\sketches\4DC77FADBBED9323941608E359064CBD/sketch_jun15a.ino.elf
@set target_BIN_FILE_PATH=%4
echo target_BIN_FILE_PATH=%target_BIN_FILE_PATH%
rem C:\Users\costycnc\AppData\Local\Temp\arduino\sketches\1B10DED7D1AEA8D09A097C02F23B4FF3/blink-asm.ino.bin
@set SEC_IMG_FILE=%5
echo SEC_IMG_FILE=%SEC_IMG_FILE%
rem C:\Users\costycnc\AppData\Local\Arduino15\packages\w600\hardware\w600\0.2.6/bootloaders/secboot/secboot.img

@set tmp=%target_BIN_FILE_PATH%
rem tmp=C:\Users\costycnc\AppData\Local\Temp\arduino\sketches\4DC77FADBBED9323941608E359064CBD/sketch_jun15a.ino.bin
@set armgcc_BIN_FILE_PATH=%target_BIN_FILE_PATH:.bin=.objcopy.bin%
rem armgcc_BIN_FILE_PATH=C:\Users\costycnc\AppData\Local\Temp\arduino\sketches\4DC77FADBBED9323941608E359064CBD/sketch_jun15a.ino.objcopy.bin
@set mid_img_file_name=%armgcc_BIN_FILE_PATH:.objcopy.bin=.objcopy.img%
rem mid_img_file_name=C:\Users\costycnc\AppData\Local\Temp\arduino\sketches\4DC77FADBBED9323941608E359064CBD/sketch_jun15a.ino.objcopy.img
@set mid_gz_img_file_name=%mid_img_file_name:.objcopy.img=.gz.img%
@set mid_sec_img_file_name=%mid_gz_img_file_name:.gz.img=.sec.img%
@set target_BIN_FILE_PATH=%tmp:.bin=.FLS%
rem target_BIN_FILE_PATH=C:\Users\costycnc\AppData\Local\Temp\arduino\sketches\4DC77FADBBED9323941608E359064CBD/sketch_jun15a.ino.FLS

echo tmp=%tmp%
echo armgcc_BIN_FILE_PATH=%armgcc_BIN_FILE_PATH%
echo mid_img_file_name=%mid_img_file_name%
echo mid_gz_img_file_name=%mid_gz_img_file_name%
echo mid_sec_img_file_name=%mid_sec_img_file_name%
echo target_BIN_FILE_PATH=%target_BIN_FILE_PATH%


:%armgcc_ELF_CMD%  --output-target=binary -S -g -x -X -R .bss -R .reginfo -R .stack %armgcc_ELF_FILE_PATH% %armgcc_BIN_FILE_PATH%
:%armgcc_ELF_CMD%  --output-target=binary -S -g -x -X                               %armgcc_ELF_FILE_PATH% %armgcc_BIN_FILE_PATH%
%armgcc_OBJ_CMD%  --output-target=binary %armgcc_ELF_FILE_PATH% %armgcc_BIN_FILE_PATH%

@copy %WORK_PATH%\version.txt %WORK_PATH%\version_bk.txt >null
@%WORK_PATH%\wm_gzip.exe %armgcc_BIN_FILE_PATH%
echo execute=%WORK_PATH%\wm_gzip.exe %armgcc_BIN_FILE_PATH%
@%WORK_PATH%\makeimg.exe %armgcc_BIN_FILE_PATH% %mid_img_file_name% 0 0 %WORK_PATH%\version.txt 90000 10100
echo execute=%WORK_PATH%\makeimg.exe %armgcc_BIN_FILE_PATH% %mid_img_file_name% 0 0 %WORK_PATH%\version.txt 90000 10100
@%WORK_PATH%\makeimg.exe %armgcc_BIN_FILE_PATH%.gz %mid_gz_img_file_name% 0 1 %WORK_PATH%\version.txt 90000 10100 %armgcc_BIN_FILE_PATH% 
echo execute=%WORK_PATH%\makeimg.exe %armgcc_BIN_FILE_PATH%.gz %mid_gz_img_file_name% 0 1 %WORK_PATH%\version.txt 90000 10100 %armgcc_BIN_FILE_PATH% 
@%WORK_PATH%\makeimg.exe %armgcc_BIN_FILE_PATH% %mid_sec_img_file_name% 0 0 %WORK_PATH%\version.txt 90000 10100
echo execute=%WORK_PATH%\makeimg.exe %armgcc_BIN_FILE_PATH% %mid_sec_img_file_name% 0 0 %WORK_PATH%\version.txt 90000 10100
@%WORK_PATH%\makeimg_all.exe %SEC_IMG_FILE% %mid_img_file_name% %target_BIN_FILE_PATH%
echo execute=%WORK_PATH%\makeimg_all.exe %SEC_IMG_FILE% %mid_img_file_name% %target_BIN_FILE_PATH%
:@del "..\Bin\WM_W600.img"

echo final=====%armgcc_BIN_FILE_PATH%
python3 %WORK_PATH%\w600tool.py -e -u %armgcc_BIN_FILE_PATH:.objcopy.bin=.fls%
rem python3 %WORK_PATH%\w600tool.py -u %armgcc_BIN_FILE_PATH:.bin=.img%

@echo on
install tool https://developer.arm.com/-/media/Files/downloads/gnu/12.2.mpacbti-rel1/binrel/arm-gnu-toolchain-12.2.mpacbti-rel1-mingw-w64-i686-arm-none-eabi.exe

Set environment variable path with bin path


I insert these files in C:\Users-name-\AppData\Local\Arduino15\packages\w600\tools\gcc-arm-none-eabi\4_9-2015q1-20150306\bin

So... i installed first package w600-pico in arduino

i compile asm file from https://gist.github.com/BobBurns/bb601d3432650073a8b4

with test.bat verify if arm-none-eabi-as is functional will response with:

      GNU assembler (GNU Tools for ARM Embedded Processors) 2.24.0.20150304
      Copyright 2013 Free Software Foundation, Inc.
      This program is free software; you may redistribute it under the terms of
      the GNU General Public License version 3 or later.
      This program has absolutely no warranty.
      This assembler was configured for a target of `arm-none-eabi'.
      
test1.bat  >>  arm-none-eabi-as -g prog1.S -o prog1.o  

test2.bat  >>  arm-none-eabi-ld prog1.o -o prog1.elf -Ttext=0x8000000

test4.bat  >>  arm-none-eabi-objcopy -O binary prog1.elf prog1.bin

dissasembly.bat >>  arm-none-eabi-objdump -D -bbinary -marm prog1.bin -Mforce-thumb > output.s




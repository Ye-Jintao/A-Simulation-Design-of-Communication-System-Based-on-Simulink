@echo off
set COMPILER=E:\Matlab\mingw64\bin\gcc
                set CXXCOMPILER=E:\Matlab\mingw64\bin\g++
                set COMPFLAGS=-c -fexceptions -fno-omit-frame-pointer -m64 -DMATLAB_MEX_FILE  -DMATLAB_MEX_FILE 
                set CXXCOMPFLAGS=-c -fexceptions -fno-omit-frame-pointer -m64 -DMATLAB_MEX_FILE  -DMATLAB_MEX_FILE 
                set OPTIMFLAGS=-O2 -fwrapv -DNDEBUG
                set DEBUGFLAGS=-g
                set LINKER=E:\Matlab\mingw64\bin\gcc
                set CXXLINKER=E:\Matlab\mingw64\bin\g++
                set LINKFLAGS=-m64 -Wl,--no-undefined -shared -static -L"E:\Matlab\extern\lib\win64\mingw64" -llibmx -llibmex -llibmat -lm -llibmwlapack -llibmwblas -Wl,"E:\Matlab/extern/lib/win64/mingw64/mexFunction.def"
                set LINKDEBUGFLAGS=-g
                set NAME_OUTPUT=-o "%OUTDIR%%MEX_NAME%%MEX_EXT%"
set PATH=E:\Matlab\mingw64\bin;E:\Matlab\extern\include\win64;E:\Matlab\extern\include;E:\Matlab\simulink\include;E:\Matlab\lib\win64;%MATLAB_BIN%;%PATH%
set INCLUDE=E:\Matlab\mingw64\include;;%INCLUDE%
set LIB=E:\Matlab\mingw64\lib;;%LIB%
set LIBPATH=E:\Matlab\extern\lib\win64;%LIBPATH%

gmake SHELL="cmd" -f untitled_cgxe.gmk

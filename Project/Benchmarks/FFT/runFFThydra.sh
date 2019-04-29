#!/bin/sh
string1=$0
string2="fftS.c"
string3="fftS"
string4="fft.cu"
string5="fft"
string6="fftOutput.txt"
string7="fftS"
string8="fft"

echo "Compiling"
gcc fftS.c -std=c99 -o fftS -lm
nvcc fft.cu -o fft
echo "Compiled"
echo "Running FFT"
echo " " >> fftOutput.txt
bpsh 10 ./fftS $1 >> fftOutput.txt
bpsh 12 ./fft $1 >> fftOutput.txt

echo "Complete."

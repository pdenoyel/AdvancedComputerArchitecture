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

echo "Size: 8"
./fftS 8 >> fftOutput.txt
./fft 8 >> fftOutput.txt
echo " " >> fftOutput.txt

echo "Size: 16"
./fftS 16 >> fftOutput.txt
./fft 16 >> fftOutput.txt
echo " " >> fftOutput.txt

echo "Size: 32"
./fftS 32 >> fftOutput.txt
./fft 32 >> fftOutput.txt
echo " " >> fftOutput.txt

echo "Size: 64"
./fftS 64 >> fftOutput.txt
./fft 64 >> fftOutput.txt
echo " " >> fftOutput.txt

echo "Size: 128"
./fftS 128 >> fftOutput.txt
./fft 128 >> fftOutput.txt
echo " " >> fftOutput.txt

echo "Size: 256"
./fftS 256 >> fftOutput.txt
./fft 256 >> fftOutput.txt
echo " " >> fftOutput.txt

echo "Size: 512"
./fftS 512 >> fftOutput.txt
./fft 512 >> fftOutput.txt
echo " " >> fftOutput.txt

echo "Size: 1024"
./fftS 1024 >> fftOutput.txt
./fft 1024 >> fftOutput.txt
echo " " >> fftOutput.txt

echo "Size: 2048"
./fftS 2048 >> fftOutput.txt
./fft 2048 >> fftOutput.txt
echo " " >> fftOutput.txt

echo "Size: 4096"
./fftS 4096 >> fftOutput.txt
./fft 4096 >> fftOutput.txt
echo " " >> fftOutput.txt

echo "Size: 8192"
./fftS 8192 >> fftOutput.txt
./fft 8192 >> fftOutput.txt
echo " " >> fftOutput.txt

echo "Size: 16384"
./fftS 16384 >> fftOutput.txt
./fft 16384 >> fftOutput.txt
echo " " >> fftOutput.txt

echo "Complete."

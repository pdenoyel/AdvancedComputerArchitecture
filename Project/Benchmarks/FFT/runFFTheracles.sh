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
ssh node17 gcc ${string1/runFFTheracles.sh/$string2} -std=c99 -o ${string1/runFFTheracles.sh/$string3} -lm
ssh node18 nvcc ${string1/runFFTheracles.sh/$string4} -o ${string1/runFFTheracles.sh/$string5}
echo "Compiled"
echo "Running FFT"
echo " " >> ${string1/runFFTheracles.sh/"$string6"}
echo "Size: 8"
ssh node17 ${string1/runFFTheracles.sh/$string7} 8 >> ${string1/runFFTheracles.sh/"$string6"}
ssh node18 ${string1/runFFTheracles.sh/$string8} 8 >> ${string1/runFFTheracles.sh/"$string6"}
echo " " >> ${string1/runFFTheracles.sh/"$string6"}

echo "Size: 16"
ssh node17 ${string1/runFFTheracles.sh/$string7} 16 >> ${string1/runFFTheracles.sh/"$string6"}
ssh node18 ${string1/runFFTheracles.sh/$string8} 16 >> ${string1/runFFTheracles.sh/"$string6"}
echo " " >> ${string1/runFFTheracles.sh/"$string6"}

echo "Size: 32"
ssh node17 ${string1/runFFTheracles.sh/$string7} 32 >> ${string1/runFFTheracles.sh/"$string6"}
ssh node18 ${string1/runFFTheracles.sh/$string8} 32 >> ${string1/runFFTheracles.sh/"$string6"}
echo " " >> ${string1/runFFTheracles.sh/"$string6"}

echo "Size: 64"
ssh node17 ${string1/runFFTheracles.sh/$string7} 64 >> ${string1/runFFTheracles.sh/"$string6"}
ssh node18 ${string1/runFFTheracles.sh/$string8} 64 >> ${string1/runFFTheracles.sh/"$string6"}
echo " " >> ${string1/runFFTheracles.sh/"$string6"}

echo "Size: 128"
ssh node17 ${string1/runFFTheracles.sh/$string7} 128 >> ${string1/runFFTheracles.sh/"$string6"}
ssh node18 ${string1/runFFTheracles.sh/$string8} 128 >> ${string1/runFFTheracles.sh/"$string6"}
echo " " >> ${string1/runFFTheracles.sh/"$string6"}

echo "Size: 256"
ssh node17 ${string1/runFFTheracles.sh/$string7} 256 >> ${string1/runFFTheracles.sh/"$string6"}
ssh node18 ${string1/runFFTheracles.sh/$string8} 256 >> ${string1/runFFTheracles.sh/"$string6"}
echo " " >> ${string1/runFFTheracles.sh/"$string6"}

echo "Size: 512"
ssh node17 ${string1/runFFTheracles.sh/$string7} 512 >> ${string1/runFFTheracles.sh/"$string6"}
ssh node18 ${string1/runFFTheracles.sh/$string8} 512 >> ${string1/runFFTheracles.sh/"$string6"}
echo " " >> ${string1/runFFTheracles.sh/"$string6"}

echo "Size: 1024"
ssh node17 ${string1/runFFTheracles.sh/$string7} 1024 >> ${string1/runFFTheracles.sh/"$string6"}
ssh node18 ${string1/runFFTheracles.sh/$string8} 1024 >> ${string1/runFFTheracles.sh/"$string6"}
echo " " >> ${string1/runFFTheracles.sh/"$string6"}

echo "Size: 2048"
ssh node17 ${string1/runFFTheracles.sh/$string7} 2048 >> ${string1/runFFTheracles.sh/"$string6"}
ssh node18 ${string1/runFFTheracles.sh/$string8} 2048 >> ${string1/runFFTheracles.sh/"$string6"}
echo " " >> ${string1/runFFTheracles.sh/"$string6"}

echo "Size: 4096"
ssh node17 ${string1/runFFTheracles.sh/$string7} 4096 >> ${string1/runFFTheracles.sh/"$string6"}
ssh node18 ${string1/runFFTheracles.sh/$string8} 4096 >> ${string1/runFFTheracles.sh/"$string6"}
echo " " >> ${string1/runFFTheracles.sh/"$string6"}

echo "Size: 8192"
ssh node17 ${string1/runFFTheracles.sh/$string7} 8192 >> ${string1/runFFTheracles.sh/"$string6"}
ssh node18 ${string1/runFFTheracles.sh/$string8} 8192 >> ${string1/runFFTheracles.sh/"$string6"}
echo " " >> ${string1/runFFTheracles.sh/"$string6"}

echo "Size: 16384"
ssh node17 ${string1/runFFTheracles.sh/$string7} 16384 >> ${string1/runFFTheracles.sh/"$string6"}
ssh node18 ${string1/runFFTheracles.sh/$string8} 16384 >> ${string1/runFFTheracles.sh/"$string6"}
echo " " >> ${string1/runFFTheracles.sh/"$string6"}
echo "Complete."

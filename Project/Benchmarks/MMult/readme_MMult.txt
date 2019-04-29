Hydra
Navigate to folder containing matrixmul.cu
To compile: $ nvcc -arch=sm_21 matrixmul.cu -o matrixmul
To run: $ bpsh 12 ./matrixmul matrixdimensions

Heracles
To compile: $ ssh nodeN nvcc /FULLFILEPATH/matrixmul.cu -o FULLFILEPATH/matrixmul
To run: $ ssh nodeN /FULLFILEPATH/matrixmul

Dozer
Navigate to folder containing matrixmul.cu
To compile: same as Hydra
To run: $ matrixmul
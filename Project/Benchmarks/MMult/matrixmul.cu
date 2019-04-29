#include <iostream>
#include <stdio.h>
#include <float.h>
#include <cuda.h>
#include <vector>
#include <stdlib.h>
#include <time.h>
#include <sys/time.h>
#include <cuda_runtime.h>
//#include "kernel.h"
//#include "kernel.cu"
#include "dev_array.h"
#include <math.h>
using namespace std;
struct timeval startS, endS, startP, endP;
float runtimeS, runtimeP;
void matrixMultiplication(float *A, float *B, float *C, int N);

__global__ void matrixMultiplicationKernel(float* A, float* B, float* C, int N) {

	int ROW = blockIdx.y*blockDim.y + threadIdx.y;
	int COL = blockIdx.x*blockDim.x + threadIdx.x;

	float tmpSum = 0;

	if (ROW < N && COL < N) {
		// each thread computes one element of the block sub-matrix
		for (int i = 0; i < N; i++) {
			tmpSum += A[ROW * N + i] * B[i * N + COL];
		}
	}
	C[ROW * N + COL] = tmpSum;
}


void matrixMultiplication(float *A, float *B, float *C, int N) {

	// declare the number of blocks per grid and the number of threads per block
	// use 1 to 512 threads per block
	dim3 threadsPerBlock(N, N);
	dim3 blocksPerGrid(1, 1);
	if (N*N > 512) {
		threadsPerBlock.x = 512;
		threadsPerBlock.y = 512;
		blocksPerGrid.x = ceil(double(N) / double(threadsPerBlock.x));
		blocksPerGrid.y = ceil(double(N) / double(threadsPerBlock.y));
	}

	matrixMultiplicationKernel << <blocksPerGrid, threadsPerBlock >> > (A, B, C, N);
}






int main(int argc, char* argv[])
{
	// Perform matrix multiplication C = A*B
	// where A, B and C are NxN matrices

	int N = atoi(argv[1]);
	//int N = 16;
	int SIZE = N * N;
	gettimeofday(&startP, NULL);

	// Allocate memory on the host
	vector<float> h_A(SIZE);
	vector<float> h_B(SIZE);
	vector<float> h_C(SIZE);

	// Initialize matrices on the host
	for (int i = 0; i < N; i++) {
		for (int j = 0; j < N; j++) {
			h_A[i*N + j] = sin(i);
			h_B[i*N + j] = cos(j);
		}
	}

	// Allocate memory on the device
	dev_array<float> d_A(SIZE);
	dev_array<float> d_B(SIZE);
	dev_array<float> d_C(SIZE);

	d_A.set(&h_A[0], SIZE);
	d_B.set(&h_B[0], SIZE);

	matrixMultiplication(d_A.getData(), d_B.getData(), d_C.getData(), N);
	cudaDeviceSynchronize();

	d_C.get(&h_C[0], SIZE);
	cudaDeviceSynchronize();

	float *cpu_C;
	cpu_C = new float[SIZE];
	gettimeofday(&endP, NULL);

	//
	// Calculate the runtime.
	//
	runtimeP = ((endP.tv_sec - startP.tv_sec) * 1000.0) + ((endP.tv_usec - startP.tv_usec) / 1000.0);
	printf("Processing Time Parallel: %4.4f milliseconds\n", runtimeP);

	gettimeofday(&startS, NULL);

	// Now do the matrix multiplication on the CPU
	float sum;
	for (int row = 0; row < N; row++) {
		for (int col = 0; col < N; col++) {
			sum = 0.f;
			for (int n = 0; n < N; n++) {
				sum += h_A[row*N + n] * h_B[n*N + col];
			}
			cpu_C[row*N + col] = sum;
		}
	}
	gettimeofday(&endS, NULL);
	double err = 0;
	// Check the result and make sure it is correct
	for (int ROW = 0; ROW < N; ROW++) {
		for (int COL = 0; COL < N; COL++) {
			err += cpu_C[ROW * N + COL] - h_C[ROW * N + COL];
		}
	}


	//
	// Calculate the runtime.
	//
	runtimeS = ((endS.tv_sec - startS.tv_sec) * 1000.0) + ((endS.tv_usec - startS.tv_usec) / 1000.0);
	printf("Processing Time Serial: %4.4f milliseconds\n", runtimeS);

	cout << "Error: " << err << endl;

	return 0;
}



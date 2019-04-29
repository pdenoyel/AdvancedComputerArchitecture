
// C++ implementation of Radix Sort 
#include<iostream> 
#include <time.h>
#include <sys/time.h>
#include <stdlib.h>
#include <stdio.h>
using namespace std; 
  
// A utility function to get maximum value in arr[] 
int getMax(int arr[], int n) 
{ 
    int mx = arr[0]; 
    for (int i = 1; i < n; i++) 
        if (arr[i] > mx) 
            mx = arr[i]; 
    return mx; 
} 
  
// A function to do counting sort of arr[] according to 
// the digit represented by exp. 
void countSort(int arr[], int n, int exp) 
{ 
    int output[n]; // output array 
    int i, count[10] = {0}; 
  
    // Store count of occurrences in count[] 
    for (i = 0; i < n; i++) 
        count[ (arr[i]/exp)%10 ]++; 
  
    // Change count[i] so that count[i] now contains actual 
    //  position of this digit in output[] 
    for (i = 1; i < 10; i++) 
        count[i] += count[i - 1]; 
  
    // Build the output array 
    for (i = n - 1; i >= 0; i--) 
    { 
        output[count[ (arr[i]/exp)%10 ] - 1] = arr[i]; 
        count[ (arr[i]/exp)%10 ]--; 
    } 
  
    // Copy the output array to arr[], so that arr[] now 
    // contains sorted numbers according to current digit 
    for (i = 0; i < n; i++) 
        arr[i] = output[i]; 
} 
  
// The main function to that sorts arr[] of size n using  
// Radix Sort 
void radixsort(int arr[], int n) 
{ 
    // Find the maximum number to know number of digits 
    int m = getMax(arr, n); 
  
    // Do counting sort for every digit. Note that instead 
    // of passing digit number, exp is passed. exp is 10^i 
    // where i is current digit number 
    for (int exp = 1; m/exp > 0; exp *= 10) 
        countSort(arr, n, exp); 
} 
  
// A utility function to print an array 
void print(int arr[], int n) 
{ 
    for (int i = 0; i < n; i++) 
        cout << arr[i] << " "; 
} 
  
// Driver program to test above functions 
int main(int argc, char * argv[])
{ 
    struct timeval start, end;
    unsigned long seconds, useconds;
    double mtime;

 	int array_size;
	int seed = 42;
	double duration;
	int *arr;
    double temp_time = 0;
    double init_sample;
    int num_samp_per_run = 100;
    for(int j = 0; j<128; j++){
        array_size = 2048*(j+1);
    	arr = (int *)malloc(array_size * sizeof(int));
    	for (int i = 0; i < array_size; i++)
    	{
    		arr[i] = rand() % 1000000;
    	}

        mtime = 0;
        temp_time = 0;
        
        for(int i = 0; i < num_samp_per_run; i++){
            gettimeofday(&start, NULL);
            radixsort(arr, array_size); 
            gettimeofday(&end, NULL);
            
            seconds = end.tv_sec - start.tv_sec;
            useconds = end.tv_usec - start.tv_usec;
            if(i == 0){
                init_sample = useconds;
            }
            if(seconds < 1 && useconds < init_sample*3){
                mtime += (double)(((seconds) * 1000 + useconds/1000.0));
            }else{
                i--;
            }        
        }
        mtime = mtime / (double)num_samp_per_run;
        printf("%d,%lf\n",array_size,mtime);
    }
	// time_t start, end;


    return 0; 
} 

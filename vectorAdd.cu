___global___ void add(int *a, int *b, int *c){
c[blockIdx.x] = a[blockIdx.x] + b[blockIdx.x];
}

#define N 512

int main(void){
	int a, b, c;		// host copies
	int *dA, *dB, *dC; 	// device copies
	int size = N * sizeof(int);
	
	// Allocate space for device copies
	cudaMalloc((void **) &dA, size);
	cudaMalloc((void **) &dB, size);
	cudaMalloc((void **) &dC, size);
	
	// setup input values
	a = (int *)malloc(size); random_ints(a, N);
	b = (int *)malloc(size); random_ints(b, N);
	c = (int *)malloc(size); 
	
	// copy inputs to device
	cudaMemcpy(d_a, &a, size, cudaMemcpyHostToDevice);
	cudaMemcpy(d_a, &a, size, cudaMemcpyHostToDevice);
	
	// Launch add()
	add<<<N,1>>(dA, dB, dC);
	
	// Copy back to host
	cudaMemcpy(&c, dC, size, cudaMemcpyDeviceToHost);
	
	// cleanup
	free(a);
	free(b);
	free(c);
	cudaFree(dA);
	cudaFree(dB);
	cudaFree(dC);
	
	return 0;
}
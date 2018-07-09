___global___ void add(int *a, int *b, int *c){
	*c = *a + *b;
}

int main(void){
	int a, b, c;		// host copies
	int *dA, *dB, *dC; 	// device copies
	int size = sizeof(int);
	
	// Allocate space for device copies
	cudaMalloc((void **) &dA, size);
	cudaMalloc((void **) &dB, size);
	cudaMalloc((void **) &dC, size);
	
	// setup input values
	a =2;
	b =7;
	
	// copy inputs to device
	cudaMemcpy(d_a, &a, size, cudaMemcpyHostToDevice);
	cudaMemcpy(d_a, &a, size, cudaMemcpyHostToDevice);
	
	// Launch add()
	add<<<1,1>>(dA, dB, dC);
	
	// Copy back to host
	cudaMemcpy(&c, dC, size, cudaMemcpyDeviceToHost);
	
	// cleanup
	cudaFree(dA);
	cudaFree(dB);
	cudaFree(dC);
	
	return 0;
	}
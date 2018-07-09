// nvcc HelloGPU.cu
// runs on gpu
___global___ void mykernel(void){  // global indicates runs on device and initiated by host
}

int main(void)
{
	mykernel<<<1,1>>>(); // <<<blks no,thrds no>>>
						 // <<< makes call from host code to device code, also called kernel launch
	Print("Hello World!\n");
	return 0;
}

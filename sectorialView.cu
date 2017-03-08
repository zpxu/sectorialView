/// Definitions of wrapper functions
#include <cstdlib>
#include <cstdio>
#include <string.h>
#include <iostream>

#include <cuda_runtime.h>
#include <helper_cuda.h>
#include <helper_functions.h>

#include "sectorialView_kernel.cuh"

//Round a / b to nearest higher integer value
uint cuda_iDivUp(uint a, uint b)
{
	return (a + (b - 1)) / b;
}

void computeGridSize(uint n, uint blockSize, uint &numBlocks, uint &numThreads)
{
	numThreads = min(blockSize, n);
	numBlocks = cuda_iDivUp(n, numThreads);
}

extern "C"
{

	void curandInit(curandState *state, int seed, uint numNodes)
	{
		uint numThreads, numBlocks;
		computeGridSize(numNodes, 512, numBlocks, numThreads);
		setup_RNG_kernel << <numBlocks, numThreads >> >(state, seed, numNodes);
		getLastCudaError("Kernel execution failed: setup_RNG_kernel");
	}

	void cudaGenerateUniform(float *result, curandState *state, uint numNodes)
	{
		uint numThreads, numBlocks;
		computeGridSize(numNodes, 512, numBlocks, numThreads);
		generate_uniform_kernel << <numBlocks, numThreads >> >(result, state, numNodes);
		getLastCudaError("Kernel execution failed: generate_uniform_kernel");
	}
} // extern "C"
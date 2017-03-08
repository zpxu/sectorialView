//// declaration of wrapper functions
#ifndef __SECTORIAL_VIEW_CUH__
#define __SECTORIAL_VIEW_CUH__

#include "defines.h"
#include <curand_kernel.h>

extern "C"
{
	void curandInit(curandState *state, int seed, uint numNodes);

	void cudaGenerateUniform(float *result, curandState *state, uint numNodes);
}
#endif // __SECTORIAL_VIEW_CUH__
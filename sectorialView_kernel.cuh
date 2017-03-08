//// Declaration of kernel functions

#ifndef __SECTORIALVIEW_KERNEL_CUH__
#define __SECTORIALVIEW_KERNEL_CUH__

#include "defines.h"
#include <curand_kernel.h>

// Vector data type used to velocity and force fields
typedef float2 cData;

void setupTexture(int x, int y);
void bindTexture(void);
void unbindTexture(void);
void updateTexture(cData *data, size_t w, size_t h, size_t pitch);
void deleteTexture(void);

__global__ void setup_RNG_kernel(curandState *state, int seed, uint numNodes);
__global__ void generate_uniform_kernel(float *result, curandState *state, uint numNodes);


#endif //__SECTORIALVIEW_KERNEL_CUH__


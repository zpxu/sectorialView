
#ifndef __SECTORIALVIEW_KERNEL_CUH__
#define __SECTORIALVIEW_KERNEL_CUH__

// Vector data type used to velocity and force fields
typedef float2 cData;

void setupTexture(int x, int y);
void bindTexture(void);
void unbindTexture(void);
void updateTexture(cData *data, size_t w, size_t h, size_t pitch);
void deleteTexture(void);


#endif //__SECTORIALVIEW_KERNEL_CUH__


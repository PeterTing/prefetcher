#ifndef TRANSPOSE_IMPL
#define TRANSPOSE_IMPL

typedef struct _TransposeInfo TransposeInfo;
typedef void (*func_t)(TransposeInfo *);

struct _TransposeInfo {
    int *src;
    int *dst;
    int w;
    int h;
    func_t strategy;
};

void naive_transpose(TransposeInfo *self);
void sse_transpose(TransposeInfo *self);
void sse_prefetch_transpose(TransposeInfo *self);
int init_transposeInfo(TransposeInfo **self);

#endif /* TRANSPOSE_IMPL */

// ---fake_divergence -g 9,1,1 -l 3,1,1
#define int64_t long
#define uint64_t ulong
#define int_least64_t long
#define uint_least64_t ulong
#define int_fast64_t long
#define uint_fast64_t ulong
#define intmax_t long
#define uintmax_t ulong
#define int32_t int
#define uint32_t uint
#define int16_t short
#define uint16_t ushort
#define int8_t char
#define uint8_t uchar

#define INT64_MIN LONG_MIN
#define INT64_MAX LONG_MAX
#define INT32_MIN INT_MIN
#define INT32_MAX INT_MAX
#define INT16_MIN SHRT_MIN
#define INT16_MAX SHRT_MAX
#define INT8_MIN CHAR_MIN
#define INT8_MAX CHAR_MAX
#define UINT64_MIN ULONG_MIN
#define UINT64_MAX ULONG_MAX
#define UINT32_MIN UINT_MIN
#define UINT32_MAX UINT_MAX
#define UINT16_MIN USHRT_MIN
#define UINT16_MAX USHRT_MAX
#define UINT8_MIN UCHAR_MIN
#define UINT8_MAX UCHAR_MAX

#define transparent_crc(X, Y, Z) transparent_crc_(&crc64_context, X, Y, Z)

#define VECTOR(X , Y) VECTOR_(X, Y)
#define VECTOR_(X, Y) X##Y

#ifndef NO_GROUP_DIVERGENCE
#define GROUP_DIVERGE(x, y) get_group_id(x)
#else
#define GROUP_DIVERGE(x, y) (y)
#endif

#ifndef NO_FAKE_DIVERGENCE
#define FAKE_DIVERGE(x, y, z) (x - y)
#else
#define FAKE_DIVERGE(x, y, z) (z)
#endif


// Seed: 103

#include "CLSmith.h"

/* --- Struct/Union Declarations --- */
struct S0 {
   int32_t  f0;
   uint32_t  f1;
   volatile int64_t  f2;
   volatile int32_t  f3;
   int8_t  f4;
   volatile int32_t  f5;
   uint8_t  f6;
   int64_t  f7;
   int32_t  f8;
   uint8_t  f9;
};

struct S1 {
    uint32_t g_3;
    struct S0 g_4;
    uint64_t global_0_offset;
    uint64_t global_1_offset;
    uint64_t global_2_offset;
    uint64_t local_0_offset;
    uint64_t local_1_offset;
    uint64_t local_2_offset;
    uint64_t group_0_offset;
    uint64_t group_1_offset;
    uint64_t group_2_offset;
};


/* --- FORWARD DECLARATIONS --- */
struct S0  func_1(struct S1 * p_5);


/* --- FUNCTIONS --- */
/* ------------------------------------------ */
/* 
 * reads : p_5->g_4
 * writes: p_5->g_3
 */
struct S0  func_1(struct S1 * p_5)
{ /* block id: 4 */
    int8_t l_2 = 0x74L;
    p_5->g_3 = l_2;
    return p_5->g_4;
}


__kernel void entry(__global ulong *result, __global int *sequence_input) {
    int ;
    struct S1 c_6;
    struct S1* p_5 = &c_6;
    struct S1 c_7 = {
        0xB0E1B1B5L, // p_5->g_3
        {-1L,0UL,1L,0x25155467L,0x01L,0x123CCDE6L,254UL,-1L,5L,252UL}, // p_5->g_4
        sequence_input[get_global_id(0)], // p_5->global_0_offset
        sequence_input[get_global_id(1)], // p_5->global_1_offset
        sequence_input[get_global_id(2)], // p_5->global_2_offset
        sequence_input[get_local_id(0)], // p_5->local_0_offset
        sequence_input[get_local_id(1)], // p_5->local_1_offset
        sequence_input[get_local_id(2)], // p_5->local_2_offset
        sequence_input[get_group_id(0)], // p_5->group_0_offset
        sequence_input[get_group_id(1)], // p_5->group_1_offset
        sequence_input[get_group_id(2)], // p_5->group_2_offset
    };
    c_6 = c_7;
    barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
    func_1(p_5);
    barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
    uint64_t crc64_context = 0xFFFFFFFFFFFFFFFFUL;
    int print_hash_value = 0;
    transparent_crc(p_5->g_3, "p_5->g_3", print_hash_value);
    transparent_crc(p_5->g_4.f0, "p_5->g_4.f0", print_hash_value);
    transparent_crc(p_5->g_4.f1, "p_5->g_4.f1", print_hash_value);
    transparent_crc(p_5->g_4.f2, "p_5->g_4.f2", print_hash_value);
    transparent_crc(p_5->g_4.f3, "p_5->g_4.f3", print_hash_value);
    transparent_crc(p_5->g_4.f4, "p_5->g_4.f4", print_hash_value);
    transparent_crc(p_5->g_4.f5, "p_5->g_4.f5", print_hash_value);
    transparent_crc(p_5->g_4.f6, "p_5->g_4.f6", print_hash_value);
    transparent_crc(p_5->g_4.f7, "p_5->g_4.f7", print_hash_value);
    transparent_crc(p_5->g_4.f8, "p_5->g_4.f8", print_hash_value);
    transparent_crc(p_5->g_4.f9, "p_5->g_4.f9", print_hash_value);
    result[get_linear_global_id()] = crc64_context ^ 0xFFFFFFFFFFFFFFFFUL;
}
// --atomics 35 ---atomic_reductions ---fake_divergence ---inter_thread_comm -g 81,95,1 -l 3,5,1
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

__constant uint32_t permutations[10][15] = {
{9,2,14,3,5,6,12,10,13,7,4,11,8,1,0}, // permutation 0
{6,0,10,8,14,4,12,9,13,1,5,2,11,7,3}, // permutation 1
{8,0,5,10,6,3,2,14,11,9,13,7,4,12,1}, // permutation 2
{11,12,0,2,13,10,6,5,1,7,14,4,3,9,8}, // permutation 3
{1,7,3,0,13,12,5,4,14,2,8,11,9,10,6}, // permutation 4
{14,11,5,4,7,10,13,2,6,1,8,0,12,3,9}, // permutation 5
{1,7,3,0,2,13,5,10,4,12,6,11,9,8,14}, // permutation 6
{6,10,4,1,12,13,14,8,0,3,7,11,2,9,5}, // permutation 7
{13,0,14,3,6,4,11,12,9,8,1,5,10,2,7}, // permutation 8
{3,5,4,8,10,2,0,12,13,1,6,7,14,11,9} // permutation 9
};

// Seed: 28

#include "CLSmith.h"

/* --- Struct/Union Declarations --- */
struct S1 {
    int32_t g_3;
    volatile uint16_t g_4;
    uint32_t v_collective;
    uint64_t global_0_offset;
    uint64_t global_1_offset;
    uint64_t global_2_offset;
    uint64_t local_0_offset;
    uint64_t local_1_offset;
    uint64_t local_2_offset;
    uint64_t group_0_offset;
    uint64_t group_1_offset;
    uint64_t group_2_offset;
    uint32_t tid;
    __local volatile uint32_t *l_atomic_reduction;
    __global volatile uint32_t *g_atomic_reduction;
    __local int64_t *l_comm_values;
    __global int64_t *g_comm_values;
};


/* --- FORWARD DECLARATIONS --- */
int16_t  func_1(struct S1 * p_7);


/* --- FUNCTIONS --- */
/* ------------------------------------------ */
/* 
 * reads : p_7->g_4 p_7->g_comm_values
 * writes: p_7->g_4
 */
int16_t  func_1(struct S1 * p_7)
{ /* block id: 4 */
    int32_t *l_2[3][6];
    int i, j;
    for (i = 0; i < 3; i++)
    {
        for (j = 0; j < 6; j++)
            l_2[i][j] = &p_7->g_3;
    }
    p_7->g_4++;
    return p_7->g_comm_values[p_7->tid];
}


__kernel void entry(__global ulong *result, __global volatile uint *g_atomic_input, __global volatile uint *g_special_values, __global volatile int *g_atomic_reduction, __global int *sequence_input, __global long *g_comm_values) {
    int i;
    __local volatile uint32_t l_atomic_reduction[1];
    if (get_linear_local_id() == 0)
        for (i = 0; i < 1; i++)
            l_atomic_reduction[i] = 0;
    __local int64_t l_comm_values[15];
    if (get_linear_local_id() == 0)
        for (i = 0; i < 15; i++)
            l_comm_values[i] = 1;
    struct S1 c_8;
    struct S1* p_7 = &c_8;
    struct S1 c_9 = {
        0x2A39ED08L, // p_7->g_3
        0x1B68L, // p_7->g_4
        0, // p_7->v_collective
        sequence_input[get_global_id(0)], // p_7->global_0_offset
        sequence_input[get_global_id(1)], // p_7->global_1_offset
        sequence_input[get_global_id(2)], // p_7->global_2_offset
        sequence_input[get_local_id(0)], // p_7->local_0_offset
        sequence_input[get_local_id(1)], // p_7->local_1_offset
        sequence_input[get_local_id(2)], // p_7->local_2_offset
        sequence_input[get_group_id(0)], // p_7->group_0_offset
        sequence_input[get_group_id(1)], // p_7->group_1_offset
        sequence_input[get_group_id(2)], // p_7->group_2_offset
        (safe_add_func_uint32_t_u_u((safe_mul_func_uint32_t_u_u(get_linear_group_id(), 15)), permutations[0][get_linear_local_id()])), // p_7->tid
        l_atomic_reduction, // l_atomic_reduction
        g_atomic_reduction, // g_atomic_reduction
        l_comm_values, // l_comm_values
        g_comm_values, // g_comm_values
    };
    c_8 = c_9;
    barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
    func_1(p_7);
    barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
    uint64_t crc64_context = 0xFFFFFFFFFFFFFFFFUL;
    int print_hash_value = 0;
    transparent_crc(p_7->g_3, "p_7->g_3", print_hash_value);
    transparent_crc(p_7->g_4, "p_7->g_4", print_hash_value);
    transparent_crc(p_7->v_collective, "p_7->v_collective", print_hash_value);
    transparent_crc(p_7->l_comm_values[get_linear_local_id()], "p_7->l_comm_values[get_linear_local_id()]", print_hash_value);
    transparent_crc(p_7->g_comm_values[get_linear_group_id() * 15 + get_linear_local_id()], "p_7->g_comm_values[get_linear_group_id() * 15 + get_linear_local_id()]", print_hash_value);
    result[get_linear_global_id()] = crc64_context ^ 0xFFFFFFFFFFFFFFFFUL;
}

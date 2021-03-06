// ---fake_divergence ---inter_thread_comm -g 11,24,30 -l 1,3,5
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
{14,11,6,2,13,8,12,4,10,1,9,3,7,0,5}, // permutation 0
{14,6,3,12,7,8,0,13,1,10,5,11,9,4,2}, // permutation 1
{12,13,9,7,3,0,8,4,14,11,10,1,2,5,6}, // permutation 2
{11,9,14,3,6,10,8,0,13,4,7,2,12,5,1}, // permutation 3
{2,0,10,8,11,14,3,4,9,6,13,1,5,12,7}, // permutation 4
{9,8,5,12,6,0,11,13,10,3,14,7,4,1,2}, // permutation 5
{7,13,9,11,6,1,10,14,3,12,8,2,5,0,4}, // permutation 6
{12,4,11,13,8,9,5,7,6,14,0,3,1,10,2}, // permutation 7
{12,13,2,9,14,5,6,10,0,8,1,3,4,11,7}, // permutation 8
{2,14,12,10,5,0,3,13,11,1,6,4,9,8,7} // permutation 9
};

// Seed: 69

#include "CLSmith.h"

/* --- Struct/Union Declarations --- */
struct S1 {
    int32_t g_3;
    volatile uint8_t g_5[3];
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
    __local int64_t *l_comm_values;
    __global int64_t *g_comm_values;
};


/* --- FORWARD DECLARATIONS --- */
int32_t  func_1(struct S1 * p_8);


/* --- FUNCTIONS --- */
/* ------------------------------------------ */
/* 
 * reads : p_8->g_5
 * writes: p_8->g_5
 */
int32_t  func_1(struct S1 * p_8)
{ /* block id: 4 */
    int32_t *l_2 = &p_8->g_3;
    int32_t *l_4[5][10][1] = {{{&p_8->g_3},{&p_8->g_3},{&p_8->g_3},{&p_8->g_3},{&p_8->g_3},{&p_8->g_3},{&p_8->g_3},{&p_8->g_3},{&p_8->g_3},{&p_8->g_3}},{{&p_8->g_3},{&p_8->g_3},{&p_8->g_3},{&p_8->g_3},{&p_8->g_3},{&p_8->g_3},{&p_8->g_3},{&p_8->g_3},{&p_8->g_3},{&p_8->g_3}},{{&p_8->g_3},{&p_8->g_3},{&p_8->g_3},{&p_8->g_3},{&p_8->g_3},{&p_8->g_3},{&p_8->g_3},{&p_8->g_3},{&p_8->g_3},{&p_8->g_3}},{{&p_8->g_3},{&p_8->g_3},{&p_8->g_3},{&p_8->g_3},{&p_8->g_3},{&p_8->g_3},{&p_8->g_3},{&p_8->g_3},{&p_8->g_3},{&p_8->g_3}},{{&p_8->g_3},{&p_8->g_3},{&p_8->g_3},{&p_8->g_3},{&p_8->g_3},{&p_8->g_3},{&p_8->g_3},{&p_8->g_3},{&p_8->g_3},{&p_8->g_3}}};
    int i, j, k;
    --p_8->g_5[1];
    return p_8->g_5[1];
}


__kernel void entry(__global ulong *result, __global int *sequence_input, __global long *g_comm_values) {
    int i;
    __local int64_t l_comm_values[15];
    if (get_linear_local_id() == 0)
        for (i = 0; i < 15; i++)
            l_comm_values[i] = 1;
    struct S1 c_9;
    struct S1* p_8 = &c_9;
    struct S1 c_10 = {
        0L, // p_8->g_3
        {255UL,255UL,255UL}, // p_8->g_5
        sequence_input[get_global_id(0)], // p_8->global_0_offset
        sequence_input[get_global_id(1)], // p_8->global_1_offset
        sequence_input[get_global_id(2)], // p_8->global_2_offset
        sequence_input[get_local_id(0)], // p_8->local_0_offset
        sequence_input[get_local_id(1)], // p_8->local_1_offset
        sequence_input[get_local_id(2)], // p_8->local_2_offset
        sequence_input[get_group_id(0)], // p_8->group_0_offset
        sequence_input[get_group_id(1)], // p_8->group_1_offset
        sequence_input[get_group_id(2)], // p_8->group_2_offset
        (safe_add_func_uint32_t_u_u((safe_mul_func_uint32_t_u_u(get_linear_group_id(), 15)), permutations[0][get_linear_local_id()])), // p_8->tid
        l_comm_values, // l_comm_values
        g_comm_values, // g_comm_values
    };
    c_9 = c_10;
    barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
    func_1(p_8);
    barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
    uint64_t crc64_context = 0xFFFFFFFFFFFFFFFFUL;
    int print_hash_value = 0;
    transparent_crc(p_8->g_3, "p_8->g_3", print_hash_value);
    for (i = 0; i < 3; i++)
    {
        transparent_crc(p_8->g_5[i], "p_8->g_5[i]", print_hash_value);

    }
    transparent_crc(p_8->l_comm_values[get_linear_local_id()], "p_8->l_comm_values[get_linear_local_id()]", print_hash_value);
    transparent_crc(p_8->g_comm_values[get_linear_group_id() * 15 + get_linear_local_id()], "p_8->g_comm_values[get_linear_group_id() * 15 + get_linear_local_id()]", print_hash_value);
    result[get_linear_global_id()] = crc64_context ^ 0xFFFFFFFFFFFFFFFFUL;
}

// ---fake_divergence ---inter_thread_comm -g 90,52,2 -l 18,13,1
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

__constant uint32_t permutations[10][234] = {
{45,6,13,212,70,79,96,134,136,119,33,118,39,2,151,170,72,29,3,144,223,158,63,14,152,81,222,35,181,51,156,58,30,157,133,108,145,65,82,25,23,174,163,107,77,10,216,232,22,60,47,199,154,230,44,54,196,213,166,80,165,130,106,219,185,34,148,201,18,57,202,71,42,55,131,210,19,167,171,61,64,17,214,192,197,204,164,28,0,178,143,27,5,141,217,225,62,142,76,146,188,129,93,209,173,113,160,138,184,101,68,41,85,115,105,59,36,147,233,67,177,4,87,193,20,211,124,175,69,99,176,116,112,122,73,139,161,207,109,155,9,43,229,98,159,150,75,180,91,140,74,123,103,189,102,11,187,137,66,78,153,110,40,7,32,203,50,52,231,86,195,21,162,121,37,95,135,220,111,127,12,126,186,83,215,206,125,198,183,104,168,226,190,218,128,194,224,94,200,48,191,117,15,1,149,114,88,221,100,182,31,46,89,227,49,26,208,8,132,56,97,92,228,169,120,38,172,84,24,90,16,53,205,179}, // permutation 0
{216,190,166,103,1,36,218,228,208,56,120,184,89,142,29,147,41,187,177,13,196,210,7,26,206,10,213,30,168,0,211,49,53,207,55,82,70,188,24,15,35,139,217,91,134,202,114,22,72,154,58,106,109,198,17,14,146,203,229,46,215,169,124,175,135,122,214,144,60,225,52,63,192,136,150,227,99,151,199,219,174,115,157,73,105,71,5,137,131,11,170,64,118,27,160,183,38,80,141,224,205,200,161,172,130,78,43,176,93,231,110,201,143,9,51,21,102,191,19,164,18,233,159,75,129,189,121,220,101,133,2,182,167,113,61,221,125,162,37,126,45,222,108,153,232,107,57,25,163,100,74,117,145,195,83,156,48,97,98,212,111,79,185,77,54,85,20,148,138,193,226,23,67,186,28,223,127,66,194,81,116,76,65,86,119,94,209,171,87,155,34,230,39,96,12,50,33,92,181,31,180,95,104,69,62,44,40,8,32,123,47,149,197,6,84,42,112,59,132,165,158,178,16,204,173,140,90,3,152,4,179,128,68,88}, // permutation 1
{178,2,119,222,139,147,202,75,144,183,177,10,186,4,48,209,161,108,232,150,114,28,23,160,55,168,192,13,165,92,159,66,116,46,37,0,211,71,187,134,206,182,162,167,24,149,39,180,88,85,200,184,142,87,103,60,56,122,5,42,151,100,50,102,101,170,214,72,107,89,145,8,193,110,164,203,22,6,225,32,169,233,14,212,112,82,16,59,129,173,204,176,219,70,79,67,224,133,218,172,49,120,174,12,190,156,185,62,63,84,29,125,141,163,40,105,41,179,115,191,26,11,136,83,140,54,135,111,19,64,35,131,36,130,132,51,117,228,215,20,34,196,73,143,93,98,81,152,7,226,76,113,201,189,27,207,146,90,137,109,199,97,31,53,194,69,45,25,95,47,94,18,106,148,15,91,33,221,154,205,57,124,175,121,216,198,171,157,21,223,231,44,229,227,52,195,30,230,127,80,126,65,61,197,86,3,220,128,208,210,43,181,58,217,17,158,77,123,155,74,78,68,153,9,188,118,1,104,138,96,166,99,38,213}, // permutation 2
{132,180,140,24,99,74,75,89,111,48,54,123,134,121,7,88,225,16,35,71,116,91,212,42,157,12,107,58,151,149,233,150,57,131,126,28,146,186,68,34,25,232,59,3,40,136,56,65,205,174,183,49,113,29,47,52,148,19,216,161,162,201,204,194,78,22,32,61,222,86,142,38,206,152,229,108,55,17,192,39,36,66,83,189,208,69,181,231,33,223,100,96,211,11,76,177,110,70,90,104,44,15,203,118,73,171,119,214,45,62,187,144,31,170,209,0,109,156,67,133,105,207,51,224,53,6,198,182,77,80,93,213,101,50,112,178,21,23,14,94,164,122,202,169,215,117,60,196,193,135,173,220,84,95,179,98,79,130,103,197,127,176,199,210,217,185,227,195,228,41,4,145,26,120,143,163,128,8,200,81,226,230,139,82,72,129,30,115,158,138,1,46,2,97,155,106,13,167,125,175,160,20,92,141,87,165,5,147,159,102,63,37,153,219,191,172,188,64,85,114,10,43,124,184,168,221,18,190,137,166,218,27,154,9}, // permutation 3
{202,10,171,214,86,197,104,233,54,150,177,168,147,151,46,216,200,61,144,229,133,154,17,16,164,67,128,98,55,194,99,108,85,9,26,146,179,224,101,4,185,206,126,70,152,41,109,193,199,96,64,52,79,53,170,102,143,97,44,209,115,87,160,90,217,119,68,135,211,19,107,157,58,114,88,24,123,161,59,137,39,43,120,205,221,69,13,201,178,22,213,190,111,149,35,103,106,142,117,75,32,172,204,23,182,132,155,81,134,34,203,141,156,165,186,180,208,29,15,210,66,175,82,105,145,110,11,192,129,91,207,173,56,226,231,153,158,92,124,191,45,100,166,27,163,38,121,51,14,1,196,228,6,219,122,73,212,57,77,21,169,31,48,33,93,230,40,84,167,218,125,12,42,50,20,18,136,159,83,176,95,80,174,0,89,113,28,131,116,188,195,130,76,232,60,162,63,225,215,25,49,148,220,139,47,8,138,118,127,5,72,223,65,189,7,184,30,227,3,36,74,181,187,222,112,183,62,198,37,2,94,78,140,71}, // permutation 4
{47,25,29,63,83,88,42,78,149,208,70,120,112,9,144,44,140,189,218,36,66,13,180,150,115,200,72,22,129,203,222,143,127,93,86,168,209,165,1,67,101,181,123,39,137,96,230,108,50,225,199,73,227,80,64,46,187,182,155,57,91,77,68,159,163,138,21,164,76,20,117,179,84,175,130,49,219,153,82,54,81,162,48,132,37,196,55,92,233,41,114,30,107,192,178,34,7,118,74,17,231,60,131,18,0,213,51,75,184,11,197,71,135,134,106,59,12,122,87,121,4,191,26,24,58,167,10,97,217,27,215,8,14,110,102,229,98,201,190,109,35,212,23,186,128,151,202,105,99,43,28,45,5,193,205,141,145,170,61,185,104,113,172,124,40,2,103,223,69,228,206,6,52,176,119,161,53,154,147,79,136,156,214,224,111,133,116,221,56,216,142,198,15,125,160,33,194,171,62,146,126,166,94,31,3,173,210,207,232,226,211,85,195,90,204,148,95,139,152,174,188,158,169,16,65,19,177,32,100,89,183,220,157,38}, // permutation 5
{199,5,55,71,167,38,23,26,28,116,114,193,155,12,164,194,123,84,1,70,219,11,86,227,36,24,213,107,125,226,31,136,64,133,79,90,81,150,210,165,99,132,135,58,195,9,40,154,196,100,140,231,156,94,88,189,143,61,101,77,52,49,37,54,0,44,200,233,134,124,21,144,228,7,148,152,163,220,19,206,35,138,45,212,232,169,177,115,29,96,217,108,158,83,60,47,33,117,78,230,112,216,168,87,184,130,146,215,15,179,8,53,186,105,209,46,3,211,27,85,145,190,42,72,74,51,222,229,43,122,187,48,207,225,120,69,151,13,191,141,139,157,224,142,192,201,67,95,198,4,173,147,106,10,89,197,183,203,166,160,68,17,137,131,34,91,174,56,92,110,182,14,161,98,218,111,109,66,149,73,62,223,57,153,181,178,205,171,65,102,59,188,32,97,159,221,129,93,80,76,208,75,82,39,126,63,113,119,185,172,128,176,22,103,175,2,202,180,16,121,118,18,41,127,204,162,104,20,30,25,6,50,170,214}, // permutation 6
{168,42,199,22,119,193,154,29,189,20,179,141,132,31,109,72,229,211,142,61,138,196,150,187,143,120,127,47,33,205,157,39,14,178,74,149,223,80,122,94,54,197,9,4,95,160,220,38,140,81,100,135,64,221,102,219,181,145,15,28,198,99,10,44,32,75,173,152,218,166,19,55,11,85,108,195,59,151,128,93,34,84,41,158,213,68,231,30,114,203,13,126,116,204,131,184,37,115,2,186,63,214,77,194,35,27,6,155,190,60,24,73,192,180,125,17,117,161,70,228,69,112,225,45,172,78,7,201,174,106,52,92,103,98,5,159,36,105,226,164,167,57,97,200,110,107,3,130,48,21,123,51,188,129,66,136,177,91,175,233,191,124,111,56,207,58,121,232,50,209,86,88,53,212,8,153,163,182,96,104,76,137,165,49,176,139,169,67,206,224,0,18,144,162,65,82,227,12,202,222,89,146,16,133,40,26,210,230,62,171,118,43,134,215,101,183,208,90,25,79,23,46,156,1,113,185,148,71,217,147,87,83,216,170}, // permutation 7
{4,194,108,36,110,86,70,193,25,154,91,213,207,132,125,85,160,147,47,127,135,225,93,72,34,45,107,8,220,123,7,192,89,208,57,6,75,196,13,232,122,223,19,195,24,183,28,176,56,206,23,42,35,228,67,96,157,54,17,173,88,227,184,203,40,94,128,43,2,144,177,66,16,39,205,188,129,179,158,149,48,44,162,219,74,133,126,168,230,109,233,82,33,92,198,29,199,41,209,101,0,9,119,161,152,212,53,197,231,112,78,3,151,31,165,87,167,32,90,134,51,172,22,218,187,100,136,124,166,201,15,14,68,20,159,114,215,80,98,55,229,145,27,137,190,140,150,106,30,214,64,73,221,139,155,115,186,120,79,204,81,83,185,103,1,121,174,222,202,216,178,175,59,84,77,38,11,118,181,130,182,116,156,63,26,61,95,65,189,200,217,97,50,69,102,171,226,99,143,180,10,191,5,49,224,12,113,148,46,131,62,71,211,37,164,76,141,18,111,52,21,60,170,163,105,210,104,146,117,153,169,58,142,138}, // permutation 8
{49,192,111,199,107,200,220,204,12,182,227,103,135,83,91,98,169,145,181,116,174,187,203,22,162,223,44,43,19,71,126,164,62,15,113,233,37,10,66,59,13,101,42,155,88,131,179,17,124,105,218,46,82,56,26,144,121,186,79,27,149,128,170,214,176,86,53,193,48,118,104,14,188,219,108,70,196,21,96,190,175,9,153,215,78,95,97,65,159,228,125,68,229,201,45,165,123,189,33,216,213,8,136,24,154,217,5,142,130,41,139,141,230,58,85,119,7,94,146,32,194,39,224,211,84,117,0,75,147,100,106,52,74,114,178,158,132,163,102,208,64,156,69,93,50,134,206,122,47,171,89,54,177,151,92,166,225,16,60,20,226,212,207,67,140,137,110,99,90,205,35,184,31,25,172,185,57,167,34,150,11,180,115,210,173,80,29,138,222,4,195,51,87,221,61,28,191,1,133,160,30,109,148,77,73,168,36,231,202,129,183,209,72,40,143,38,81,197,3,112,55,127,161,63,120,23,157,152,6,2,198,18,76,232} // permutation 9
};

// Seed: 110

#include "CLSmith.h"

/* --- Struct/Union Declarations --- */
struct S0 {
    uint64_t g_4;
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
int64_t  func_1(struct S0 * p_6);
int32_t  func_2(int64_t  p_3, struct S0 * p_6);


/* --- FUNCTIONS --- */
/* ------------------------------------------ */
/* 
 * reads : p_6->l_comm_values p_6->g_4
 * writes: p_6->g_4
 */
int64_t  func_1(struct S0 * p_6)
{ /* block id: 4 */
    uint64_t l_5 = 18446744073709551607UL;
    p_6->g_4 ^= func_2(p_6->l_comm_values[(safe_mod_func_uint32_t_u_u(p_6->tid, 234))], p_6);
    return l_5;
}


/* ------------------------------------------ */
/* 
 * reads :
 * writes:
 */
int32_t  func_2(int64_t  p_3, struct S0 * p_6)
{ /* block id: 5 */
    return p_3;
}


__kernel void entry(__global ulong *result, __global int *sequence_input, __global long *g_comm_values) {
    int i;
    __local int64_t l_comm_values[234];
    if (get_linear_local_id() == 0)
        for (i = 0; i < 234; i++)
            l_comm_values[i] = 1;
    struct S0 c_7;
    struct S0* p_6 = &c_7;
    struct S0 c_8 = {
        0xB999FB023ED15DE0L, // p_6->g_4
        sequence_input[get_global_id(0)], // p_6->global_0_offset
        sequence_input[get_global_id(1)], // p_6->global_1_offset
        sequence_input[get_global_id(2)], // p_6->global_2_offset
        sequence_input[get_local_id(0)], // p_6->local_0_offset
        sequence_input[get_local_id(1)], // p_6->local_1_offset
        sequence_input[get_local_id(2)], // p_6->local_2_offset
        sequence_input[get_group_id(0)], // p_6->group_0_offset
        sequence_input[get_group_id(1)], // p_6->group_1_offset
        sequence_input[get_group_id(2)], // p_6->group_2_offset
        (safe_add_func_uint32_t_u_u((safe_mul_func_uint32_t_u_u(get_linear_group_id(), 234)), permutations[0][get_linear_local_id()])), // p_6->tid
        l_comm_values, // l_comm_values
        g_comm_values, // g_comm_values
    };
    c_7 = c_8;
    barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
    func_1(p_6);
    barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
    uint64_t crc64_context = 0xFFFFFFFFFFFFFFFFUL;
    int print_hash_value = 0;
    transparent_crc(p_6->g_4, "p_6->g_4", print_hash_value);
    transparent_crc(p_6->l_comm_values[get_linear_local_id()], "p_6->l_comm_values[get_linear_local_id()]", print_hash_value);
    transparent_crc(p_6->g_comm_values[get_linear_group_id() * 234 + get_linear_local_id()], "p_6->g_comm_values[get_linear_group_id() * 234 + get_linear_local_id()]", print_hash_value);
    result[get_linear_global_id()] = crc64_context ^ 0xFFFFFFFFFFFFFFFFUL;
}
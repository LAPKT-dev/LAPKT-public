#ifndef __HASH_FUNCTIONS__
#define __HASH_FUNCTIONS__
#include <bits/stdc++.h>
#include <math.h>

#define get16bits(d) ((((unsigned int)(((const unsigned char *)(d))[1])) << 8) + (unsigned int)(((const unsigned char *)(d))[0]))

// Hash Version from http://www.azillionmonkeys.com/qed/hash.html
//  Usage: Hash a stream of input bytes
//  @Params:
//   data - 8-bit char array
//   len -  integer : length of the array
//  @Ouput: unsigned int - hash value
// unsigned int SuperFastHash (const char * data, int len, unsigned int hash) {
inline unsigned int SuperFastHash(const char *data, int len, uint32_t hash)
{
    // unsigned int hash = len, tmp;
    uint32_t tmp;
    hash = len;
    int rem;

    if (len <= 0 || data == NULL)
        return 0;
    rem = len & 3;
    len >>= 2;

    /* Main loop */
    for (; len > 0; len--)
    {
        hash += get16bits(data);
        tmp = (get16bits(data + 2) << 11) ^ hash;
        hash = (hash << 16) ^ tmp;
        // data += 2 * sizeof (unsigned short);
        data += 2 * sizeof(uint16_t);
        hash += hash >> 11;
    }

    /* Handle end cases */
    switch (rem)
    {
    case 3:
        hash += get16bits(data);
        hash ^= hash << 16;
        // hash ^= ((signed char)data[sizeof (unsigned short)]) << 18;
        hash ^= ((signed char)data[sizeof(uint16_t)]) << 18;
        hash += hash >> 11;
        break;
    case 2:
        hash += get16bits(data);
        hash ^= hash << 11;
        hash += hash >> 17;
        break;
    case 1:
        hash += (signed char)*data;
        hash ^= hash << 10;
        hash += hash >> 1;
    }

    /* Force "avalanching" of final 127 bits */
    hash ^= hash << 3;
    hash += hash >> 5;
    hash ^= hash << 4;
    hash += hash >> 17;
    hash ^= hash << 25;
    hash += hash >> 6;

    return hash;
}

#endif

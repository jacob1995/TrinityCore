/**
 * Not part of the original Org_BouncyCastle_Crypto_Utilities
 * Just simulated some c# methods
 *
 * kizura, 2012
 */

#include "Array.h"

namespace Org_BouncyCastle_Crypto_Utilities {

Array::Array() {
}

void Array::Copy(uint32* src, uint32 srcIdx, uint32* dest,
        uint32 destIdx, uint32 length) {
    puts("Array::Copy(uint32* src");
    for (int i = 0; i < length; i++) {
        dest[destIdx + i] = src[srcIdx + i];
    }
}

void Array::Copy(uint8* src, uint32 srcIdx, uint8* dest,
        uint32 destIdx, uint32 length) {
    puts("Array::Copy(uint8* src");
    for (int i = 0; i < length; i++) {
        dest[destIdx + i] = src[srcIdx + i];
    }
}

void Array::Clear(uint32* src, uint32 srcIdx, uint32 length) {
    puts("Array::Clear");
    for (int i = 0; i < length; i++) {
        src[i] = 0;
    }
}

}



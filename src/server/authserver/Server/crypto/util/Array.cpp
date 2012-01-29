/**
 * Not part of the original Org_BouncyCastle_Crypto_Utilities
 * Just simulated some c# methods
 *
 * kizura, 2012-Jan
 *
 * License: http://www.gnu.org/licenses/gpl.html
 *
 */

#include "Array.h"

namespace Org_BouncyCastle_Crypto_Utilities {

void Array::Reverse(uint8* src, uint32 length) {
    uint8 swap = 0;
    for (int i = 0; i < --length; i++) {
        swap = src[i]; //put what's in a into swap space
        src[i] = src[length]; //put what's in b into a
        src[length] = swap; //put what's in the swap (a) into b
    }
}

void Array::Copy(uint32* src, uint32 srcIdx, uint32* dest, uint32 destIdx,
        uint32 length) {
    for (int i = 0; i < length; i++) {
        dest[destIdx + i] = src[srcIdx + i];
    }
}

void Array::Copy(uint8* src, uint32 srcIdx, uint8* dest, uint32 destIdx,
        uint32 length) {
    for (int i = 0; i < length; i++) {
        dest[destIdx + i] = src[srcIdx + i];
    }
}

void Array::Clear(uint32* src, uint32 srcIdx, uint32 length) {
    for (int i = 0; i < length; i++) {
        src[i] = 0;
    }
}
void Array::Clear(uint8* src, uint32 srcIdx, uint32 length) {
    for (int i = srcIdx; i < srcIdx + length; i++) {
        src[i] = 0;
    }

}
}


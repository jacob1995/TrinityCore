/**
 * Original code from: http://www.bouncycastle.org/csharp/
 *
 * Ported from C# to C++ by kizura, 2012-Jan
 *
 * License: http://www.gnu.org/licenses/gpl.html
 *
 */

#include "GeneralDigest.h"
#include "../util/Array.h"

using namespace Org_BouncyCastle_Crypto_Utilities;

namespace Org_BouncyCastle_Crypto_Digests {
/**
 * base implementation of MD4 family style digest as outlined in
 * "Handbook of Applied Cryptography", pages 344 - 347.
 */

GeneralDigest::GeneralDigest() {
    xBuf = new uint8[4];
    xBuf_Length = 4;
}

GeneralDigest::GeneralDigest(GeneralDigest* t) {
    xBuf = new uint8[xBuf_Length];
    Array::Copy(t->xBuf, 0, xBuf, 0, (uint32) xBuf_Length);

    xBufOff = t->xBufOff;
    byteCount = t->byteCount;
}

void GeneralDigest::Update(uint8 input) {
    xBuf[xBufOff++] = input;

    if (xBufOff == xBuf_Length) {
        ProcessWord(xBuf, 0);
        xBufOff = 0;
    }

    byteCount++;
}

void GeneralDigest::BlockUpdate(uint8* input, int inOff, int length) {
    //
    // fill the current word
    //
    while ((xBufOff != 0) && (length > 0)) {
        Update(input[inOff]);
        inOff++;
        length--;
    }

    //
    // process whole words.
    //
    while (length > xBuf_Length) {
        ProcessWord(input, inOff);

        inOff += xBuf_Length;
        length -= xBuf_Length;
        byteCount += xBuf_Length;
    }

    //
    // load in the remainder.
    //
    while (length > 0) {
        Update(input[inOff]);

        inOff++;
        length--;
    }
}

void GeneralDigest::Finish() {
    long bitLength = (byteCount << 3);

    //
    // add the pad bytes.
    //
    Update((uint8) 128);

    while (xBufOff != 0)
        Update((uint8) 0);
    ProcessLength(bitLength);
    ProcessBlock();
}

void GeneralDigest::Reset() {
    byteCount = 0;
    xBufOff = 0;
    //Array.Clear(xBuf, 0, xBuf.Length);
    for (int i = 0; i < xBuf_Length; i++) {
        xBuf[i] = 0;
    }

}

int GeneralDigest::GetByteLength() {
    return BYTE_LENGTH;
}

}


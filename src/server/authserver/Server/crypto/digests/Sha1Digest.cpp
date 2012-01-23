/**
 * Original code from: http://www.bouncycastle.org/csharp/
 *
 * Ported from C# to C++ by kizura, 2012-Jan
 *
 * License: http://www.gnu.org/licenses/gpl.html
 *
 */

#include "Sha1Digest.h"

#include "../util/Array.h"
#include "../util/Pack.h"

using namespace Org_BouncyCastle_Crypto_Utilities;

namespace Org_BouncyCastle_Crypto_Digests {

/**
 * implementation of SHA-1 as outlined in "Handbook of Applied Cryptography", pages 346 - 349.
 *
 * It is interesting to ponder why the, apart from the extra IV, the other difference here from MD5
 * is the "endienness" of the word processing!
 */
Sha1Digest::Sha1Digest() {
    X = new uint32[80];
    Reset();
}

/**
 * Copy constructor.  This will copy the state of the provided
 * message digest.
 */
Sha1Digest::Sha1Digest(Sha1Digest *t) :
        GeneralDigest(t) {
    H1 = t->H1;
    H2 = t->H2;
    H3 = t->H3;
    H4 = t->H4;
    H5 = t->H5;

    Array::Copy(t->X, 0, X, 0, 80);
    xOff = t->xOff;
}

std::string Sha1Digest::getAlgorithmName() {
    return "SHA-1";
}

int Sha1Digest::GetDigestSize() {
    return DigestLength;
}

void Sha1Digest::ProcessWord(uint8* input, int inOff) {
    X[xOff] = Pack::BE_To_UInt32(input, inOff);

    if (++xOff == 16) {
        ProcessBlock();
    }
}

void Sha1Digest::ProcessLength(long bitLength) {
    if (xOff > 14) {
        ProcessBlock();
    }

    X[14] = (uint32)((uint64) bitLength >> 32);
    X[15] = (uint32)((uint64) bitLength);
}

int Sha1Digest::DoFinal(uint8* output, int outOff) {
    Finish();

    Pack::UInt32_To_BE(H1, output, outOff);
    Pack::UInt32_To_BE(H2, output, outOff + 4);
    Pack::UInt32_To_BE(H3, output, outOff + 8);
    Pack::UInt32_To_BE(H4, output, outOff + 12);
    Pack::UInt32_To_BE(H5, output, outOff + 16);

    Reset();

    return DigestLength;
}

/**
 * reset the chaining variables
 */
void Sha1Digest::Reset() {
    GeneralDigest::Reset();

    H1 = 0x67452301;
    H2 = 0xefcdab89;
    H3 = 0x98badcfe;
    H4 = 0x10325476;
    H5 = 0xc3d2e1f0;

    xOff = 0;
    Array::Clear(X, 0, 80);
}

uint32 Sha1Digest::F(uint32 u, uint32 v, uint32 w) {
    return (u & v) | (~u & w);
}

uint32 Sha1Digest::H(uint32 u, uint32 v, uint32 w) {
    return u ^ v ^ w;
}

uint32 Sha1Digest::G(uint32 u, uint32 v, uint32 w) {
    return (u & v) | (u & w) | (v & w);
}

void Sha1Digest::ProcessBlock() {
    //
    // expand 16 word block into 80 word block.
    //
    for (int i = 16; i < 80; i++) {
        uint32 t = X[i - 3] ^ X[i - 8] ^ X[i - 14] ^ X[i - 16];
        X[i] = t << 1 | t >> 31;
    }

    //
    // set up working variables.
    //
    uint32 A = H1;
    uint32 B = H2;
    uint32 C = H3;
    uint32 D = H4;
    uint32 E = H5;

    //
    // round 1
    //
    int idx = 0;

    for (int j = 0; j < 4; j++) {
        // E = rotateLeft(A, 5) + F(B, C, D) + E + X[idx++] + Y1
        // B = rotateLeft(B, 30)
        E += (A << 5 | (A >> 27)) + F(B, C, D) + X[idx++] + Y1;
        B = B << 30 | (B >> 2);

        D += (E << 5 | (E >> 27)) + F(A, B, C) + X[idx++] + Y1;
        A = A << 30 | (A >> 2);

        C += (D << 5 | (D >> 27)) + F(E, A, B) + X[idx++] + Y1;
        E = E << 30 | (E >> 2);

        B += (C << 5 | (C >> 27)) + F(D, E, A) + X[idx++] + Y1;
        D = D << 30 | (D >> 2);

        A += (B << 5 | (B >> 27)) + F(C, D, E) + X[idx++] + Y1;
        C = C << 30 | (C >> 2);
    }

    //
    // round 2
    //
    for (int j = 0; j < 4; j++) {
        // E = rotateLeft(A, 5) + H(B, C, D) + E + X[idx++] + Y2
        // B = rotateLeft(B, 30)
        E += (A << 5 | (A >> 27)) + H(B, C, D) + X[idx++] + Y2;
        B = B << 30 | (B >> 2);

        D += (E << 5 | (E >> 27)) + H(A, B, C) + X[idx++] + Y2;
        A = A << 30 | (A >> 2);

        C += (D << 5 | (D >> 27)) + H(E, A, B) + X[idx++] + Y2;
        E = E << 30 | (E >> 2);

        B += (C << 5 | (C >> 27)) + H(D, E, A) + X[idx++] + Y2;
        D = D << 30 | (D >> 2);

        A += (B << 5 | (B >> 27)) + H(C, D, E) + X[idx++] + Y2;
        C = C << 30 | (C >> 2);
    }

    //
    // round 3
    //
    for (int j = 0; j < 4; j++) {
        // E = rotateLeft(A, 5) + G(B, C, D) + E + X[idx++] + Y3
        // B = rotateLeft(B, 30)
        E += (A << 5 | (A >> 27)) + G(B, C, D) + X[idx++] + Y3;
        B = B << 30 | (B >> 2);

        D += (E << 5 | (E >> 27)) + G(A, B, C) + X[idx++] + Y3;
        A = A << 30 | (A >> 2);

        C += (D << 5 | (D >> 27)) + G(E, A, B) + X[idx++] + Y3;
        E = E << 30 | (E >> 2);

        B += (C << 5 | (C >> 27)) + G(D, E, A) + X[idx++] + Y3;
        D = D << 30 | (D >> 2);

        A += (B << 5 | (B >> 27)) + G(C, D, E) + X[idx++] + Y3;
        C = C << 30 | (C >> 2);
    }

    //
    // round 4
    //
    for (int j = 0; j < 4; j++) {
        // E = rotateLeft(A, 5) + H(B, C, D) + E + X[idx++] + Y4
        // B = rotateLeft(B, 30)
        E += (A << 5 | (A >> 27)) + H(B, C, D) + X[idx++] + Y4;
        B = B << 30 | (B >> 2);

        D += (E << 5 | (E >> 27)) + H(A, B, C) + X[idx++] + Y4;
        A = A << 30 | (A >> 2);

        C += (D << 5 | (D >> 27)) + H(E, A, B) + X[idx++] + Y4;
        E = E << 30 | (E >> 2);

        B += (C << 5 | (C >> 27)) + H(D, E, A) + X[idx++] + Y4;
        D = D << 30 | (D >> 2);

        A += (B << 5 | (B >> 27)) + H(C, D, E) + X[idx++] + Y4;
        C = C << 30 | (C >> 2);
    }

    H1 += A;
    H2 += B;
    H3 += C;
    H4 += D;
    H5 += E;

    //
    // reset start of the buffer.
    //
    xOff = 0;
    //Array.Clear(X, 0, 16);
    for (int i = 0; i < 16; i++) {
        X[i] = 0;
    }

}
}


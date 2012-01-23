#ifndef _AUTH_SHA1DIGEST_H
#define _AUTH_SHA1DIGEST_H

#include "GeneralDigest.h"
#include "../util/Pack.h"
#include "../util/Array.h"

using namespace Org_BouncyCastle_Crypto_Utilities;

namespace Org_BouncyCastle_Crypto_Digests {

/**
 * implementation of SHA-1 as outlined in "Handbook of Applied Cryptography", pages 346 - 349.
 *
 * It is interesting to ponder why the, apart from the extra IV, the other difference here from MD5
 * is the "endienness" of the word processing!
 */
class Sha1Digest: public GeneralDigest {
private:
    static const int DigestLength = 20;

    uint32 H1, H2, H3, H4, H5;

    uint32* X;
    int xOff;

public:
    Sha1Digest();
    /**
     * Copy constructor.  This will copy the state of the provided
     * message digest.
     */
    Sha1Digest(Sha1Digest *t);

    virtual std::string getAlgorithmName();
    virtual int GetDigestSize();
    virtual void ProcessWord(uint8* input, int inOff);
    virtual void ProcessLength(long bitLength);
    virtual int DoFinal(uint8* output, int outOff);

    /**
     * reset the chaining variables
     */
    virtual void Reset();

    virtual void ProcessBlock();
    //
    // Additive constants
    //
private:
    static const uint32 Y1 = 0x5a827999;
    static const uint32 Y2 = 0x6ed9eba1;
    static const uint32 Y3 = 0x8f1bbcdc;
    static const uint32 Y4 = 0xca62c1d6;

    static uint32 F(uint32 u, uint32 v, uint32 w);

    static uint32 H(uint32 u, uint32 v, uint32 w);

    static uint32 G(uint32 u, uint32 v, uint32 w);
};
}

#endif

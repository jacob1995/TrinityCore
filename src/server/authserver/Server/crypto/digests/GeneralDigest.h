#ifndef AUTH_GENERALDIGEST_h
#define AUTH_GENERALDIGEST_h

#include "../IDigest.h"

using namespace Org_BouncyCastle_Crypto;

namespace Org_BouncyCastle_Crypto_Digests {
/**
 * base implementation of MD4 family style digest as outlined in
 * "Handbook of Applied Cryptography", pages 344 - 347.
 */
class GeneralDigest: public IDigest {
private:
    static const int BYTE_LENGTH = 64;

    uint32 xBuf_Length;
    uint8* xBuf;
    int xBufOff;
    long byteCount;

public:
    GeneralDigest();
    GeneralDigest(GeneralDigest *t);

    void Update(uint8 input);
    void BlockUpdate(uint8* input, int inOff, int length);
    void Finish();
    void Reset();
    int GetByteLength();

    virtual void ProcessWord(uint8* input, int inOff) = 0;
    virtual void ProcessLength(long bitLength) = 0;
    virtual void ProcessBlock() = 0;
    virtual std::string getAlgorithmName() = 0;
    virtual int GetDigestSize() = 0;
    virtual int DoFinal(uint8* output, int outOff) = 0;
};
}

#endif

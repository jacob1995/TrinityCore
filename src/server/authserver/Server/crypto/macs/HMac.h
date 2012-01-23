#ifndef _AUTH_HMAC_H_H
#define _AUTH_HMAC_H_H

#include "../IMac.h"
#include "../IDigest.h"

using namespace Org_BouncyCastle_Crypto;

namespace Org_BouncyCastle_Crypto_Macs {


/**
 * HMAC implementation based on RFC2104
 *
 * H(K XOR opad, H(K XOR ipad, text))
 */
class HMac: public IMac {
private:
    static const uint8 IPAD = (uint8) 0x36;
    static const uint8 OPAD = (uint8) 0x5C;

    IDigest *digest;
    int digestSize;
    int blockLength;

    uint32 inputPad_Length;
    uint8* inputPad;
    uint32 outputPad_Length;
    uint8* outputPad;
    static void mXor(uint8 *a, uint8 n, uint32 length);

public:
    HMac(IDigest *digest);
    std::string getAlgorithmName();

    IDigest *GetUnderlyingDigest();

    void Init(ICipherParameters *parameters);

    int GetMacSize();

    void Update(uint8 input);
    void BlockUpdate(uint8* input, int inOff, int len);
    int DoFinal(uint8* output, int outOff);

    /**
     * Reset the mac generator.
     */
    void Reset();
};

}
#endif

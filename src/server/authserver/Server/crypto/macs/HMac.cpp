#include <openssl/md5.h>

#include "Common.h"
#include "Database/DatabaseEnv.h"
#include "ByteBuffer.h"
#include "Configuration/Config.h"
#include "Log.h"
#include "RealmList.h"
#include "AuthSocket.h"
#include "AuthCodes.h"
#include "SHA1.h"
#include "openssl/crypto.h"

#include "HMac.h"
#include "crypto/digests/Sha1Digest.h"
#include "crypto/macs/HMac.h"
#include "crypto/parameters/KeyParameter.h"
#include "../ICipherParameters.h"
#include "../IMac.h"
#include "../IDigest.h"
#include "../util/Array.h"


using namespace Org_BouncyCastle_Crypto_Macs;
using namespace Org_BouncyCastle_Crypto_Digests;
using namespace Org_BouncyCastle_Crypto;
using namespace Org_BouncyCastle_Crypto_Parameters;
using namespace Org_BouncyCastle_Crypto_Utilities;

namespace Org_BouncyCastle_Crypto_Macs {

/**
 * HMAC implementation based on RFC2104
 *
 * H(K XOR opad, H(K XOR ipad, text))
 */
HMac::HMac(IDigest *digest) {
    puts("HMac::HMac");
    this->digest = digest;
	this->digestSize = digest->GetDigestSize();
    this->blockLength = digest->GetByteLength();
    this->inputPad_Length = blockLength;
    this->inputPad = new uint8[blockLength];
    this->outputPad_Length = blockLength;
    this->outputPad = new uint8[blockLength];
}

std::string HMac::getAlgorithmName() {
    puts("HMac::getAlgorithmName");
    return digest->getAlgorithmName() + "/HMAC";
}

IDigest *HMac::GetUnderlyingDigest() {
    puts("HMac::GetUnderlyingDigest");
    return digest;
}

void HMac::Init(ICipherParameters *parameters) {
    puts("HMac::Init");
    digest->Reset();

    uint8* key = ((KeyParameter *)parameters)->GetKey();
    int keyLength = ((KeyParameter *)parameters)->GetKeyLength();

    if (keyLength > blockLength) {
        digest->BlockUpdate(key, 0,keyLength);
        digest->DoFinal(inputPad, 0);

        keyLength = digestSize;
    } else {
        Array::Copy(key, 0, inputPad, 0, (uint32)keyLength);
    }

    //Array.Clear(inputPad, keyLength, blockLength - keyLength);
    for (int i = keyLength; i < blockLength - keyLength; i++)
        inputPad[i] = 0;
    Array::Copy(inputPad, 0, outputPad, 0, blockLength);

    mXor(inputPad, IPAD, inputPad_Length);
	mXor(outputPad, OPAD, outputPad_Length);

    // Initialise the digest
    digest->BlockUpdate(inputPad, 0, inputPad_Length);
}

int HMac::GetMacSize() {
    printf("HMac::GetMacSize: " + digestSize);
    return digestSize;
}

void HMac::Update(uint8 input) {
    puts("HMac::Update");
    digest->Update(input);
}

void HMac::BlockUpdate(uint8* input, int inOff, int len) {
    puts("HMac::BlockUpdate");
    digest->BlockUpdate(input, inOff, len);
}

int HMac::DoFinal(uint8* output, int outOff) {
    puts("HMac::DoFinal");
    uint8* tmp = new uint8[digestSize];
    digest->DoFinal(tmp, 0);

    digest->BlockUpdate(outputPad, 0, outputPad_Length);
    digest->BlockUpdate(tmp, 0, digestSize);

    int len = digest->DoFinal(output, outOff);

    // Initialise the digest
    digest->BlockUpdate(inputPad, 0, inputPad_Length);

    return len;
}

/**
 * Reset the mac generator.
 */
void HMac::Reset() {
    puts("HMac::Reset");
    // Reset underlying digest
    digest->Reset();

    // Initialise the digest
    digest->BlockUpdate(inputPad, 0, inputPad_Length);
}

void HMac::mXor(uint8* a, uint8 n, uint32 length) {
    puts("HMac::mXor");
    for (int i = 0; i < length; ++i) {
        a[i] ^= n;
    }
}
}

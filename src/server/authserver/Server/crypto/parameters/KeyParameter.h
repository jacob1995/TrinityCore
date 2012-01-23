#ifndef _AUTH_KEYPARAMETER_H
#define _AUTH_KEYPARAMETER_H

#include "../ICipherParameters.h"

using namespace Org_BouncyCastle_Crypto;

namespace Org_BouncyCastle_Crypto_Parameters {
class KeyParameter: public ICipherParameters {
private:
    uint8* key;
    uint32 key_Length;

public:
    KeyParameter(uint8* key, int keyLen);

    KeyParameter(uint8* key, int keyOff, int keyLen);
    uint8* GetKey();
    uint32 GetKeyLength();
};

}

#endif
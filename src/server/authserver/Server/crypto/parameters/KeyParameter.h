/**
 * Original code from: http://www.bouncycastle.org/csharp/
 *
 * Ported from C# to C++ by kizura, 2012-Jan
 *
 * License: http://www.gnu.org/licenses/gpl.html
 *
 */
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

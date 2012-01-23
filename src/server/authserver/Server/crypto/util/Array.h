#ifndef AUTH_ARRAY_H
#define AUTH_ARRAY_H

namespace Org_BouncyCastle_Crypto_Utilities {
class Array {
private:
    Array();

public:
    static void Copy(uint32* src, uint32 srcIdx, uint32* dest, uint32 destIdx,
            uint32 length);
    static void Copy(uint8* src, uint32 srcIdx, uint8* dest,
            uint32 destIdx, uint32 length);
    static void Clear(uint32* src, uint32 srcIdx, uint32 length);
};
}
#endif

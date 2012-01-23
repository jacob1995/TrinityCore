#ifndef AUTH_PACK_H
#define AUTH_PACK_H

namespace Org_BouncyCastle_Crypto_Utilities {

class Pack {
private:
    Pack();

public:
    static void UInt32_To_BE(uint32 n, uint8* bs);

    static void UInt32_To_BE(uint32 n, uint8* bs, int off);

    static uint32 BE_To_UInt32(uint8* bs);

    static uint32 BE_To_UInt32(uint8* bs, int off);

    static uint64 BE_To_UInt64(uint8* bs);

    static uint64 BE_To_UInt64(uint8* bs, int off);

    static void UInt64_To_BE(uint64 n, uint8* bs);

    static void UInt64_To_BE(uint64 n, uint8* bs, int off);

    static void UInt32_To_LE(uint32 n, uint8* bs);

    static void UInt32_To_LE(uint32 n, uint8* bs, int off);

    static uint32 LE_To_UInt32(uint8* bs);

    static uint32 LE_To_UInt32(uint8* bs, int off);

    static uint64 LE_To_UInt64(uint8* bs);

    static uint64 LE_To_UInt64(uint8* bs, int off);

    static void UInt64_To_LE(uint64 n, uint8* bs);

    static void UInt64_To_LE(uint64 n, uint8* bs, int off);
};
}
#endif

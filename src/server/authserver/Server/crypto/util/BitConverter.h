#ifndef AUTH_BITCONVERTER_H
#define AUTH_BITCONVERTER_H

namespace Org_BouncyCastle_Crypto_Utilities {

// http://www.nextgenupdate.com/forums/computer-programming/394645-java-bitconverter-c.html
// 2012-01-19

class BitConverter {
public:
    static uint8* getBytes(uint16 x);

    static uint8* getBytes(uint32 x);

    static uint8* getBytes(uint64 x);

    static uint32 BitConverter::toInt32(uint8* bytes, uint32 index);
};
}

#endif

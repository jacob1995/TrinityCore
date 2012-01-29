/**
 * Not part of the original Org_BouncyCastle_Crypto_Utilities
 *
 * Adapted from: // http://www.nextgenupdate.com/forums/computer-programming/394645-java-bitconverter-c.html
 * Last visit: 2012-01-19
 *
 * kizura, 2012-Jan
 *
 * License: http://www.gnu.org/licenses/gpl.html
 *
 */

#ifndef AUTH_BITCONVERTER_H
#define AUTH_BITCONVERTER_H

namespace Org_BouncyCastle_Crypto_Utilities {

class BitConverter {
public:
    static uint8* getBytes(uint16 x);

    static uint8* getBytes(uint32 x);

    static uint8* getBytes(uint64 x);

    static uint32 toInt32(uint8* bytes, uint32 index);
};
}

#endif

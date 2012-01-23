#include "BitConverter.h"

namespace Org_BouncyCastle_Crypto_Utilities {

// http://www.nextgenupdate.com/forums/computer-programming/394645-java-bitconverter-c.html
// 2012-01-19

uint8* BitConverter::getBytes(uint16 x) {
    uint8 *retVal = new uint8[2];
    retVal[0] = (uint8) (x >> 8);
    retVal[0] = (uint8) x;
    return retVal;
}

uint8* BitConverter::getBytes(uint32 x) {
    uint8 *retVal = new uint8[4];
    retVal[0] = (uint8) (x >> 24);
    retVal[1] = (uint8) (x >> 16);
    retVal[2] = (uint8) (x >> 8);
    retVal[3] = (uint8) x;
    return retVal;
}

uint8* BitConverter::getBytes(uint64 x) {
    uint8 *retVal = new uint8[8];
    retVal[0] = (uint8) (x >> 56);
    retVal[1] = (uint8) (x >> 48);
    retVal[2] = (uint8) (x >> 40);
    retVal[3] = (uint8) (x >> 32);
    retVal[4] = (uint8) (x >> 24);
    retVal[5] = (uint8) (x >> 16);
    retVal[6] = (uint8) (x >> 8);
    retVal[7] = (uint8) x;
    return retVal;
}

uint32 BitConverter::toInt32(uint8* bytes, uint32 index) {
	//uint64 myArr[4];

    bool IsLittleEndian = false;

    if (IsLittleEndian) {
        return (bytes[0]) | (bytes[1] << 8) | (bytes[2] << 16) | (bytes[3]
                << 24);
    } else {
        return (bytes[0] << 24) | (bytes[1] << 16) | (bytes[2] << 8)
                | (bytes[3]);
    }
	/*
    return (uint32) ((int32) (0xff & bytes[index])
        | (uint32) (0xff & bytes[index + 1]) << 8
        | (uint32) (0xff & bytes[index + 2]) << 16
		| (uint32) (0xff & bytes[index + 3]) << 24);
	*/
	/*
	uint32 retVal = 0;

	retVal =  bytes[index] & 0x000000ff;
	retVal +=  (bytes[index+1] & 0x000000ff) << 8;
	retVal +=  (bytes[index+2] & 0x000000ff) << 16;
	retVal +=  (bytes[index+3] & 0x000000ff) << 24;
	return retVal;
    */

}

}
;


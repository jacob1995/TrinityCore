/*
 * Copyright (C) 2008-2012 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#include "Authenticator.h"

#include <sstream>
#include <iostream>
#include <bitset>
#include <ctime>

#include "crypto/digests/Sha1Digest.h"
#include "crypto/macs/HMac.h"
#include "crypto/util/BitConverter.h"
#include "crypto/parameters/KeyParameter.h"

using namespace Org_BouncyCastle_Crypto_Macs;
using namespace Org_BouncyCastle_Crypto_Digests;
using namespace Org_BouncyCastle_Crypto;
using namespace Org_BouncyCastle_Crypto_Parameters;
using namespace Org_BouncyCastle_Crypto_Utilities;

Authenticator::Authenticator() {
    serverTimeDiff = 0;
}

std::string *Authenticator::getCalculateCode(bool resyncTime,
        std::string pSecretKey) {
    sLog->outStaticDebug("1: getCalculateCode");

    long ServerTimeDiff = 0; //getServerTimeDiff();

    // sync time if required
    if (resyncTime == true || ServerTimeDiff == 0) {
        //Sync();
    }

    sLog->outStaticDebug("2: getCalculateCode");
    uint8* stb = StringToByteArray(pSecretKey);
    for (int i = 0; i < 20; i++) {
        printf("stb:: %d", stb[i]);
    }
    printf("\n");
    sLog->outStaticDebug("_2a: stb; %ld", stb);
    sLog->outStaticDebug("2a: getCalculateCode");
    HMac *hmac = new HMac(new Sha1Digest());
    sLog->outStaticDebug("2b: getCalculateCode:: SecretKey.length %d",
            pSecretKey.length());
    hmac->Init(new KeyParameter(stb, pSecretKey.length() / 2));
    sLog->outStaticDebug("3: getCalculateCode");

    time_t mytime = time((time_t*) 0);
    struct tm *mytm = localtime(&mytime);
    uint64 curtime = 1;
    sLog->outStaticDebug("3a: codeInterval: %u", curtime);

    printf("CodeInterval: %d\n", getCodeInterval());
    uint8* codeIntervalArray = BitConverter::getBytes(
            (uint64) getCodeInterval()); //getCodeInterval())
    for (int i = 0; i < 4; i++) {
        printf("codeIntervalArray:: %d", codeIntervalArray[i]);
    }
    printf("\n");
    sLog->outStaticDebug("4: getCalculateCode");
    //
    //if (BitConverter.IsLittleEndian) {
    //  Array.Reverse(codeIntervalArray);
    //}

    hmac->BlockUpdate(codeIntervalArray, 0, 8); //codeIntervalArray.length);
    sLog->outStaticDebug("5: getCalculateCode: MacSize %ld", hmac->GetMacSize());

    uint8* mac = new uint8[hmac->GetMacSize()];
    hmac->DoFinal(mac, 0);
    sLog->outStaticDebug("6: getCalculateCode");

    // the last 4 bits of the mac say where the code starts (e.g. if last 4 bit are 1100, we start at byte 12)
    int start = mac[19] & 0x0f;
    printf("start: %d\n", start);

    sLog->outStaticDebug("7: getCalculateCode");
    // extract those 4 bytes
    uint8* bytes = new uint8[4];
    Array::Copy(mac, start, bytes, 0, 4);
    for (int i = 0; i < 4; i++) {
        printf("(mac:: %d /", mac[start + i]);
        printf("bytes:: %d)", bytes[i]);
        printf("--");
    }
    printf("\n");
    sLog->outStaticDebug("8: getCalculateCode");
    //
    //if (BitConverter.IsLittleEndian) {
    //  Array.Reverse(bytes);
    //}

    std::ostringstream *oss = new std::ostringstream();
    IntegerToBinary(BitConverter::toInt32(bytes, 0), oss);
    sLog->outStaticDebug("9: getCalculateCode");
    uint32 fullcode = BitConverter::toInt32(bytes, 0) & 0x7fffffff;
    printf("BitConverter::toInt32: %d\n", BitConverter::toInt32(bytes, 0));
    printf("BitConverter::toInt32: %s\n", oss->str().c_str());
    printf("FULLCODE: %d\n", fullcode);
    printf("fullcode % 100000000: %d\n", fullcode % 100000000);

    delete oss;
    printf("hmac\n");
    delete hmac;
    printf("mac\n");
    delete[] mac;
    printf("bytes\n");
    delete[] bytes;
    sLog->outStaticDebug("stb");
    delete[] stb;

    // we use the last 8 digits of this code in radix 10
    //std::string code = std::string.valueOf(fullcode % 100000000);
    std::ostringstream oss2;
    printf("Vor ostringstream 2: %ld\n", (fullcode % 100000000));
    oss2 << (fullcode % 100000000) << std::dec;

	std::string *retVal = new std::string(oss2.str());
	if( retVal->length() != 8 ) {
		*retVal = "0" + *retVal;
	}
	return retVal;
}

uint8* Authenticator::StringToByteArray(const std::string& pHex) {
    int len = pHex.length();
    uint8 *bytes = new uint8[len / 2];
    for (int i = 0; i < len; i += 2) {
        sscanf(pHex.substr(i, 2).c_str(), "%X", &bytes[i / 2]);
        // bytes[i / 2] = Convert.ToByte(pHex.substr(i, 2), 16);
    }
    return bytes;
}

void Authenticator::IntegerToBinary(uint32 number, std::ostringstream *oss) {
    int remainder;

    if (number <= 1) {
        *oss << number;
        return;
    }

    remainder = number % 2;
    IntegerToBinary(number >> 1, oss);
    *oss << remainder;
}
uint64 Authenticator::getCodeInterval() {
    // calculate the code interval; the server's time div 30,000
    // 30L - we are only dealing with seconds
    return (getCurrentTime() + getServerTimeDiff()) / 30L;
}

uint64 Authenticator::getCurrentTime() {
    std::time_t t = std::time(0); // t is an integer type
    //std::cout << t << " seconds since 01-Jan-1970\n";
    printf("getCurrentTime: %d\n", t);
    return t;
}

uint64 Authenticator::getServerTimeDiff() {
    return serverTimeDiff;
}

void Authenticator::setServerTimeDiff(uint64 pServerTimeDiff) {
    serverTimeDiff = pServerTimeDiff;
}


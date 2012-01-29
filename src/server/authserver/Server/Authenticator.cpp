/**
 * Original code from: http://code.google.com/p/winauth/
 *
 * Ported from C# to C++ by kizura, 2012-Jan
 *
 * License: http://www.gnu.org/licenses/gpl.html
 *
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
Authenticator::~Authenticator() {
    for (CalculatedCodes::iterator e_itr = mCalculatedCodes.begin(); e_itr
            != mCalculatedCodes.end(); ++e_itr) {
        // Free memory
        delete *e_itr;
    }
}

std::string *Authenticator::getCalculateCode(bool resyncTime,
        std::string pSecretKey) {
    sLog->outStaticDebug("getCalculateCode: SecretKey '%s'\n",
            pSecretKey.c_str());

    long ServerTimeDiff = 0; //getServerTimeDiff();

    // sync time if required
    if (resyncTime == true || ServerTimeDiff == 0) {
        //Sync();
    }

    uint8* stb = StringToByteArray(pSecretKey);
    HMac *hmac = new HMac(new Sha1Digest());
    hmac->Init(new KeyParameter(stb, pSecretKey.length() / 2));

    uint8* codeIntervalArray = BitConverter::getBytes(
            (uint64) getCodeInterval()); //getCodeInterval())
#if TRINITY_ENDIAN == TRINITY_BIGENDIAN
    Array::Reverse(codeIntervalArray, 8);
#endif

    hmac->BlockUpdate(codeIntervalArray, 0, 8); //codeIntervalArray.length);

    uint8* mac = new uint8[hmac->GetMacSize()];
    hmac->DoFinal(mac, 0);

    // the last 4 bits of the mac say where the code starts (e.g. if last 4 bit are 1100, we start at byte 12)
    int start = mac[19] & 0x0f;

    // extract those 4 bytes
    uint8* bytes = new uint8[4];
    Array::Copy(mac, start, bytes, 0, 4);
#if TRINITY_ENDIAN == TRINITY_BIGENDIAN
    Array::Reverse(bytes, 4);
#endif

    std::ostringstream *oss = new std::ostringstream();
    IntegerToBinary(BitConverter::toInt32(bytes, 0), oss);
    uint32 fullcode = BitConverter::toInt32(bytes, 0) & 0x7fffffff;

    delete oss;
    delete hmac;
    delete[] mac;
    delete[] bytes;
    delete[] stb;

    // we use the last 8 digits of this code in radix 10
    //std::string code = std::string.valueOf(fullcode % 100000000);
    std::ostringstream oss2;
    oss2 << (fullcode % 100000000) << std::dec;

    std::string *retVal = new std::string(oss2.str());
    if (retVal->length() != 8) {
        *retVal = "0" + *retVal;
    }
    // Remember for cleanup
    mCalculatedCodes.push_back(retVal);
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
    //printf("getCurrentTime: %d\n", t);
    return t;
}

uint64 Authenticator::getServerTimeDiff() {
    return serverTimeDiff;
}

void Authenticator::setServerTimeDiff(uint64 pServerTimeDiff) {
    serverTimeDiff = pServerTimeDiff;
}


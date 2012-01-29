/**
 * Original code from: http://code.google.com/p/winauth/
 *
 * Ported from C# to C++ by kizura, 2012-Jan
 *
 * License: http://www.gnu.org/licenses/gpl.html
 *
 */

#ifndef _AUTHENTICATOR_H
#define _AUTHENTICATOR_H

// Handle Authenticator
class Authenticator {
private:
    /** Time difference between server and client */
    uint64 serverTimeDiff;
    typedef std::vector<std::string *> CalculatedCodes;
    CalculatedCodes mCalculatedCodes;
public:
    Authenticator();
    ~Authenticator();

    // Convert a hex String into a byte array. E.g. "001f406a" -> byte[] {0x00, 0x1f, 0x40, 0x6a}
    // Idea from WinAuth
    uint8* StringToByteArray(const std::string& hex);
    std::string *getCalculateCode(bool resyncTime, std::string pSecretKey);
    void IntegerToBinary(uint32 number, std::ostringstream *oss);
    /** calculate the code interval; the server's time div 30,000 */
    uint64 getCodeInterval();

    /** Return current System time in ms */
    uint64 getCurrentTime();

    uint64 getServerTimeDiff();

    void setServerTimeDiff(uint64 serverTimeDiff);
};
#endif

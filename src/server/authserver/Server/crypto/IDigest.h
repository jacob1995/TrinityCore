/**
 * Original code from: http://www.bouncycastle.org/csharp/
 *
 * Ported from C# to C++ by kizura, 2012-Jan
 *
 * License: http://www.gnu.org/licenses/gpl.html
 *
 */

#ifndef AUTH_IDIGEST_H
#define AUTH_IDIGEST_H

namespace Org_BouncyCastle_Crypto {
/**
 * interface that a message digest conforms to.
 */
class IDigest {
public:
    /**
     * return the algorithm name
     *
     * @return the algorithm name
     */
    virtual std::string getAlgorithmName() = 0;

    /**
     * return the size, in uint8s, of the digest produced by this message digest.
     *
     * @return the size, in uint8s, of the digest produced by this message digest.
     */
    virtual int GetDigestSize() = 0;

    /**
     * return the size, in uint8s, of the internal buffer used by this digest.
     *
     * @return the size, in uint8s, of the internal buffer used by this digest.
     */
    virtual int GetByteLength() = 0;

    /**
     * update the message digest with a single uint8.
     *
     * @param inuint8 the input uint8 to be entered.
     */
    virtual void Update(uint8 input) = 0;

    /**
     * update the message digest with a block of uint8s.
     *
     * @param input the uint8 array containing the data.
     * @param inOff the offset into the uint8 array where the data starts.
     * @param len the length of the data.
     */
    virtual void BlockUpdate(uint8* input, int inOff, int length) = 0;

    /**
     * Close the digest, producing the final digest value. The doFinal
     * call leaves the digest reset.
     *
     * @param output the array the digest is to be copied into.
     * @param outOff the offset into the out array the digest is to start at.
     */
    virtual int DoFinal(uint8* output, int outOff) = 0;

    /**
     * reset the digest back to it's initial state.
     */
    virtual void Reset() = 0;
};
}

#endif

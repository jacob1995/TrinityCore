#ifndef AUTH_IIMAC_H
#define AUTH_IIMAC_H

#include "ICipherParameters.h"
#include "IDigest.h"


namespace Org_BouncyCastle_Crypto {
/**
 * The base interface for implementations of message authentication codes (MACs).
 */
class IMac {
public:
    //IMac(IDigest *digest);

    /**
     * Initialise the MAC.
     *
     * @param param the key and other data required by the MAC.
     * @exception ArgumentException if the parameters argument is
     * inappropriate.
     */
    virtual void Init(ICipherParameters *parameters) = 0;

    /**
     * Return the name of the algorithm the MAC implements.
     *
     * @return the name of the algorithm the MAC implements.
     */
    virtual std::string getAlgorithmName() = 0;

    /**
     * Return the block size for this MAC (in bytes).
     *
     * @return the block size for this MAC in bytes.
     */
    virtual int GetMacSize() = 0;

    /**
     * add a single byte to the mac for processing.
     *
     * @param in the byte to be processed.
     * @exception InvalidOperationException if the MAC is not initialised.
     */
    virtual void Update(uint8 input) = 0;

    /**
     * @param in the array containing the input.
     * @param inOff the index in the array the data begins at.
     * @param len the length of the input starting at inOff.
     * @exception InvalidOperationException if the MAC is not initialised.
     * @exception DataLengthException if there isn't enough data in in.
     */
    virtual void BlockUpdate(uint8* input, int inOff, int len) = 0;

    /**
     * Compute the final stage of the MAC writing the output to the out
     * parameter.
     * <p>
     * doFinal leaves the MAC in the same state it was after the last init.
     * </p>
     * @param out the array the MAC is to be output to.
     * @param outOff the offset into the out buffer the output is to start at.
     * @exception DataLengthException if there isn't enough space in out.
     * @exception InvalidOperationException if the MAC is not initialised.
     */
    virtual int DoFinal(uint8* output, int outOff) = 0;

    /**
     * Reset the MAC. At the end of resetting the MAC should be in the
     * in the same state it was after the last init (if there was one).
     */
    virtual void Reset() = 0;
};
}

#endif

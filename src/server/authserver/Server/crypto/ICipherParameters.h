/**
 * Original code from: http://www.bouncycastle.org/csharp/
 *
 * Ported from C# to C++ by kizura, 2012-Jan
 *
 * License: http://www.gnu.org/licenses/gpl.html
 *
 */

#ifndef AUTH_ICIPHERPARAMETERS_H
#define AUTH_ICIPHERPARAMETERS_H

namespace Org_BouncyCastle_Crypto {
/**
 * all parameter classes implement this.
 */
class ICipherParameters {
public:
    virtual ~ICipherParameters() {
    }
};
}

#endif

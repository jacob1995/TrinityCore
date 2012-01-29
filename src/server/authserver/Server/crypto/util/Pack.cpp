/**
 * Original code from: http://www.bouncycastle.org/csharp/
 *
 * Ported from C# to C++ by kizura, 2012-Jan
 *
 * License: http://www.gnu.org/licenses/gpl.html
 *
 */

#include "Pack.h"

namespace Org_BouncyCastle_Crypto_Utilities {

Pack::Pack() {
}

void Pack::UInt32_To_BE(uint32 n, uint8* bs) {
    bs[0] = (uint8) (n >> 24);
    bs[1] = (uint8) (n >> 16);
    bs[2] = (uint8) (n >> 8);
    bs[3] = (uint8) (n);
}

void Pack::UInt32_To_BE(uint32 n, uint8* bs, int off) {
    bs[off] = (uint8) (n >> 24);
    bs[++off] = (uint8) (n >> 16);
    bs[++off] = (uint8) (n >> 8);
    bs[++off] = (uint8) (n);
}

uint32 Pack::BE_To_UInt32(uint8* bs) {
    uint32 n = (uint32) bs[0] << 24;
    n |= (uint32) bs[1] << 16;
    n |= (uint32) bs[2] << 8;
    n |= (uint32) bs[3];
    return n;
}

uint32 Pack::BE_To_UInt32(uint8* bs, int off) {
    uint32 n = (uint32) bs[off] << 24;
    n |= (uint32) bs[++off] << 16;
    n |= (uint32) bs[++off] << 8;
    n |= (uint32) bs[++off];
    return n;
}

uint64 Pack::BE_To_UInt64(uint8* bs) {
    uint32 hi = BE_To_UInt32(bs);
    uint32 lo = BE_To_UInt32(bs, 4);
    return ((uint64) hi << 32) | (uint64) lo;
}

uint64 Pack::BE_To_UInt64(uint8* bs, int off) {
    uint32 hi = BE_To_UInt32(bs, off);
    uint32 lo = BE_To_UInt32(bs, off + 4);
    return ((uint64) hi << 32) | (uint64) lo;
}

void Pack::UInt64_To_BE(uint64 n, uint8* bs) {
    UInt32_To_BE((uint32) (n >> 32), bs);
    UInt32_To_BE((uint32) (n), bs, 4);
}

void Pack::UInt64_To_BE(uint64 n, uint8* bs, int off) {
    UInt32_To_BE((uint32) (n >> 32), bs, off);
    UInt32_To_BE((uint32) (n), bs, off + 4);
}

void Pack::UInt32_To_LE(uint32 n, uint8* bs) {
    bs[0] = (uint8) (n);
    bs[1] = (uint8) (n >> 8);
    bs[2] = (uint8) (n >> 16);
    bs[3] = (uint8) (n >> 24);
}

void Pack::UInt32_To_LE(uint32 n, uint8* bs, int off) {
    bs[off] = (uint8) (n);
    bs[++off] = (uint8) (n >> 8);
    bs[++off] = (uint8) (n >> 16);
    bs[++off] = (uint8) (n >> 24);
}

uint32 Pack::LE_To_UInt32(uint8* bs) {
    uint32 n = (uint32) bs[0];
    n |= (uint32) bs[1] << 8;
    n |= (uint32) bs[2] << 16;
    n |= (uint32) bs[3] << 24;
    return n;
}

uint32 Pack::LE_To_UInt32(uint8* bs, int off) {
    uint32 n = (uint32) bs[off];
    n |= (uint32) bs[++off] << 8;
    n |= (uint32) bs[++off] << 16;
    n |= (uint32) bs[++off] << 24;
    return n;
}

uint64 Pack::LE_To_UInt64(uint8* bs) {
    uint32 lo = LE_To_UInt32(bs);
    uint32 hi = LE_To_UInt32(bs, 4);
    return ((uint64) hi << 32) | (uint64) lo;
}

uint64 Pack::LE_To_UInt64(uint8* bs, int off) {
    uint32 lo = LE_To_UInt32(bs, off);
    uint32 hi = LE_To_UInt32(bs, off + 4);
    return ((uint64) hi << 32) | (uint64) lo;
}

void Pack::UInt64_To_LE(uint64 n, uint8* bs) {
    UInt32_To_LE((uint32) (n), bs);
    UInt32_To_LE((uint32) (n >> 32), bs, 4);
}

void Pack::UInt64_To_LE(uint64 n, uint8* bs, int off) {
    UInt32_To_LE((uint32) (n), bs, off);
    UInt32_To_LE((uint32) (n >> 32), bs, off + 4);
}
}


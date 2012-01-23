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

#ifndef _AUTHENTICATOR_H
#define _AUTHENTICATOR_H

// Handle Authenticator
class Authenticator {
private:
    /** Time difference between server and client */
    uint64 serverTimeDiff;
public:
	Authenticator();

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

/*
Filename:           h2_cliententer_e
System:             core (client enter event script)
Author:             Edward Beck (0100010)
Date Created:       Aug. 27, 2005
Summary:
HCR2 OnClientEnter Event.
This script should be attachted to the OnClientEnter event under
the scripts tab of Module properties.

Revision Info should only be included for post-release revisions.
-----------------
Revision Date:
Revision Author:
Revision Summary:

*/
#include "h2_core_i"

void main()
{
    object oPC = GetEnteringObject();
    int bIsDM = GetIsDM(oPC);

    int iNameLength = GetStringLength(GetName(oPC));
    if (iNameLength > H2_MAX_LENGTH_PCNAME)
    {
        SetLocalInt(oPC, H2_LOGIN_BOOT, TRUE);
        h2_BootPlayer(oPC, H2_TEXT_PCNAME_TOO_LONG);
        return;
    }

    string sBannedByCDKey = h2_GetExternalString(H2_BANNED_PREFIX + GetPCPublicCDKey(oPC));
    string sBannedByIPAddress = h2_GetExternalString(H2_BANNED_PREFIX + GetPCIPAddress(oPC));
    if (sBannedByCDKey != "" || sBannedByIPAddress != "")
    {
        SetLocalInt(oPC, H2_LOGIN_BOOT, TRUE);
        h2_BootPlayer(oPC, H2_TEXT_YOU_ARE_BANNED);
        return;
    }

    if (!bIsDM && h2_MaximumPlayersReached())
    {
        SetLocalInt(oPC, H2_LOGIN_BOOT, TRUE);
        h2_BootPlayer(oPC, H2_TEXT_SERVER_IS_FULL, 10.0);
        return;
    }

    if (!bIsDM && h2_GetModLocalInt(H2_MODULE_LOCKED))
    {
        SetLocalInt(oPC, H2_LOGIN_BOOT, TRUE);
        h2_BootPlayer(oPC, H2_TEXT_MODULE_LOCKED, 10.0);
        return;
    }

    int iPlayerState = h2_GetPlayerPersistentInt(oPC, H2_PLAYER_STATE);
    if (!bIsDM && iPlayerState == H2_PLAYER_STATE_RETIRED)
    {
        SetLocalInt(oPC, H2_LOGIN_BOOT, TRUE);
        h2_BootPlayer(oPC, H2_TEXT_RETIRED_PC_BOOT, 10.0);
        return;
    }

    if (!bIsDM && H2_REGISTERED_CHARACTERS_ALLOWED > 0 && !h2_GetPlayerPersistentInt(oPC, H2_REGISTERED))
    {
        int registeredCharCount = h2_GetExternalInt(GetPCPlayerName(oPC) + H2_REGISTERED_CHAR_SUFFIX);
        if (registeredCharCount >= H2_REGISTERED_CHARACTERS_ALLOWED)
        {
            SetLocalInt(oPC, H2_LOGIN_BOOT, TRUE);
            h2_BootPlayer(oPC, H2_TEXT_TOO_MANY_CHARS_BOOT, 10.0);
            return;
        }
    }
    if (!bIsDM)
    {
        int iPlayerCount = h2_GetModLocalInt(H2_PLAYER_COUNT);
        h2_SetModLocalInt(H2_PLAYER_COUNT, iPlayerCount + 1);
    }

    SetLocalString(oPC, H2_PC_PLAYER_NAME ,GetPCPlayerName(oPC));
    SetLocalString(oPC, H2_PC_CD_KEY, GetPCPublicCDKey(oPC));
    h2_CreatePlayerDataItem(oPC);

    if (!H2_READ_CHECK)
        SendMessageToPC(oPC, H2_TEXT_SETTINGS_NOT_READ);
    else
        SendMessageToPC(oPC, H2_TEXT_ON_LOGIN_MESSAGE);

    string sCurrentGameTime = h2_GetCurrentGameTime(H2_SHOW_DAY_BEFORE_MONTH_IN_LOGIN);
    SendMessageToPC(oPC, sCurrentGameTime);
    if (!bIsDM)
    {
        h2_SetPlayerID(oPC);
        h2_InitializePC(oPC);
    }

    h2_RunModuleEventScripts(H2_EVENT_ON_CLIENT_ENTER);
}

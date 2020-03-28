/*
Filename:           h2_clientleave_e
System:             core (client leave event script)
Author:             Edward Beck (0100010)
Date Created:       Aug. 27, 2005
Summary:
HCR2 OnClientLeave Event.
This script should be attachted to the OnClientLeave event under
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
    object oPC = GetExitingObject();
    if (GetLocalInt(oPC, H2_LOGIN_BOOT))
        return;
    if (!GetIsDM(oPC))
    {
        int iPlayerCount = h2_GetModLocalInt(H2_PLAYER_COUNT);
        h2_SetModLocalInt(H2_PLAYER_COUNT, iPlayerCount - 1);
        h2_SavePersistentPCData(oPC);
    }
    h2_RunModuleEventScripts(H2_EVENT_ON_CLIENT_LEAVE);
}

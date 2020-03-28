/*
Filename:           h2_playerdying_e
System:             core (player dying event script)
Author:             Edward Beck (0100010)
Date Created:       Oct. 15, 2005
Summary:
HCR2 OnPlayerDying Event.
This script should be attachted to the OnPlayerDying event under
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
    object oPC = GetLastPlayerDying();
    if (h2_GetPlayerPersistentInt(oPC, H2_PLAYER_STATE) != H2_PLAYER_STATE_DEAD)
        h2_SetPlayerPersistentInt(oPC, H2_PLAYER_STATE, H2_PLAYER_STATE_DYING);
    h2_RunModuleEventScripts(H2_EVENT_ON_PLAYER_DYING);
}

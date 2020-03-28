/*
Filename:           h2_playerspawn_e
System:             core (player respawn event script)
Author:             Edward Beck (0100010)
Date Created:       Feb. 16, 2006
Summary:
HCR2 OnPlayerReSpawn Event.
This script should be attachted to the OnPlayerReSpawn event under
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
    object oPC = GetLastRespawnButtonPresser();
    h2_SetPlayerPersistentInt(oPC, H2_PLAYER_STATE, H2_PLAYER_STATE_ALIVE);
    h2_RunModuleEventScripts(H2_EVENT_ON_PLAYER_RESPAWN);
}

/*
Filename:           h2_playerdeath_e
Author:             Edward Beck (0100010)
Date Created:       Jan. 10, 2006
Summary:
HCR2 OnPlayerDeath Event.
This script should be attachted to the OnPlayerDeath event under
the scripts tab of Module properties.

Revision Info should only be included for post-release revisions.
-----------------
Revision Date: Sept 11th, 2006
Revision Author: Edward Beck (0100010)
Revision Summary: v1.3
Added code to write to the server log and inform DMs that a player has died.
Added line to remove all effects on the dead PC.

*/

#include "h2_core_i"

void main()
{
    object oPC = GetLastPlayerDied();
    SetLocalLocation(oPC, H2_LOCATION_LAST_DIED, GetLocation(oPC));
    h2_SetPlayerPersistentInt(oPC, H2_PLAYER_STATE, H2_PLAYER_STATE_DEAD);
    h2_RemoveEffects(oPC);
    string deathLog = GetName(oPC) + "_" + GetPCPlayerName(oPC) + H2_TEXT_LOG_PLAYER_HAS_DIED;
    deathLog += GetName(GetLastHostileActor(oPC));
    if (GetIsPC(GetLastHostileActor(oPC)))
        deathLog += "_" + GetPCPlayerName(GetLastHostileActor(oPC));
    deathLog += H2_TEXT_LOG_PLAYER_HAS_DIED2 + GetName(GetArea(oPC));
    WriteTimestampedLogEntry(deathLog);
    SendMessageToAllDMs(deathLog);
    h2_RunModuleEventScripts(H2_EVENT_ON_PLAYER_DEATH);
}

/*
Filename:           h2_bleedsysopy
System:             bleed system (player dying event hook-in script)
Author:             Edward Beck (0100010)
Date Created:       Jan. 8, 2006
Summary:

This script should be called via ExecuteScript from the
RunModuleEventScripts(H2_EVENT_ON_PLAYER_DYING, oPC) function that is called from h2_playerdying_e.

To make this script execute, a string variable, named OnPlayerDyingX where X is a number that indicates
the order in which you want this player dying script to execute.
It should be assigned the value "h2_bleedsysopy" under the variables section of Module properties.

Revision Info should only be included for post-release revisions.
-----------------
Revision Date: Jun 30th, 2006
Revision Author: Edward Beck (0100010)
Revision Summary: v1.2
Adjusted the check to verify the player state is dying before bleeding on a player begins.

*/

#include "h2_bleedsystem_i"

void main()
{
    object oPC = GetLastPlayerDying();
    if (h2_GetPlayerPersistentInt(oPC, H2_PLAYER_STATE) == H2_PLAYER_STATE_DYING)
        h2_BeginPlayerBleeding(oPC);
}

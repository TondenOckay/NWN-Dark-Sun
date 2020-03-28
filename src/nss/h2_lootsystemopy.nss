/*
Filename:           h2_lootsystemopy
System:             loot system (hook-in script for player dying event)
Author:             Edward Beck (0100010)
Date Created:       May 20, 2006
Summary:
HCR2 loot system script.

This script should be called via ExecuteScript from the
RunModuleEventScripts(H2_EVENT_ON_PLAYER_DYING, oPC) function that is called from h2_playerdying_e.

To make this script execute, a string variable, named OnPlayerDyingX
where X is a number that indicates the order in which you want this player dyingh script to execute,
should be assigned the value "h2_lootsystemopy" under the variables section of Module properties.

Revision Info should only be included for post-release revisions.
-----------------
Revision Date: Jun 30th, 2006
Revision Author: Edward Beck (0100010)
Revision Summary: v1.2
Added check to verify the player state is dying before script will continue.

*/

#include "h2_lootsystem_i"
#include "h2_core_i"

void main()
{
    object oPC = GetLastPlayerDying();
    //if some other dying subsystem set the player state to something else before this one, no need to continue
    if (h2_GetPlayerPersistentInt(oPC, H2_PLAYER_STATE) != H2_PLAYER_STATE_DYING)
        return;
    object oLootBag = h2_CreateLootBag(oPC);
    h2_MovePossessorInventory(oPC, TRUE, oLootBag);
}

/*
Filename:           h2_deityopd
System:             Deity subsystem (player death hook-in script)
Author:             Edward Beck (0100010)
Date Created:       Sept. 3rd, 2006
Summary:

This script should be called via ExecuteScript from the
RunModuleEventScripts(H2_EVENT_ON_PLAYER_DEATH, oPC) function that is called from h2_playerdeath_e.

To make this script execute, a string variable, named OnPlayerDeathX where X is a number that
indicates the order in which you want this player death script to execute.
Ir should be assigned the value "h2_dietyrezopd" under the variables section of Module properties.

Variables available to all event hook player death scripts:

GetLocalLocation(GetLastPlayerDied(), H2_LOCATION_LAST_DIED);  returns the location the player last died.

You should not overwrite the above variables, or they will not remain consistant
for any other executing player death script which might rely on them.

Revision Info should only be included for post-release revisions.
-----------------
Revision Date:
Revision Author:
Revision Summary:


*/
#include "h2_deity_i"

void main()
{
    object oPC = GetLastPlayerDied();

    //if some other death subsystem set the player state back to alive before this one, no need to continue
    if (h2_GetPlayerPersistentInt(oPC, H2_PLAYER_STATE) != H2_PLAYER_STATE_DEAD)
        return;

    if (h2_CheckForDeityRez(oPC))
        h2_DeityRez(oPC);

}

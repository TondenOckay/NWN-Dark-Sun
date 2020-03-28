/*
Filename:           h2_bleedsysopd
System:             bleed system (player dying event hook-in script)
Author:             Edward Beck (0100010)
Date Created:       Jan. 8, 2006
Summary:

This script should be called via ExecuteScript from the
RunModuleEventScripts(H2_EVENT_ON_PLAYER_DYING, oPC) function that is called from h2_playerdying_e.

To make this script execute, a string variable, named OnPlayerDyingX where X is a number that indicates
the order in which you want this player dying script to execute.
It should be assigned the value "h2_bleedsysopd" under the variables section of Module properties.

Variables available to all event hook player death scripts:

OBJECT_SELF is the player that just died.

You should not overwrite the above variables, or they will not remain consistant
for any other executing player death script which might rely on them.

Revision Info should only be included for post-release revisions.
-----------------
Revision Date:
Revision Author:
Revision Summary:

*/

#include "h2_bleedsystem_i"

void main()
{
    object oPC = OBJECT_SELF;
    if (h2_GetPlayerPersistentInt(oPC, H2_PLAYER_STATE) != H2_PLAYER_STATE_DEAD)
        h2_BeginPlayerBleeding(oPC);
}

/*
Filename:           h2_pcrestcancel
System:             core (rest cancelled hook-in script)
Author:             Edward Beck (0100010)
Date Created:       Jan. 28, 2006
Summary:

This script should be called via ExecuteScript from the
RunModuleEventScripts(H2_EVENT_ON_PLAYER_REST_CANCELLED, oPC) function that is called from h2_playerrest_e.

To make this script execute, a string variable, named OnPlayerRestCancelledX,
where X is a number that indicates the order in which you want this player rest cancelled script to execute,
should be assigned the value "h2_pcrestcancel" under the variables section of Module properties.

If the PC has not been flagged to skip the cancel rest code,
then the PC's Hitpoints and spells and feats will be reset to the values they were at prior to resting.

Revision Info should only be included for post-release revisions.
-----------------
Revision Date: Sept. 13th, 2006
Revision Author: 0100010
Revision Summary: v1.3
Added code to remove the blindness sleep effect if it is turned on.

Revision Date: Dec 31st, 2006
Revision Author: Edward Beck (0100010)
Revision Summary: v1.5
Altered code to hanlde seperated post rest feat and spell recovery.

*/
#include "h2_pcrest_i"

void main()
{
    object oPC = GetLastPCRested();
    h2_SetPlayerHitPointsToSavedValue(oPC);
    h2_SetAvailableSpellsToSavedValues(oPC);
    h2_SetAvailableFeatsToSavedValues(oPC);
    if (H2_SLEEP_EFFECTS)
        h2_RemoveEffectType(oPC, EFFECT_TYPE_BLINDNESS);
}

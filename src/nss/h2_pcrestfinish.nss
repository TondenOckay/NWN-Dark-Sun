/*
Filename:           h2_pcrestfinish
System:             core (rest finished hook-in script)
Author:             Edward Beck (0100010)
Date Created:       Jan. 28, 2006
Summary:
HCR2 PlayerRest script.

This script should be called via ExecuteScript from the
RunModuleEventScripts(H2_EVENT_ON_PLAYER_REST_FINISHED, oPC) function that is called from h2_playerrest_e.

To make this script execute, a string variable, named OnPlayerRestFinishedX,
where X is a number that indicates the order in which you want this player rest finished script to execute,
should be assigned the value "h2_pcrestfinish" under the variables section of Module properties.

If the PC has not been flagged to not allow spell and feat recovery during rest,
then the PC's spells and feats will be reset to the values they were at prior to resting.
If recovery was allowed, then the time of this rest recovery is saved for that PC.

The PC's hitpoint are also adjusted to only heal the amount that was allowed for from the value
retrieved from the h2_GetPostRestHealAmount.

Revision Info should only be included for post-release revisions.
-----------------
Revision Date: Dec 31st, 2006
Revision Author: Edward Beck (0100010)
Revision Summary: v1.5
Altered code to hanlde seperated post rest feat and spell recovery.

*/
#include "h2_pcrest_i"

void main()
{
    object oPC = GetLastPCRested();
    int bAllowSpellRecovery = h2_GetAllowSpellRecovery(oPC);
    if (!bAllowSpellRecovery)
        h2_SetAvailableSpellsToSavedValues(oPC);

    int bAllowFeatRecovery = h2_GetAllowFeatRecovery(oPC);
    if (!bAllowFeatRecovery)
        h2_SetAvailableSpellsToSavedValues(oPC);

    if (bAllowSpellRecovery && bAllowFeatRecovery)
        h2_SaveLastRecoveryRestTime(oPC);

    h2_LimitPostRestHeal(oPC, h2_GetPostRestHealAmount(oPC));
}

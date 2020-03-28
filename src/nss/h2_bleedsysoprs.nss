/*
Filename:           h2_bleedsysoprs
System:             bleed system (player rest started event hook-in script)
Author:             Edward Beck (0100010)
Date Created:       Apr. 2, 2006
Summary:

This script should be called via ExecuteScript from the
RunModuleEventScripts(H2_EVENT_ON_PLAYER_REST_STARTED, oPC) function that is called from h2_playerrest_e.

To make this script execute, a string variable, named OnPlayerRestStartedX where X is a number that indicates
the order in which you want this player dying script to execute.
It should be assigned the value "h2_bleedsysoprs" under the variables section of Module properties.

By Default, h2_GetAllowRest, h2_GetAllowSpellAndFeatRecovery will return true
as h2_playerrest_e defaults them to that value before the rest started event scripts are ran.
Likewise, by default, h2_GetPostRestHealAmount is set to the PC's maximum hit points
to allow for full healing after the rest is finished.

These settings however are changed from their default values in this script.
(and may be changed yet again by other rest started hook-in scripts)

This script merely determines if the elspased time since the PC last rest with recovery
has been enough to allow recovery again.
If the elapased time is not enough, then spell and feat recovery set to false
and the post rest heal amount is set to 0.

If enough time has elapsed then the spell and feat recovery is not change from its default value of true,
and the post rest heal amount is set to the the value assigned to H2_HP_HEALED_PER_REST_PER_LEVEL
times the PC's level.


Revision Info should only be included for post-release revisions.
-----------------
Revision Date:
Revision Author:
Revision Summary:

*/

#include "h2_bleedsystem_i"

void main()
{
    object oPC = GetLastPCRested();
    if (GetLocalInt(oPC, H2_LONG_TERM_CARE) && h2_GetPostRestHealAmount(oPC) > 0)
    {
        DeleteLocalInt(oPC, H2_LONG_TERM_CARE);
        int postRestHealAmt = h2_GetPostRestHealAmount(oPC) * 2;
        h2_SetPostRestHealAmount(oPC, postRestHealAmt);
    }
}

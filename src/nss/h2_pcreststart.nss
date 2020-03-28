/*
Filename:           h2_pcreststart
System:             core (rest started hook-in script)
Author:             Edward Beck (0100010)
Date Created:       Jan. 31, 2006
Summary:

This script should be called via ExecuteScript from the
RunModuleEventScripts(H2_EVENT_ON_PLAYER_REST_STARTED, oPC) function that is called from h2_playerrest_e.

To make this script execute, a string variable, named OnPlayerRestStartedX,
where X is a number that indicates the order in which you want this player rest started script to execute,
should be assigned the value "h2_pcreststart" under the variables section of Module properties.

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
Revision Date: Sept. 13th, 2006
Revision Author: 0100010
Revision Summary: v1.3
Added code to add the blindness sleep effect if it is turned on.
Added code to check for rest triggers or nearby campfires if that requirement is turned on.

Revision Date: Dec 31st, 2006
Revision Author: Edward Beck (0100010)
Revision Summary: v1.5
Altered code to handle seperated pre and post rest feat and spell recovery.

*/
#include "h2_pcrest_i"

void main()
{
    object oPC = GetLastPCRested();
    int nRemainingTime = h2_RemainingTimeForRecoveryInRest(oPC);
    int skipDialog = GetLocalInt(oPC, H2_SKIP_REST_DIALOG);
    if (H2_REQUIRE_REST_TRIGGER_OR_CAMPFIRE)
    {
        object oRestTrigger = GetLocalObject(oPC, H2_REST_TRIGGER);
        object oCampfire = GetNearestObjectByTag(H2_CAMPFIRE, oPC);
        if (GetIsObjectValid(oRestTrigger))
        {
            if (GetLocalInt(oRestTrigger, H2_IGNORE_MINIMUM_REST_TIME))
                nRemainingTime = 0;
            string feedback = GetLocalString(oRestTrigger, H2_REST_FEEDBACK);
            if (feedback != "" && skipDialog)
                SendMessageToPC(oPC, feedback);
        }
        else if (!GetIsObjectValid(oCampfire) || GetDistanceBetween(oPC, oCampfire) > 4.0)
        {
            h2_SetAllowRest(oPC, FALSE);
            return;
        }
    }

    if (nRemainingTime != 0)
    {
        if (!skipDialog)
        {
            string waittime = FloatToString(nRemainingTime / HoursToSeconds(1), 5, 2);
            string message = H2_TEXT_RECOVER_WITH_REST_IN + waittime + H2_TEXT_HOURS;
            SendMessageToPC(oPC, message);
        }
        h2_SetAllowSpellRecovery(oPC, FALSE);
        h2_SetAllowFeatRecovery(oPC, FALSE);
        h2_SetPostRestHealAmount(oPC, 0);
    }
    else
    {
        if (skipDialog && H2_SLEEP_EFFECTS)
            h2_ApplySleepEffects(oPC);
        if (H2_HP_HEALED_PER_REST_PER_LEVEL > -1)
        {
            int postRestHealAmt = H2_HP_HEALED_PER_REST_PER_LEVEL * GetHitDice(oPC);
            h2_SetPostRestHealAmount(oPC, postRestHealAmt);
        }
    }
}

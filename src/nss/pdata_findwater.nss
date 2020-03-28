/*******************************************************************************
* Description:  Find Water Script
  Usage:        Action Taken conversation line for Player Data Widget Option 1
********************************************************************************
* Created By:   Bonebrah
* Arranged By:  Melanie Graham (Nairn)
* Created On:   2019-04-28
*******************************************************************************/
#include "ds_htf_const_i"
#include "ds_htf_i"
#include "h2_pcrest_i"
void main()
{
    object oPC = GetPCSpeaker();

    // Get the server time of the player's last find water attempt
    int nLastFindWaterTime = h2_GetModLocalInt(h2_GetPlayerPersistentString(oPC, H2_UNIQUE_PC_ID) + DKSN_HTF_VARIABLE_LAST_PC_FINDWATER_TIME);

    // Get the server time of the player's last full rest
    int nLastFullRest = h2_GetModLocalInt(h2_GetPlayerPersistentString(oPC, H2_UNIQUE_PC_ID) + H2_LAST_PC_REST_TIME);

    // If in combat, display a message
    if (GetIsInCombat(oPC)) {

        SendMessageToPC(oPC, "You can't search for water in combat!");
    }
    else if (nLastFindWaterTime > nLastFullRest) {

        SendMessageToPC(oPC, "You must rest fully before you can find water again.");
    }
    // If not in combat, and hasn't checked for water since the last full rest, go ahead and try to find some now
    else {

        effect eEffect = SupernaturalEffect(EffectMovementSpeedDecrease(50));
        int iAreaType = GetLocalInt(GetArea(oPC), DKSN_HTF_VARIABLE_AREATYPE);

        SendMessageToPC(oPC, "You begin searching for water!");

        // Store the server time so that we can see it next
        // time the PC tries to find water.
        ds_SaveLastFindWaterTime(oPC);

        // Apply speed decrease for 10 seconds
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEffect, oPC, 10.0);

        //Execute SearchForWaterFunction with 10 second
        DelayCommand(10.0, ds_SearchForWater(oPC, iAreaType));
    }
}

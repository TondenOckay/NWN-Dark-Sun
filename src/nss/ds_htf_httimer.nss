/*
Filename:           ds_htf_httimer
System:             htf (fatigue timer expiration script)
Author:             Edward Burke (tingyiant)
Date Created:       20200213
Summary:
Dark Sun HTF timer expiration script.  This script runs every time the fatigue timer
    expires on any creature which has been initialized into the HTF subsytem.

This script is set on the timer through the constant H2_HT_TIMER_SCRIPT in
    h2_hungerthrst_i.  It replaces the original timer expiration script for the HCR2
    hunger/thirst system.

If you're looking to modify the way the system modifies the HTF decrement values,
    look at the ds_Modify***DecrementUnit() functions in ds_htf_i.

Revision Info should only be included for post-release revisions.
-----------------
Revision Date:
Revision Author:
Revision Summary:

*/

#include "ds_htf_i"
#include "h2_fatigue_i"
#include "h2_hungerthrst_i"

void main()
{
    object oCreature = OBJECT_SELF;

    float thirstDrop = h2_GetThirstDecrement(oCreature);
    float hungerDrop = h2_GetHungerDecrement();

    float fThirstDecrement = ds_ModifyThirstDecrementUnit(oCreature, thirstDrop);
    float fHungerDecrement = ds_ModifyHungerDecrementUnit(oCreature, hungerDrop);

    h2_PerformHungerThirstCheck(oCreature, fThirstDecrement, fHungerDecrement);

    if(!GetIsPC(oCreature) && GetIsPC(GetMaster(oCreature)))
    {
        float fThirst = GetLocalFloat(oCreature, H2_HT_CURR_THIRST) * 100.0;
        float fHunger = GetLocalFloat(oCreature, H2_HT_CURR_HUNGER) * 100.0;
        float fFatigue = GetLocalFloat(oCreature, H2_CURR_FATIGUE) * 100.0;

        ds_DisplayAssociateHTFValues(oCreature, fThirst, fHunger, fFatigue);
    }
}

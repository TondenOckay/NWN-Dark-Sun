/*
Filename:           h2_pcrest_i
System:             player rest (include script)
Author:             Edward Beck (0100010)
Date Created:       Apr. 6, 2006
Summary:
HCR2 player rest function definition script.
Consumed as an include rdirective in player rest scripts.


Revision Info should only be included for post-release revisions.
-----------------
Revision Date: Sept 13th, 2006
Revision Author: 0100010
Revision Summary: v1.3
Addded constants and function to handle rest triggers and campfire restriction

*/

#include "h2_core_i"
#include "h2_pcrest_c"


const string H2_LAST_PC_REST_TIME = "H2_LAST_PC_RESTTIME";
const string H2_REST_TRIGGER = "H2_REST_TRIGGER";
const string H2_IGNORE_MINIMUM_REST_TIME = "H2_IGNORE_MINIMUM_REST_TIME";
const string H2_REST_FEEDBACK = "H2_REST_FEEDBACK";
const string H2_CAMPFIRE_BURN = "H2_CAMPFIRE_BURN";
const string H2_CAMPFIRE_START_TIME = "H2_CAMPFIRE_START_TIME";

//This function saves a value derived from the time since the server was started
//when oPC finishes a rest in which their spells and feats were allowed to be recovered
//properly. This value is used in determining the elapsed time since their last recovery
//rest when oPC next tries to rest.
void h2_SaveLastRecoveryRestTime(object oPC);

//Returns the amount of time in real seconds that are remaining
//before recovery in rest is allowed according to H2_MINIMUM_SPELL_RECOVERY_REST_TIME
//and the time elapsed since the last time oPC recovered during rest.
int h2_RemainingTimeForRecoveryInRest(object oPC);




void h2_SaveLastRecoveryRestTime(object oPC)
{
    int restTime = h2_GetSecondsSinceServerStart();
    string uniquePCID = h2_GetPlayerPersistentString(oPC, H2_UNIQUE_PC_ID);
    h2_SetModLocalInt(uniquePCID + H2_LAST_PC_REST_TIME, restTime);
}

int h2_RemainingTimeForRecoveryInRest(object oPC)
{
    int currTime = h2_GetSecondsSinceServerStart();
    string uniquePCID = h2_GetPlayerPersistentString(oPC, H2_UNIQUE_PC_ID);
    int lastrest = h2_GetModLocalInt(uniquePCID + H2_LAST_PC_REST_TIME);
    int elapsedTime = currTime - lastrest;
    if (lastrest > 0 &&  elapsedTime < H2_MINIMUM_SPELL_RECOVERY_REST_TIME)
        return H2_MINIMUM_SPELL_RECOVERY_REST_TIME - elapsedTime;
    else
        return 0;
}

void h2_ApplySleepEffects(object oPC)
{
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBlindness(), oPC);
    if (GetRacialType(oPC) != RACIAL_TYPE_ELF && GetRacialType(oPC) != RACIAL_TYPE_HALFELF)
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_SLEEP), oPC);
}

void h2_CheckIfCampfireIsOut(object oCampfire)
{
    int starttime = GetLocalInt(oCampfire, H2_CAMPFIRE_START_TIME);
    int currTime = h2_GetSecondsSinceServerStart();
    int burnHours = GetLocalInt(oCampfire, H2_CAMPFIRE_BURN);
    float burnTime = IntToFloat(currTime - starttime);
    if (HoursToSeconds(burnHours) <= burnTime)
        DestroyObject(oCampfire);
    else
        DelayCommand(HoursToSeconds(burnHours) - burnTime, h2_CheckIfCampfireIsOut(oCampfire));
}

void h2_UseFirewood(object oPC, object oFirewood)
{
    object oTarget = GetItemActivatedTarget();
    if (GetIsObjectValid(oTarget))
    {
        if (GetTag(oTarget) == H2_CAMPFIRE)
        {
            int burnHours = GetLocalInt(oTarget, H2_CAMPFIRE_BURN);
            burnHours +=3;
            SetLocalInt(oTarget, H2_CAMPFIRE_BURN, burnHours);
            AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW, 1.0, 3.0));
            DestroyObject(oFirewood);
        }
        else
            SendMessageToPC(oPC, H2_TEXT_CANNOT_USE_ON_TARGET);
    }
    else
    {
        location loc = GetItemActivatedTargetLocation();
        object oCampfire = CreateObject(OBJECT_TYPE_PLACEABLE, H2_CAMPFIRE, loc);
        SetLocalInt(oCampfire, H2_CAMPFIRE_BURN, 3);
        int starttime = h2_GetSecondsSinceServerStart();
        SetLocalInt(oCampfire, H2_CAMPFIRE_START_TIME, starttime);
        DelayCommand(HoursToSeconds(3), h2_CheckIfCampfireIsOut(oCampfire));
        AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW, 1.0, 3.0));
        DestroyObject(oFirewood);
    }
}

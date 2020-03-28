#include "h2_fatigue_i"
#include "h2_hungerthrst_i"

void main()
{

object oSelf = OBJECT_SELF;
string sTag = GetTag(oSelf);
object oPC = GetLastUsedBy();

    if (sTag == "lever_function1") 
    {
        //Fix Fatigue
        SetLocalFloat(oPC, H2_CURR_FATIGUE, 1.0);
        DeleteLocalInt(oPC, H2_FATIGUE_SAVE_COUNT);

        //Fix Hunger
        SetLocalFloat(oPC, H2_HT_CURR_HUNGER, 1.0);
        if (GetLocalInt(oPC, H2_HT_HUNGER_NONLETHAL_DAMAGE) && !GetLocalInt(oPC, H2_HT_THIRST_NONLETHAL_DAMAGE))
            h2_RemoveHTFatigue(oPC);
        DeleteLocalInt(oPC, H2_HT_HUNGER_NONLETHAL_DAMAGE);
        DeleteLocalInt(oPC, H2_HT_IS_STARVING);

        //Fix Thirst
        SetLocalFloat(oPC, H2_HT_CURR_THIRST, 1.0);
        if (GetLocalInt(oPC, H2_HT_THIRST_NONLETHAL_DAMAGE) && !GetLocalInt(oPC, H2_HT_HUNGER_NONLETHAL_DAMAGE))
            h2_RemoveHTFatigue(oPC);
        DeleteLocalInt(oPC, H2_HT_THIRST_NONLETHAL_DAMAGE);
        DeleteLocalInt(oPC, H2_HT_IS_DEHYDRATED);

        h2_PerformHungerThirstCheck(oPC);
        h2_PerformFatigueCheck(oPC);
    }

    if (sTag == "lever_function2") GiveXPToCreature(oPC, 100000);
}


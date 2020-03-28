/*
Filename:           h2_clericusdef_e
System:             pc corpse (npc user defined event script)
Author:             Edward Beck (0100010)
Date Created:       Apr. 9, 2006
Summary:
User defined event script example that is attached to an NPC cleric.
This Allows the NPC to resurrect a player character when the corpse
toekn item is used on the. Alter this example and save as a different script
to customize how you want to handle a particular NPC's mechanisms or reasons
for resurrecting a character.

Note, for this particular example, it is assumed that the NPC the script is placed on
is set up to already have the ability to cast raise dead and resurrection.
Therefore no class, level or available spell checking is done. Alter your version
of the script to do any checking you think is necessary.

Revision Info should only be included for post-release revisions.
-----------------
Revision Date: Aug. 30th, 2006
Revision Author: Edward Beck (0100010)
Revision Summary: v1.3
Removed some string constants.
Made gold removal for ress costs destroyed permanently.
*/
#include "h2_pccorpse_i"

void main()
{
    int nEvent = GetUserDefinedEventNumber();
    if (nEvent == H2_PCCORPSE_ITEM_ACTIVATED_EVENT_NUMBER)
    {
        if (H2_ALLOW_CORPSE_RESS_BY_PLAYERS == FALSE)
            return;
        object oPC = GetLocalObject(OBJECT_SELF, H2_PCCORPSE_ITEM_ACTIVATOR);
        object oToken = GetLocalObject(OBJECT_SELF, H2_PCCORPSE_ITEM_ACTIVATED);
        int nSpellID = -1;
        if (H2_REQUIRE_GOLD_FOR_RESS)
        {
            FloatingTextStringOnCreature(H2_TEXT_CLERIC_RES_GOLD_COST, OBJECT_SELF, FALSE);
            if (GetGold(oPC) >= H2_GOLD_COST_FOR_RESSURECTION)
            {
                nSpellID = SPELL_RESURRECTION;
                TakeGoldFromCreature(H2_GOLD_COST_FOR_RESSURECTION, oPC, TRUE);
            }
            else if (GetGold(oPC) >= H2_GOLD_COST_FOR_RAISE_DEAD)
            {
                nSpellID = SPELL_RAISE_DEAD;
                TakeGoldFromCreature(H2_GOLD_COST_FOR_RAISE_DEAD, oPC, TRUE);
            }
            else
                FloatingTextStringOnCreature(H2_TEXT_CLERIC_NOT_ENOUGH_GOLD, OBJECT_SELF, FALSE);
        }
        else
            nSpellID = SPELL_RESURRECTION;
        if (nSpellID != -1)
        {
            h2_RaiseSpellCastOnCorpseToken(nSpellID, oToken);
        }
    }
}



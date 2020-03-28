/*
Filename:           h2_spellhook_e
System:             core (spellhook event script)
Author:             Karl Nickels (Syrus Greycloak)
Date Created:       Jun 27, 2006
Summary:
HCR2 OnSpellhook Event.
This script should be set as the spellhook script in the
OnModuleLoad event script for the module.

Revision Info should only be included for post-release revisions.
-----------------
Revision Date:
Revision Author:
Revision Summary:

*/

#include "x2_inc_switches"

void main()
{
    object oPC = OBJECT_SELF;
    SendMessageToPC(oPC, "Caster: " + GetName(oPC));
    SendMessageToPC(oPC, "SpellID: " + IntToString(GetSpellId()));

    if(GetSpellId() == 318) SendMessageToPC(oPC, "I got my familiar, yay!");

}

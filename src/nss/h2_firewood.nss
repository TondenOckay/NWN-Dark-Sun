/*
Filename:           h2_firewood
System:             player rest
Author:             Edward Beck (0100010)
Date Created:       Sept. 13th, 2006
Summary:
HCR2 h2_firewood item script.
This script fires via tag based scripting for the OnActivate events for this item.


Revision Info should only be included for post-release revisions.
-----------------
Revision Date:
Revision Author:
Revision Summary:

*/

#include "h2_pcrest_i"
#include "x2_inc_switches"

void main()
{
    int nEvent = GetUserDefinedItemEventNumber();
    if (nEvent ==  X2_ITEM_EVENT_ACTIVATE)
    {
        object oPC   = GetItemActivator();
        object oItem = GetItemActivated();
        h2_UseFirewood(oPC, oItem);
    }
}

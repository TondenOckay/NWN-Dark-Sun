/*
Filename:           h2_healwidget
System:             bleed system (heal widget item script)
Author:             Edward Beck (0100010)
Date Created:       Apr. 1, 2006
Summary:
Heal Widget item event script.
This script fires whenever the h2_healwidget item is aquired, unaquired, activated,
or had a spell cast at it.

Revision Info should only be included for post-release revisions.
-----------------
Revision Date:
Revision Author:
Revision Summary:

*/

#include "h2_bleedsystem_i"
#include "x2_inc_switches"

void main()
{
    int nEvent = GetUserDefinedItemEventNumber();

    // * This code runs when the Unique Power property of the item is used
    // * Note that this event fires PCs only
    if (nEvent ==  X2_ITEM_EVENT_ACTIVATE)
    {
        object oTarget = GetItemActivatedTarget();
        if (GetObjectType(oTarget) != OBJECT_TYPE_CREATURE)
            return;
        h2_UseHealWidgetOnTarget(oTarget);
    }
}

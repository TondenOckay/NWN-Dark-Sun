/*
Filename:           h2_unidondrop_i
System:             UnID on drop (include script)
Author:             Edward Beck (0100010)
Date Created:       Sept. 12th, 2006
Summary:

HCR2 h2_unidondrop_i script.
This is an include script for the unidondrop subsystem.

Revision Info should only be included for post-release revisions.
-----------------
Revision Date:
Revision Author:
Revision Summary:

*/

#include "h2_unidondrop_c"

void h2_UnID(object oItem)
{   //check possessor again in case it was picked up during the delay period.
    if (GetItemPossessor(oItem) == OBJECT_INVALID)
        SetIdentified(oItem, FALSE);
}

void h2_UnIDOnDrop(object oItem)
{
    if (GetItemPossessor(oItem) == OBJECT_INVALID &&
        !GetLocalInt(oItem, H2_NO_UNID) &&
        GetGoldPieceValue(oItem) > H2_UNID_MINIMUM_VALUE)
    {
        DelayCommand(IntToFloat(H2_UNID_DELAY), h2_UnID(oItem));
    }
}



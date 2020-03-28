/*
Filename:           h2_pccorpseocl
System:             pc corpse (client leave event hook-in script)
Author:             Edward Beck (0100010)
Date Created:       Apr. 27, 2006
Summary:

This script should be called via ExecuteScript from the
RunModuleEventScripts(H2_EVENT_ON_CLIENT_LEAVE, oPC) function that is called from h2_clientleave_e.

To make this script execute, a string variable, named OnClientEnterX,
where X is a number that indicates the order in which you want this client enter script to execute,
should be assigned the value "h2_pccorpseocl" under the variables section of Module properties.

Variables available to all event hook clientleave scripts

GetLocalString(GetExitingObject(), H2_PC_PLAYER_NAME) : provides the exiting PC's player name.
GetLocalString(GetExitingObject(), H2_PC_CD_KEY) : provides the exiting PC's CD key.
h2_GetPlayerPersistentString(GetExitingObject(), H2_UNIQUE_PC_ID) : provides the 10 character unique Hex string
used to uniquely identify the PC.

Revision Info should only be included for post-release revisions.
-----------------
Revision Date:
Revision Author:
Revision Summary:

*/

#include "h2_pccorpse_i"

void main()
{
    object oPC = GetExitingObject();
    object oItem = GetFirstItemInInventory(oPC);
    while (GetIsObjectValid(oItem))
    {
        if (GetTag(oItem) == H2_PC_CORPSE_ITEM)
        {
            location lLastDrop = GetLocalLocation(oItem, H2_LAST_DROP_LOCATION);
            object oNewToken = CopyObject(oItem, lLastDrop);
            h2_DropPlayerCorpse(oNewToken);
        }
        oItem = GetNextItemInInventory(oPC);
    }
}

/*
Filename:           h2_prestmenu_s
System:             core (h2_prestmenuconv conversation menu node starting conditional)
Author:             Edward Beck (0100010)
Date Created:       Apr. 2, 2006
Summary:

Starting conditional script that is fired when the pc rest conversation
is opened for each menu item node.

Revision Info should only be included for post-release revisions.
-----------------
Revision Date:
Revision Author:
Revision Summary:

*/


#include "h2_core_i"

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int nTokenIndex = GetLocalInt(oPC, H2_CURRENT_TOKEN_INDEX);
    string menutext = GetLocalString(oPC, H2_PLAYER_REST_MENU_ITEM_TEXT + IntToString(nTokenIndex));
    SetLocalInt(oPC, H2_CURRENT_TOKEN_INDEX, nTokenIndex + 1);
    if (menutext == "")
        return FALSE;
    SetCustomToken(2147483630 + nTokenIndex, menutext);
    return TRUE;
}

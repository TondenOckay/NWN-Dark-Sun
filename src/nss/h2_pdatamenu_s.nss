/*
Filename:           h2_pdatamenu_s
System:             core (h2_playerdataconv menu node starting conditional)
Author:             Edward Beck (0100010)
Date Created:       Apr. 1, 2006
Summary:

Starting conditional script that is fired when the player info and action item conversation
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
    int nTokenIndex = GetLocalInt(GetPCSpeaker(), H2_CURRENT_TOKEN_INDEX);
    string menutext = h2_GetModLocalString(H2_PLAYER_DATA_MENU_ITEM_TEXT + IntToString(nTokenIndex));
    SetLocalInt(GetPCSpeaker(), H2_CURRENT_TOKEN_INDEX, nTokenIndex + 1);

    if (menutext == "")
        return FALSE;
    SetCustomToken(2147483600 + nTokenIndex, menutext);
    return TRUE;
}

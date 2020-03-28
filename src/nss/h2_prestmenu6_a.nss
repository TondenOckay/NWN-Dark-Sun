/*
Filename:           h2_prestmenu6_a
System:             core (h2_playerdataconv menu node action script)
Author:             Edward Beck (0100010)
Date Created:       Apr. 2, 2006
Summary:

Action script that is fired when the 6th menu item in the pc rest conversation
is selected.

Revision Info should only be included for post-release revisions.
-----------------
Revision Date:
Revision Author:
Revision Summary:

*/


#include "h2_core_i"

void main()
{
    string sActionScript = GetLocalString(OBJECT_SELF, H2_PLAYER_REST_MENU_ACTION_SCRIPT + "6");
    ExecuteScript(sActionScript, OBJECT_SELF);
}

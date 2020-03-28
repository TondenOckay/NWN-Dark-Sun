/*
Filename:           h2_areaenter_e
System:             core (Area OnEnter event script)
Author:             Edward Beck (0100010)
Date Created:       Aug. 30, 2006
Summary:
HCR2 Area OnEnter Event.
This script should be attachted to the Area OnEnter event under
the scripts tab of Area properties.

Variables available to all area event scripts:
GetLocalInt(OBJECT_SELF, H2_PLAYERS_IN_AREA) returns the number of players in the area.

Revision Info should only be included for post-release revisions.
-----------------


*/

#include "h2_core_i"

void main()
{
    if (GetIsPC(GetEnteringObject()))
    {
        int playercount = GetLocalInt(OBJECT_SELF, H2_PLAYERS_IN_AREA);
        SetLocalInt(OBJECT_SELF, H2_PLAYERS_IN_AREA, playercount + 1);
    }
    h2_RunAreaEventScripts(H2_AREAEVENT_ON_ENTER);
}

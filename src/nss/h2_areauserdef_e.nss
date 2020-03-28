/*
Filename:           h2_areauserdef_e
System:             core (Area OnUserDefined event script)
Author:             Edward Beck (0100010)
Date Created:       Aug. 30, 2006
Summary:
HCR2 Area OnUserDefined Event.
This script should be attachted to the Area OnUserDefined event under
the scripts tab of Area properties.

Variables available to all area event scripts:
GetLocalInt(OBJECT_SELF, H2_PLAYERS_IN_AREA) returns the number of players in the area.

Revision Info should only be included for post-release revisions.
-----------------


*/

#include "h2_core_i"

void main()
{
    h2_RunAreaEventScripts(H2_AREAEVENT_ON_USER_DEFINED);
}

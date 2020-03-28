/*
Filename:           h2_pdatamenu10_a
System:             core (h2_playerdataconv menu node action script)
Author:             Edward Beck (0100010)
Date Created:       Apr. 1, 2006
Summary:

Action script that is fired when the 10th menu item in the player info and action item conversation
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
    string convResRef = h2_GetModLocalString(H2_CONVERSATION_RESREF + "10");
    if (convResRef != "")
        AssignCommand(OBJECT_SELF, ActionStartConversation(OBJECT_SELF, convResRef, TRUE, FALSE));
}

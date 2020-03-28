/*
Filename:           h2_unacquireit_e
System:             core (module unacquire item event script)
Author:             Edward Beck (0100010)
Date Created:       Jun. 12, 2006
Summary:
HCR2 OnUnAcquireItem Event.
This script should be attachted to the OnUnAcquireItem event under
the scripts tab of Module properties.

Revision Info should only be included for post-release revisions.
-----------------
Revision Date:
Revision Author:
Revision Summary:

*/

#include "h2_core_i"

void main()
{
    h2_RunModuleEventScripts(H2_EVENT_ON_UNACQUIRE_ITEM);
}

/*
Filename:           h2_userdefined_e
System:             core (user defined event script)
Author:             Edward Beck (0100010)
Date Created:       Apr. 9, 2006
Summary:
HCR2 OnUserDefined Event.
This script should be attachted to the OnUserDefined event under
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
    h2_RunModuleEventScripts(H2_EVENT_ON_USER_DEFINED);
}

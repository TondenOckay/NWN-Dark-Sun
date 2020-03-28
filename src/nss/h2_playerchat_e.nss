/*
Filename:           h2_playerchat_e
System:             core (player chat event script)
Author:             Edward Burke (tinygiant)
Date Created:       20200222
Summary:
HCR2 OnPlayerChat Event.
This script should be attachted to the OnPlayerChat event under
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
    h2_RunModuleEventScripts(H2_EVENT_ON_PLAYER_CHAT);
}
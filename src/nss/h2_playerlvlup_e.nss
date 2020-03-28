/*
Filename:           h2_playerlvlup_e
System:             core (player level up event script)
Author:             Edward Beck (0100010)
Date Created:       Jan. 28, 2006
Summary:
HCR2 OnPlayerLevelUp Event.
This script should be attachted to the OnPlayerLevelUp event under
the scripts tab of Module properties.

Revision Info should only be included for post-release revisions.
-----------------
Revision Date: Dec 31st, 2006
Revision Author: 0100010
Revision Summary: v1.5
Player character is exported if H2_EXPORT_CHARACTERS_INTERVAL > 0.0

*/
#include "h2_core_i"

void main()
{
    object oPC = GetPCLevellingUp();
    if (H2_EXPORT_CHARACTERS_INTERVAL > 0.0)
        ExportSingleCharacter(oPC);
    h2_RunModuleEventScripts(H2_EVENT_ON_PLAYER_LEVEL_UP);
}

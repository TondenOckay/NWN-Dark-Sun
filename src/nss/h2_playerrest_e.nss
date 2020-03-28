/*
Filename:           h2_playerrest_e
System:             core (player rest event script)
Author:             Edward Beck (0100010)
Date Created:       Jan. 28, 2006
Summary:
HCR2 OnClientLeave Event.
This script should be attachted to the OnPlayerRest event under
the scripts tab of Module properties.

Revision Info should only be included for post-release revisions.
-----------------
Revision Date: Jun 28th, 2006
Revision Author: Edward Beck (0100010)
Revision Summary: v1.2
Deletion of the skip cancel rest flag is now done at the end of the
rest cancelled section.

Revision Date: Sept 13th, 2006
Revision Author: Edward Beck (0100010)
Revision Summary: v1.3
Fixed a bug where h2_SetAllowRest(oPC, FALSE) was not properly
preventing rest. Condition checking once done inside
h2_OpenRestDialog is now done outside of it in this script.

Revision Date: Dec 31st, 2006
Revision Author: Edward Beck (0100010)
Revision Summary: v1.5
Altered code to handle seperated pre and post rest feat and spell recovery.
Character is exported on rest if H2_EXPORT_CHARACTERS_INTERVAL > 0.0

*/
#include "h2_core_i"

void main()
{
    object oPC = GetLastPCRested();
    if (H2_EXPORT_CHARACTERS_INTERVAL > 0.0)
        ExportSingleCharacter(oPC);
    int nRestEventType = GetLastRestEventType();
    int i;
    switch (nRestEventType)
    {
        case REST_EVENTTYPE_REST_STARTED:
            h2_SetAllowRest(oPC, TRUE);
            h2_SetAllowSpellRecovery(oPC, TRUE);
            h2_SetAllowFeatRecovery(oPC, TRUE);
            h2_SetPostRestHealAmount(oPC, GetMaxHitPoints(oPC));
            DeleteLocalInt(oPC, H2_PLAYER_REST_MENU_INDEX);
            for (i = 1; i <= 10; i++) //Wipe out existing Rest Menu options
            {
                DeleteLocalString(oPC, H2_PLAYER_REST_MENU_ITEM_TEXT + IntToString(i));
                DeleteLocalString(oPC, H2_PLAYER_REST_MENU_ACTION_SCRIPT + IntToString(i));
            }
            //Re-add the default rest menu item.
            h2_AddRestMenuItem(oPC, H2_REST_MENU_DEFAULT_TEXT);
            h2_RunModuleEventScripts(H2_EVENT_ON_PLAYER_REST_STARTED);
            if (h2_GetAllowRest(oPC) && !GetLocalInt(oPC, H2_SKIP_REST_DIALOG))
                h2_OpenRestDialog(oPC);
            else if (!h2_GetAllowRest(oPC))
            {
                SetLocalInt(oPC, H2_SKIP_CANCEL_REST, TRUE);
                AssignCommand(oPC, ClearAllActions());
                SendMessageToPC(oPC, H2_TEXT_REST_NOT_ALLOWED_HERE);
            }
            DeleteLocalInt(oPC, H2_SKIP_REST_DIALOG);
            break;
        case REST_EVENTTYPE_REST_CANCELLED:
            if (!GetLocalInt(oPC, H2_SKIP_CANCEL_REST))
                h2_RunModuleEventScripts(H2_EVENT_ON_PLAYER_REST_CANCELLED);
            DeleteLocalInt(oPC, H2_SKIP_CANCEL_REST);
            break;
        case REST_EVENTTYPE_REST_FINISHED:
            h2_RunModuleEventScripts(H2_EVENT_ON_PLAYER_REST_FINISHED);
            break;
    }
}

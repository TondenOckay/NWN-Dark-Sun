/*
Filename:           h2_moduleload_e
System:             core (module load event script)
Author:             Edward Beck (0100010)
Date Created:       Aug. 28, 2005
Summary:
HCR2 OnModuleLoad Event.
This script should be attachted to the OnModuleLoad event under
the scripts tab of Module properties.

Revision Info should only be included for post-release revisions.
-----------------
Revision Date: Jun 30th, 2006
Revision Author: Edward Beck (0100010)
Revision Summary: v1.2
Added line to set the module spellscript override variable
to the spellhook event script.

Revision Date: Oct 24th, 2006
Revision Author: Edward Beck (0100010)
Revision Summary: v1.4
Moved the Spellhook event svript assignment to after the RunModuleEventScripts call
This is to ensure that the spellhook event remains accurately assigned
even if a module event script altered it.

Revision Date: Dec 31st, 2006
Revision Author: Edward Beck (0100010)
Revision Summary: v1.5
Added call to h2_StartCharExportTimer

*/

#include "h2_core_i"
#include "x2_inc_switches"

void main()
{
    h2_InitializeDatabase();
    h2_CreateCoreDataPoint();
    h2_RestoreSavedCalendar();
    h2_SaveServerStartTime();
    h2_CopyEventVariablesToCoreDataPoint();
    h2_StartCharExportTimer();
    h2_RunModuleEventScripts(H2_EVENT_ON_MODULE_LOAD);
    SetLocalString(GetModule(), MODULE_VAR_OVERRIDE_SPELLSCRIPT, H2_SPELLHOOK_EVENT_SCRIPT);
}

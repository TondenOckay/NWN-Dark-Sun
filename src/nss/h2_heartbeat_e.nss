/*
Filename:           h2_heartbeat_e
System:             core (module heartbeat event script)
Author:             Edward Beck (0100010)
Date Created:       Aug. 27, 2005
Summary:
HCR2 OnHeartbeat Event.
This script should be attachted to the OnHeartbeat event under
the scripts tab of Module properties.

Revision Info should only be included for post-release revisions.
-----------------
Revision Date: Jun. 28th 2006
Revision Author: Edward Beck (0100010)
Revision Summary: v1.2
Added H2_EXPORT_CHARACTERS_ON_HEARTBEAT check.

Revision Date: Dec 31st, 2006
Revision Author: 0100010
Revision Summary: v1.5
Adjusted code to deal with changes to timer functions.
Removed H2_EXPORT_CHARACTER_ON_HEARTBEAT check and export call so
its no longer tied to the heartbeat.

*/
#include "h2_core_i"

void main()
{
    // Forced time update.
    if (H2_FORCE_CLOCK_UPDATE)
        SetTime(GetTimeHour(), GetTimeMinute(), GetTimeSecond(), GetTimeMillisecond());
    h2_SaveCurrentCalendar();
    h2_RunModuleEventScripts(H2_EVENT_ON_HEARTBEAT);
}

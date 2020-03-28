/*
Filename:           h2_unidunaquire
System:             UnID on drop (on unaquire item hook-in script)
Author:             Edward Beck (0100010)
Date Created:       Sept. 12th, 2006
Summary:

This script should be called via ExecuteScript from the
RunModuleEventScripts(H2_EVENT_ON_UNACQUIRE_ITEM, oPC) function that is called from h2_unaquireit_e.

To make this script execute, a string variable, named OnClientEnterX,
where X is a number that indicates the order in which you want this client enter script to execute,
should be assigned the value "h2_fuguedeathoce" under the variables section of Module properties.

Revision Info should only be included for post-release revisions.
-----------------
Revision Date:
Revision Author:
Revision Summary:

*/
#include "h2_unidondrop_i"

void main()
{
    h2_UnIDOnDrop(GetModuleItemLost());
}

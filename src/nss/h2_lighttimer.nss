/*
Filename:           h2_lighttimer
System:             torches and lanterns
Author:             Edward Beck (0100010)
Date Created:       Aug. 30, 2006
Summary:
HCR2 h2_torch item script.
This script fires when the timer for an equipped light source elapses.

Revision Info should only be included for post-release revisions.
-----------------
Revision Date:
Revision Author:
Revision Summary:

*/

#include "h2_torchlantrn_i"

void main()
{
    if (GetTag(OBJECT_SELF) == H2_LANTERN)
        h2_BurnOutLightSource(OBJECT_SELF, TRUE);
    else
        h2_BurnOutLightSource(OBJECT_SELF, FALSE);
}

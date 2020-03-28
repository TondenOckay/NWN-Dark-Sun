/*
Filename:           h2_makepcrest
System:             core (executed script that makes pc rest)
Author:             Edward Beck (0100010)
Date Created:       Apr. 2, 2006
Summary:

This script is called via ExecuteScript from the action script of a rest node
in the rest conversation dialog. It makes the PC actually rest without reopening
the dialogue.

Revision Info should only be included for post-release revisions.
-----------------
Revision Date:
Revision Author:
Revision Summary:

*/
#include "h2_core_i"

void main()
{
    h2_MakePCRest(OBJECT_SELF);
}

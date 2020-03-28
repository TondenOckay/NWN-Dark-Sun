/*
Filename:           h2_destryempty_e
System:             stand-alone script (generic placeable heartbeat event script)
Author:             Edward Beck (0100010)
Date Created:       Jan. 25, 2006
Summary:
HCR2_destryempty_e script. This script should be placed in the
heartbeat event of an inventory placeable that is to be destoyed when its
contents are empty.

Revision Info should only be included for post-release revisions.
-----------------
Revision Date:
Revision Author:
Revision Summary:

*/

void main()
{
    if (!GetIsObjectValid(GetFirstItemInInventory(OBJECT_SELF)))
        DestroyObject(OBJECT_SELF);
}

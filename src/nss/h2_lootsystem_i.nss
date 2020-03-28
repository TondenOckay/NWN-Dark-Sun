/*
Filename:           h2_lootsystem_i
System:             loot system (include script)
Author:             Edward Beck (0100010)
Date Created:       Jan. 28, 2006
Summary:
HCR2 loot system function definition file.
This script is consumed by the Loot system hook-in scripts as an include file.

Revision Info should only be included for post-release revisions.
-----------------
Revision Date:
Revision Author:
Revision Summary:

*/

//resref of the lootbag (Dropped Items) container.
const string H2_LOOT_BAG = "h2_lootbag";

//Creates a Lootbag laceable object to hold the items of oPC while they are dead or dying.
object h2_CreateLootBag(object oPC);

object h2_CreateLootBag(object oPC)
{
    object oLootBag = GetLocalObject(oPC, H2_LOOT_BAG);
    location lLootBag = GetLocation(oLootBag);
    location lPlayer = GetLocation(oPC);
    if (!GetIsObjectValid(oLootBag) || GetDistanceBetweenLocations(lPlayer, lLootBag) > 3.0 ||
        GetAreaFromLocation(lLootBag) != GetArea(oPC))
    {
        oLootBag = CreateObject(OBJECT_TYPE_PLACEABLE, H2_LOOT_BAG, GetLocation(oPC));
        //TODO: set the name of the lootbag using 1.67 patch SetName fuction?
        SetLocalObject(oPC, H2_LOOT_BAG, oLootBag);
    }
    return oLootBag;
}

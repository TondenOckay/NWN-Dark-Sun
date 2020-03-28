/*
Filename:           h2_unidondrop_c
System:             UnID on drop
Author:             Edward Beck (0100010)
Date Created:       Sept. 12th, 2006
Summary:
HCR2 h2_unidondrop_c script.
This is a configuration script for the hunger and thirst subsystem.

Revision Info should only be included for post-release revisions.
-----------------
Revision Date:
Revision Author:
Revision Summary:

*/

//Number of real world seconds that must pass before a dropped item becomes
//un-identified.
const int H2_UNID_DELAY = 300;

//The name of the integer variable used to denote that an object should not be
//un-identified on drop.
const string H2_NO_UNID = "H2_DO_NOT_UNID";

//The total gold cost of an item must exceed this value for
//it to potentially be Un-IDed on drop.
//(setting a value below 5 is not recommended, as a level 1 with 0 lore can Id that value.)
const int H2_UNID_MINIMUM_VALUE = 5;

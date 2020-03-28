/*
Filename:           h2_pcrest_c
System:             player rest (user configuration include script)
Author:             Edward Beck (0100010)
Date Created:       Apr. 6, 2006
Summary:
HCR2 player rest variable user-configuration variable settings.
This script is consumed by h2_pcrest_i as an include directive.

This contains user definable toggles and settings for the core system.

This script is freely editable by the mod builder. It should not contain any h2 functions or constants
that should not be overrideable by the user, please put those in h2_pcrest_i.

Revision Info should only be included for post-release revisions.
-----------------
Revision Date: Sept. 13th, 2006
Revision Author: 0100010
Revision Summary: v1.3
Added a constant to turn blindness sleeps effects on or off.
Added a constant to turn rest trigger or nearby campfire requirement on or off.

*/

//All below functions and constants may be overriden by the user, but do not alter the function signature
//or the name of the constant.

//Begin user configurable constant declarations.

//Minimum Time in real seconds that must pass since the last time a PC rested and
//recovered spells, feats and health, for them to recover them again when they rest.
//Recommended Equation: [Minutes per game hour] * 60 * 8; (results in 8 game hours)
//The default value is 960, which is 8 game hours using 2 RL minutes per game hour.
//To not require any minimum elapsed time set the value to 0.
const int H2_MINIMUM_SPELL_RECOVERY_REST_TIME = 1440;

//Amount of hit points per level that is healed when resting after the minimum time above passed.
//The default value is 1.
//To allow PCs to heal to maximum hitpoints, set the value to -1.
//Note that some with rest event hook-in scripts may alter the final amount of HP healed after the rest
//to a value different than what would result from the value you specify below, even if the value is -1.
const int H2_HP_HEALED_PER_REST_PER_LEVEL = 1;

//Set this value to true to create a blindness and snoring visual effect on PCs who
//rest with recovery.
const int H2_SLEEP_EFFECTS = TRUE;

//Set this to true to only allow resting inside designated trigger zones
//or within 4 meters of a campfire.
const int H2_REQUIRE_REST_TRIGGER_OR_CAMPFIRE = FALSE;

//The tag of the campfire placeable to be used.
const string H2_CAMPFIRE = "h2_campfire";
//End of user configurable constant declarations.

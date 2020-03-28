/*
Filename:           h2_bleedsystem_c
System:             bleed system (user configuration script)
Author:             Edward Beck (0100010)
Date Created:       Oct. 15, 2005
Summary:

This script is consumed by h2_bleedsystem_i as an include directive.

Contains user definable toggles and settings for the bleed system.
Should contains include directives for additional files needed by the user,
and any _t scripts (text string definition scripts).

This script is freely editable by the mod builder. It should not contain any h2 functions that should
not be overrideable by the user, put those in h2_core_i or h2_bleedsystem_i.

Revision Info should only be included for post-release revisions.
-----------------
Revision Date: Aug. 30, 2006
Revision Author: Edward Beck
Revision Summary: v1.3
Added include reference to h2_bleedsystem_t

Revision Date: Dec. 31st, 2006
Revision Author: Edward Beck (0100010)
Revision Summary: v1.5
Changed bleed and stable delays to floats.
Made stable delay a more accurate default value for HoursToSeconds.


*/

//You may swap the below #include "hc2_bleedsystem_t" text directives for an equivalant language specific
//one. (All variable names must match however for it to compile properly.)
#include "h2_bleedsystem_t"

//All below functions and constants may be overriden by the user, but do not alter the function signature
//or the name of the constant.
//Begin function and constant declarations.

//Amount of time in seconds between when the player character bleeds while dying.
//Note this is seconds in real time, not game time.
//Recommend value: 6 seconds (1 heartbeat/round)
const float H2_BLEED_DELAY = 6.0;

//Amount of time in seconds between when a stable player character nexts checks to see if they begin to recover.
//Note this is seconds in real time, not game time.
//Recommended Equation: [Minutes per game hour] * 60 seconds = HoursToSeconds(1).
float H2_STABLE_DELAY = HoursToSeconds(1);

//Percent chance a player character will self stabilize and stop bleedng when dying.
//Range of values is 0 - 100
//Recommended value: 10 (as per 3.5 rules giving 10% chance)
const int H2_SELF_STABILIZE_CHANCE = 10;

//Percent chance a player character will regain conciousness and begin recovery after self-stabilizing.
//Range of values is 0 - 100
//Recommended value: 10 (as per 3.5 rules giving 10% chance)
const int H2_SELF_RECOVERY_CHANCE = 10;

//Amount of hitpoints lost when a player character bleeds.
//Recomended value: 1
const int H2_BLEED_BLOOD_LOSS = 1;

//Heal check DC to provide first aid to a dying charcater to stablize them.
//Default value is 15.
const int H2_FIRST_AID_DC = 15;

//Heal check DC to provide long term care to an injured character.
//Default value is 15.
const int H2_LONG_TERM_CARE_DC = 15;
//End function and constant declarations.

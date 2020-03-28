/*
Filename:           ds_htf_killtimer
System:             DS HTF subsystem
Author:             Edward Burke (tinygiant)
Date Created:       20200126
Summary:
This script is consumed by a timer set to determine whether a creature
is re-entering an area which has a travel cost for which the creature has
recently paid.

Revision Info should only be included for post-release revisions.
-----------------
Revision Date: 
Revision Author: 
Revision Summary: 

*/

#include "ds_htf_i"

void main()
{
    object oCreature = OBJECT_SELF;
    DeleteLocalString(oCreature, DKSN_HTF_LAST_TRAVEL_COST_PAID);
    h2_KillTimer(GetLocalInt(oCreature, DKSN_HTF_VARIABLE_KILLTIMER));
    DeleteLocalInt(oCreature, DKSN_HTF_VARIABLE_KILLTIMER);
}

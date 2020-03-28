/*
Filename:           ds_htf_area_oent
System:             DS HTF subsystem
Author:             Edward Burke (tinygiant)
Date Created:       20200126
Summary:
This script should be run on area entry and listed in the variables for each area as follows:
    variable:   OnAreaEntry#
    type:       string
    value:      ds_htf_area_oent

Revision Info should only be included for post-release revisions.
-----------------
Revision Date: 
Revision Author: 
Revision Summary: 

*/

#include "ds_htf_i"

//When entering an travel area, the PC may be required to pay a travel cost, which is borne by
//  a reducation in HTF capacity.  This script creates a timer on the entering object to allow
//  that to happen.  The purpose of waiting a designated interval is to ensure the PC didn't
//  enter the area on accident, thus allowing the PC to return to the previous area before the
//  timer expires and without incurring the travel cost.

//If the creature has paid a travel cost and then enteres a populated area with no designated travel
//  cost, a timer is created to ensure the PC can return to the previous area in which the creature
//  already paid the travel cost without incurring another travel cost, as long as the PC returns
//  to that area before the timer expires.

void main()
{
    object oCreature = GetEnteringObject();
    if (GetIsDM(oCreature)) return;

    int nAreaType = GetLocalInt(GetArea(oCreature), DKSN_HTF_VARIABLE_AREATYPE);
    string sAreaPaid = GetLocalString(oCreature, DKSN_HTF_LAST_TRAVEL_COST_PAID);

    if(GetIsPC(oCreature))
    {
        string sPCMessage = ds_GetAreaTravelMessage(nAreaType);
        if (sPCMessage != "") 
            SendMessageToPC(oCreature, sPCMessage);
    }

    if (sAreaPaid == GetTag(GetArea(oCreature))) 
    {
        ExecuteScript(DKSN_HTF_KILLTIMER_SCRIPT, oCreature);
        return;
    }

    if (ds_GetAreaTravelCost(nAreaType) > 0) ds_CreateAreaTravelTimer(oCreature);
        else if(sAreaPaid != "")
        {
            int nTimerID = h2_CreateTimer(oCreature, DKSN_HTF_KILLTIMER_SCRIPT, DKSN_HTF_AREATRAVELCOST_DELAY, FALSE, 1);
            SetLocalInt(oCreature, DKSN_HTF_VARIABLE_KILLTIMER, nTimerID);
            h2_StartTimer(nTimerID);
        }
}

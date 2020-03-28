/*******************************************************************************
* Description:  OnEnter script for Dark Sun module areas.
  Usage:        This script should be added to all areas in the area's variables
                as follows:

                variable name:  OnAreaExit#
                variable type:  string
                variable value: ds_htf_area_oext

********************************************************************************
* Created By:   tinygiant
* Created On:   20200125
*******************************************************************************/

#include "ds_htf_i"

//PCs entering non-populated areas may incur a travel cost.  This cost is charged through use
//  of a timer instantiated when a PC enters a travel area.  If the PC departs the travel area
//  before the timer expires, the PC is not charged for travelling in that area.  This function
//  kills the travel cost timer to ensure the PC is not charged.

void main()
{
    object oCreature = GetExitingObject();
    if (GetIsDM(oCreature)) return;

    int nAreaType = GetLocalInt(GetArea(oCreature), DKSN_HTF_VARIABLE_AREATYPE);
    
    if (GetLocalInt(oCreature, DKSN_HTF_VARIABLE_AREATIMER) > 0) ds_DestroyAreaTravelTimer(oCreature);
    if (GetLocalInt(oCreature, DKSN_HTF_VARIABLE_KILLTIMER) > 0) h2_KillTimer(GetLocalInt(oCreature, DKSN_HTF_VARIABLE_KILLTIMER));
}

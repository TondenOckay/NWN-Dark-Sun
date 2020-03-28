/*
Filename:           ds_htf_assoc_add
System:             DS HTF subsystem (hook associate script)
Author:             Edward Burke (tinygiant)
Date Created:       20200212
Summary:
This script will be run anytime an associate is obtained.  Individual associate
    types can be selected in the configuration script ds_htf_c.

Revision Info should only be included for post-release revisions.
-----------------
Revision Date: 
Revision Author: 
Revision Summary: 

*/

#include "ds_htf_i"
#include "h2_fatigue_i"
#include "h2_hungerthrst_i"

void _initAssociate(object oAssociate)
{
    if(!GetIsPC(oAssociate) && GetIsPC(GetMaster(oAssociate)))
    {    
        h2_InitFatigueCheck(oAssociate);
        h2_InitHungerThirstCheck(oAssociate);

        float fThirst = GetLocalFloat(oAssociate, H2_HT_CURR_THIRST) * 100.0;
        float fHunger = GetLocalFloat(oAssociate, H2_HT_CURR_HUNGER) * 100.0;
        float fFatigue = GetLocalFloat(oAssociate, H2_CURR_FATIGUE) * 100.0;

        ds_DisplayAssociateHTFValues(oAssociate, fThirst, fHunger, fFatigue);
    }
}

void main()
{
    object oAssociate = OBJECT_SELF;
    
    if(GetIsPC(GetMaster(oAssociate)))
        DelayCommand(0.2, _initAssociate(oAssociate));
}

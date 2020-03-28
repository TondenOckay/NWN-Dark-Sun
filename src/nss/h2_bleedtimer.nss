/*
Filename:           h2_bleedtimer
System:             bleed system (timer hook-in script)
Author:             Edward Beck (0100010)
Date Created:       Oct. 15, 2005
Summary:
Called via ExecuteScript as a timer that is created and started when the h2_bleedsysopd
script is fired. Simulates blood loss for a dying player character.

Revision Info should only be included for post-release revisions.
-----------------
Revision Date:
Revision Author:
Revision Summary:

*/

#include "h2_bleedsystem_i"

void main()
{
    object oPC = OBJECT_SELF;
    int nPlayerState = h2_GetPlayerPersistentInt(oPC, H2_PLAYER_STATE);
    if (nPlayerState != H2_PLAYER_STATE_DYING && nPlayerState != H2_PLAYER_STATE_STABLE &&
        nPlayerState != H2_PLAYER_STATE_RECOVERING)
    {
        int nTimerID = GetLocalInt(oPC, H2_BLEED_TIMER_ID);
        DeleteLocalInt(oPC, H2_BLEED_TIMER_ID);
        DeleteLocalInt(oPC, H2_TIME_OF_LAST_BLEED_CHECK);
        h2_KillTimer(nTimerID);
    }
    else
    {
        int nCurrHitPoints = GetCurrentHitPoints(oPC);
        if (nCurrHitPoints > 0)
        {
            h2_MakePlayerFullyRecovered(oPC);
            return;
        }
        int nLastHitPoints = GetLocalInt(oPC, H2_LAST_HIT_POINTS);
        if (nCurrHitPoints > nLastHitPoints)
        {
            h2_StabilizePlayer(oPC);
            return;
        }
        if (nCurrHitPoints > -10)
        {
            h2_CheckForSelfStabilize(oPC);
        }
        else
        {
            h2_SetPlayerPersistentInt(oPC, H2_PLAYER_STATE, H2_PLAYER_STATE_DEAD);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oPC);
        }
    }
}

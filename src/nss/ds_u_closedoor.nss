#include "ds_constants_i"

void main()

{
    object oDoor = OBJECT_SELF;
    
    float fUniversalDelay = DKSN_DOOR_CLOSE_DELAY;
    float fLocalDelay = GetLocalFloat(oDoor, "close_delay");

    DelayCommand(fLocalDelay > 0.0 ? fLocalDelay : fUniversalDelay, ActionCloseDoor(oDoor));
}


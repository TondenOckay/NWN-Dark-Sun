/*
Filename:           h2_prestroot_s
System:             core (rest conversation starting conditional script)
Author:             Edward Beck (0100010)
Date Created:       Jan. 31, 2006
Summary:

This script is attached as a starting conditional script to the h2_prestmenuconv dialog.
It is run on the first node and always returns true.
It sets some custom tokens to their default value which represent the text
to be displayed on the root dialog and on the last "don't rest" option.
It also initilizes the token index counter to 1.

Revision Info should only be included for post-release revisions.
-----------------
Revision Date:
Revision Author:
Revision Summary:

*/
#include "h2_core_i"

int StartingConditional()
{
    SetCustomToken(2147483629, H2_TEXT_PC_REST_CONV_ROOT_NODE);
    SetCustomToken(2147483630, H2_TEXT_PC_REST_CONV_DONT_REST);
    SetLocalInt(GetPCSpeaker(), H2_CURRENT_TOKEN_INDEX, 1);
    return TRUE;
}

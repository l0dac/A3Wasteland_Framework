//
// Farooq's Revive 1.5
//

//------------------------------------------//
// Parameters - Feel free to edit these
//------------------------------------------//

// Seconds until unconscious unit bleeds out and dies. Set to 0 to disable.
FAR_BleedOut = 600;

// Enable teamkill notifications
FAR_EnableDeathMessages = true;

// If enabled, unconscious units will not be able to use radios, hear other people or use proximity chat
FAR_MuteRadio = false;

/*
	0 = Only medics can revive
	1 = All units can revive
	2 = Same as 1 but a medikit is required to revive
*/
FAR_ReviveMode = 0;

//------------------------------------------//

call compile preprocessFile "FAR_revive\FAR_revive_funcs.sqf";

#define SCRIPT_VERSION "1.5"

FAR_isDragging = false;
FAR_isDragging_EH = [];
FAR_deathMessage = [];
FAR_Debugging = true;
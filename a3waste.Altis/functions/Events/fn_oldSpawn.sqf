/*
	File: fn_oldSpawn.sqf
	Author:

	Description:
		Passing Info to Player Setup
	Parameters:
	   0: ARRAY [loadout, position]
*/


waitUntil {(isPlayer player)};

hint "";
//player enableFatigue false;

_loadout = _this select 0;
_pos = _this select 1;
_dir = _this select 2;

preloadCamera _pos;
[_loadout] spawn client_fnc_playerSetup;
player setDir _dir;
player setPosWorld _pos;


player setvariable ["SAVE_ALLOWED", true, true];
player setvariable ["enableDamageEH", true, true];

cutText ["", "BLACK IN"];

if (isNil "run_welcomeMessage") then
{
	run_welcomeMessage = false;
	[] spawn client_fnc_welcomeMessage;
};
_action = [format ["<img image='a3\ui_f\data\gui\Rsc\RscDisplayArcadeMap\icon_debug_ca.paa' color='%1'/> Player Settings", "#FF8000"], "createDialog 'playersettings'", [], -10, false];
playerMenuID = player addAction _action;

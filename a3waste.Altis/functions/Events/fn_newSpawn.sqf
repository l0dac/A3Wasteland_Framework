/*
	File: fn_newSpawn.sqf
	Author:

	Description:
		Heli Spawn, moves player into heli + loads dialog.
	Parameters:
	   0: ARRAY loadout
	   1: ARRAY helis
*/

#define waste_spawn_DIALOG 		1000

_this spawn {
	disableSerialization;

	player setvariable ["SAVE_ALLOWED", false, true];
	player setvariable ["enableDamageEH", false, true];

	_loadout = _this select 0;
	_heli = (_this select 1) call BIS_fnc_selectRandom;

	9999 cutText [localize "STR_Loading", "BLACK"];
	[_loadout] call client_fnc_playerSetup;

	[] call spawn_fnc_createDialog;

	_para = false;

	_minDistance = 0;
	_maxDistance = 300;
	_minDistanceObj = 5;

	switch (player getVariable "waste_spawnType") do {
		case 1:
		{	// TOWN SPAWN
			_pos = player getVariable "waste_spawnPos";
			_pos = [_pos,
					_minDistance,		// Min Distance
					_maxDistance,		// Max Distance
					_minDistanceObj,	// Min Distance from object
					0,					// No Water
					2000,				// Terrain Gradient
					0					// Can be at shore
					] call BIS_fnc_findSafePos;
					// TODO if position == [0,0,0] default action == Heli Spawn above location
			_pos pushback 1000;

			player setDir (random 360);
			player setPosWorld _pos;
			_para = true;
		};
		case 2:
		{	// BEACON SPAWN  ++ AIRDROP
			_pos = player getVariable "waste_spawnPos";
			_pos = [((pos select 0) + (random 100)), ((pos select 1) + (random 100)), ((pos select 2) + (random 100))];

			player setDir (random 360);
			player setPosWorld _pos;

			_para = true;
		};
		default
		{	// RANDOM SPAWN
			_pos = position (all_locations call BIS_fnc_selectRandom);
			_pos = [_pos,
					_minDistance,
					_maxDistance,
					_minDistanceObj,
					0,
					2000,
					0
					] call BIS_fnc_findSafePos;
			_pos pushback 1000;
			_para = true;
					// TODO if position == [0,0,0] default action == Heli Spawn above location

			player setDir (random 360);
			player setPosWorld _pos;
		};
	};

	sleep 0.3;

	player setvariable ["SAVE_ALLOWED", true, true];
	player setvariable ["enableDamageEH", true, true];

	9999 cutText ["", "BLACK IN"];
	if (isNil "run_welcomeMessage") then
	{
		run_welcomeMessage = false;
		[] spawn client_fnc_welcomeMessage;
	};

	_action = [format ["<img image='a3\ui_f\data\gui\Rsc\RscDisplayArcadeMap\icon_debug_ca.paa' color='%1'/> Player Settings", "#FF8000"], "createDialog 'playersettings'", [], -10, false];
	playerMenuID = player addAction _action;

	if (_para) then
	{
		waitUntil {((vehicle player) == player)};
		call client_fnc_playerParachute;
	};
};
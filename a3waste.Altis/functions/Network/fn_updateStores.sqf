/*
	File: fn_updateClientID.sqf
	Author:

	Description:
		Used to generate Unique PEV for client, based on ClientID.
			Avoids any race condition when assign value before it gets broadcasted to specfic client
	Parameters:
		0: ClientID
*/

private ["_clientID"];

_npcArrays = _this select 0;

if (!(isNil "store_npcs")) then
{
	{
		removeAllActions _x;
	} forEach store_npcs;
};

store_npcs = [];

{
	_npc = _x select 0;
	_face = _x select 1;
	_type = _x select 2;

	_npc setFace _face;

	store_npcs pushback _npc;

	switch (_type) do
	{
		case "General":
		{
			_npc addAction ["<img image='a3\ui_f\data\gui\RscCommon\RscDebugConsole\feedback_ca.paa'/> General Store", storeGeneral_fnc_createDialog, [_type], 1, true, true, "", "(player distance _target < 3)"];
		};
		case "Weapons":
		{
			_npc addAction ["<img image='a3\ui_f\data\gui\RscCommon\RscDebugConsole\feedback_ca.paa'/> Gun Store", storeWeapons_fnc_createDialog, [_type], 1, true, true, "", "(player distance _target < 3)"];
		};
		case "Vehicles":
		{
			_npc addAction ["<img image='a3\ui_f\data\gui\RscCommon\RscDebugConsole\feedback_ca.paa'/> Vehicle Store", storeVehicles_fnc_createDialog, [_type], 1, true, true, "", "(player distance _target < 3)"];
		};
	};

} forEach _npcArrays;
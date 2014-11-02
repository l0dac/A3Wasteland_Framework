/*
	File: fn_updateCheckPlayers.sqf
	Author: Declan Ireland

	Description:
		0 Checks All Players if Inventory been opened / closed. Saves Player data
		1 All Players data is saved.

	Parameters:
		0: INTEGER (0 = Soft Update, 1 = Hard Update)
*/


private ["_mode"];

_mode = [_this,0,0,[0]] call BIS_fnc_param;



playerUpdateInProgress = true;

switch (_mode) do
{
	case 0: // Soft Update, only Players that have opened / closed inventory
	// TODO Add Players that had their backpack etc opened to this list  (container eventhandlers)
	{
		{
			diag_log format["SOFT UPDATE CHECK: _x: %1", _x];
			if (isPlayer _x) then
			{
				if (_x getvariable ["SAVE_ALLOWED", false]) then
				{
					sleep 0.1;
					if (!(isNil {_x getVariable "inventoryOpen_Timestamp"})) then
					{
						[_x] call serverEvents_fnc_inventoryOpened; //Incase Player has left Inventory Window Open
					};

					if ((_x getVariable ["updateInventory", false])) then
					{
						diag_log "UPDATING PLAYER INV";
						[_x, (getPlayerUID _x)] call extDB_fnc_updatePlayerAll;
						_x setVariable ["updateInventory", false];
					};
				};
			};
		} forEach playableUnits;
	};

	case 1: // Hard Update, all Players
	{
		_diag_tickTime = diag_tickTime;
		{
			diag_log format["HARD UPDATE CHECK: _x: %1", _x];
			if (isPlayer _x) then
			{
				if (_x getvariable ["SAVE_ALLOWED", false]) then
				{
					sleep 0.1;
					// Updating timestamp if player still has inventory opened
					if (!(isNil {_x getVariable "inventoryOpen_Timestamp"})) then
					{
						_x setVariable["inventoryOpen_Timestamp", diag_tickTime];
					};

					// Reseting updateInventory value
					_x setVariable ["updateInventory", false];

					diag_log "UPDATING PLAYER";
					[_x, (getPlayerUID _x)] call extDB_fnc_updatePlayerAll;
				};
			};
		} forEach playableUnits;
	};
};

playerUpdateInProgress = false;
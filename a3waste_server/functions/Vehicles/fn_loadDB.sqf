/*
	File: loadDB.sqf
	Orignal Authors: JoSchaap, AgentRev, Austerror
	Authors: Declan Ireland

	Description:

	Parameters:

	Changelog:
		Based off modified oLoad.sqf + functions.sqf for A3Wasteland + extDB

*/

{
	_db_id = _x select 0;

	_class = _x select 1;
	_pos = _x select 2;
	_dir = _x select 3;

	_damage = _x select 5;
	_allowDamage = _x select 6;
	_variables = _x select 7;


	_obj = createVehicle [_class, _pos, [], 0, "CAN_COLLIDE"];

	serverVehicles pushback _obj;

	clearWeaponCargoGlobal _obj;
	clearMagazineCargoGlobal _obj;
	clearItemCargoGlobal _obj;
	clearBackpackCargoGlobal _obj;

	_obj setPosATL _pos;
	if (!isNil "_dir") then
	{
		_obj setVectorDirAndUp _dir;
	};

	_obj setVariable ["db_id", _db_id];
	//_obj setVariable ["objectLocked", true, true]; // force lock

	if (_allowDamage > 0) then
	{
		_obj setDamage _damage;
		//_obj setVariable ["allowDamage", true];
	}
	else
	{
		_obj allowDamage false;
	};


	if {_class isKindOf "ReammoBox_F"} then
	{
		_weapons = _x select 8;
		_magazines = _x select 9;
		_items = _x select 10;
		_backpacks = _x select 11;
		if (typename _weapons == "ARRAY") then
		{
			{ _obj addWeaponCargoGlobal _x } forEach _weapons;
		};
		if (typename _magazines == "ARRAY") then
		{
			{ _obj addMagazineCargoGlobal _x } forEach _magazines;
		};
		if (typename _items == "ARRAY") then
		{
			{ _obj addItemCargoGlobal _x } forEach _items;
		};
		if (typename _backpacks == "ARRAY") then
		{
			{
				if !((_x select 0) isKindOf "Weapon_Bag_Base") then
				{
					_obj addBackpackCargoGlobal _x;
				};
			} forEach _backpacks;
		};
	};

	_unlock = switch (true) do
	{
/*
		case (_obj call _isBeacon):
		{
			pvar_spawn_beacons pushBack _obj;
			publicVariable "pvar_spawn_beacons";
			true
		};
*/
		default { false };
	};

	if (_unlock) exitWith
	{
		//_obj setVariable ["objectLocked", false, true];
	};

	if {_class isKindOf "StaticWeapon"} then
	{
		_turretMags = _x select 12;

		if (!isNil "_turretMags") then
		{
			_obj setVehicleAmmo 0;
			{ _obj addMagazine _x } forEach _turretMags;
		};
	};

	_ammoCargo = _x select 13;
	_fuelCargo = _x select 14;
	_repairCargo = _x select 15;

	_obj setAmmoCargo _ammoCargo;
	_obj setFuelCargo _fuelCargo;
	_obj setRepairCargo _repairCargo;

} forEach ([format["getAllServerObjects:%1", call(waste_server_mapID)], 2, true] call extDB_fnc_async);
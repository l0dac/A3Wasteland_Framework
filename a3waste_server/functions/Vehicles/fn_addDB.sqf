/*
	File: fn_new.sqf
	Authors: Declan Ireland

	Description:

	Parameters:

*/


_obj = _this select 0;

serverVehicles pushback _obj;

// Getting Info
_class = typeOf _obj;
_pos = getPosATL _obj;
_dir = [vectorDir _obj, vectorUp _obj];
_damage = damage _obj;
_allowDamage = if (_obj getVariable ["allowDamage", false]) then { 1 } else { 0 };

_weapons = getWeaponCargo _obj;
_magazines = getMagazineCargo _obj;
_items = getItemCargo _obj;
_backpacks = getBackpackCargo _obj;

_variables = []; // TODO
_turretMags = magazinesAmmo _obj;

_ammoCargo = getAmmoCargo _obj;
if !(_ammoCargo >= 0) then
{
	_ammoCargo = 0;
};

_fuelCargo = getFuelCargo _obj;
if !(_fuelCargo >= 0) then
{
	_fuelCargo = 0;
};

_repairCargo = getRepairCargo _obj;
if !(_repairCargo >= 0) then
{
	_repairCargo = 0;
};

_dbID = (["insertServerVehicle:" +
									str(call(waste_server_mapID)) + ":" +
									str(_class) + ":" +
									str(_pos) + ":" +
									str(_dir) + ":" +
									str(_damage) + ":" +
									str(_allowDamage) + ":" +
									str(_variables) + ":" +
									str(_weapons) + ":" +
									str(_magazines) + ":" +
									str(_items) + ":" +
									str(_backpacks) + ":" +
									str(_turretmags) + ":" +
									str(_ammoCargo) + ":" +
									str(_fuelCargo) + ":" +
									str(_repairCargo),2] call extDB_Database_async) select 0;

_obj setVariable ["db_id", _dbID];
/*
	File: init_server.sqf
	Authors: Declan Ireland

	Description:

	Parameters:

*/

waitUntil {sleep 0.01; (!isnil "bis_fnc_init")};

_worldName = worldName;

// Load Default Settings
[] call compile preprocessFile "waste_server\configs\default_config.sqf";

_extDB = false;
_extDB = [] call compile preprocessfilelinenumbers "waste_server\init\extDB\init.sqf";

if (!_extDB) exitWith
{
	server_status = false;
	publicVariable "server_status";

	diag_log "extDB: Failed to Load";
};


//TODO ADD Code to Load Settings from Database if exists


// RealTime
if (call(waste_realTime)) then
{
	_dateTime = ([format ["TIME:%1", 0],2] call extDB_fnc_async_misc);
	setDate _dateTime;
};

// TODO ADD Code to Load Vehicles / Objects from Database

_objCount = 0;
_vehCount = 0;
_buildings = [];
_roads = [];

serverObjects = [];
serverVehicles = [];

_map_size = 1000000;
_pos_center = getMarkerPos "center";
if ( ((call(waste_spawnObjects)) > 0) || (call(waste_spawnLoot)) || ((call(waste_spawnVehicles)) > 0) ) then
{
	_buildings = _pos_center nearObjects ["building", _map_size];
	_roads = _pos_center nearRoads _map_size;
};

// Loot Initialize
if (call(waste_spawnLoot)) then
{
	[_worldName, _pos_center, _map_size, _buildings, _roads, _objCount] call compile preprocessfilelinenumbers "waste_server\init\Loot\init.sqf";
};
if ((call(waste_spawnObjects)) > 0) then
{
	[_worldName, _pos_center, _map_size, _buildings, _roads, _objCount] call compile preprocessfilelinenumbers "waste_server\init\Spawn\Objects\init.sqf";
};
if ((call(waste_spawnVehicles)) > 0) then
{
	[_worldName, _pos_center, _map_size, _buildings, _roads, _vehCount] call compile preprocessfilelinenumbers "waste_server\init\Spawn\Vehicles\init.sqf";
};

// TODO Custom Player Spawn Methods

// Zones
zone_update = false;

// Stores
[_worldName] call compile preprocessfilelinenumbers "waste_server\init\Stores\init.sqf";

// Objects Spawning
[_worldName] call compile preprocessfilelinenumbers "waste_server\init\Loot\init.sqf";

// Vehicles Spawning
[_worldName] call compile preprocessfilelinenumbers "waste_server\init\Loot\init.sqf";


// EventHandlers
addMissionEventHandler ["HandleDisconnect",{_this call serverEvents_fnc_handleDisconnect; false}];

"client_inventoryOpen" addPublicVariableEventHandler
	{diag_log str(_this); (_this select 1) spawn serverEvents_fnc_inventoryOpened};

"client_inventoryClosed" addPublicVariableEventHandler
	{diag_log str(_this); (_this select 1) spawn serverEvents_fnc_inventoryClosed};

"client_onPlayerKilled" addPublicVariableEventHandler
	{diag_log str(_this); (_this select 1) spawn serverEvents_fnc_onKilled};

"client_onPlayerSpawn" addPublicVariableEventHandler
	{diag_log str(_this); (_this select 1) spawn serverEvents_fnc_onSpawn};

sleep 0.01;

// Broadcast Public Server Settings
thirdPersonView = call(waste_thirdPersonView);
publicVariable "thirdPersonView";

server_status = true;
publicVariable "server_status";

[] execFSM "waste_server\init\server.fsm";
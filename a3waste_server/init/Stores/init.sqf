/*
	File: init.sqf
	Orig Author: AgentRev
	Authors: Declan Ireland

	Description:

	Parameters:

	Changelog:
		setupAITrader based off setupStoreNPC.sqf from AgentRev

*/

private ["_init_data", "_zone_positions", "_marker", "_east_trigger", "_west_trigger", "_guer_trigger"];


_setupAITrader =
{
	_npc = _this select 0;
	_objectInfo = _this select 1;

	_npc allowDamage false;

	_npc disableAI "MOVE";
	_npc disableAI "FSM";
	_npc disableAI "TARGET";
	_npc disableAI "AUTOTARGET";

	// TODO Find out why this is not working
	_building = nearestBuilding _npc;
	_building allowDamage true;

	_class = typeOf _building;
	_hitPoints = "true" configClasses (configfile >> "CfgVehicles" >> _class >> "HitPoints");
	{
		_hitPointName = configName _x;
		_found = (["Glass", _hitPointName, false] call BIS_fnc_inString);
		if (_found) then
		{
			_building setHit [_hitPointName, 1];
		};
	} forEach _hitPoints;

	_building allowDamage false;

	removeAllWeapons _npc;
	removeBackpack _npc;

	{
		_objectClass = _x select 0;
		_objectPos = _x select 1;
		_objectDir = _x select 2;

		_object = _objectClass createVehicle _objectPos;
		_object setPos _objectPos;
		_object setDir _objectDir;

		switch (_objectClass) do
		{
			case "Land_CashDesk_F":
			{

			};

			default
			{

			};
		};
	} forEach _objectInfo;

	_faces = "getText (_x >> 'texture') != ''" configClasses (configFile >> "CfgFaces" >> "Man_A3");
	_faces deleteRange [0,2];
	_face = configName (_faces call BIS_fnc_selectRandom);
	_face
};



_worldname = _this select 0;
_init_data = call compile preprocessFile format["waste_server\world\%1\%2\stores.sqf", _worldname, (call waste_mapMode)];

_storeGeneral_npcInfo  = (_init_data select 0) select 0;
_storeWeapons_npcInfo  = (_init_data select 1) select 0;
_storeVehicles_npcInfo = (_init_data select 2) select 0;


_storeGeneral_objectInfo  = (_init_data select 0) select 1;
_storeWeapons_objectInfo = (_init_data select 1) select 1;
_storeVehicles_objectInfo = (_init_data select 2) select 1;

_zone_positions = [];

store_markers = [];
store_npcs = [];

zone_counters = [];
zone_markers = [];
zone_update = false;

_logic =  createGroup sideLogic;

// General Store
{
	diag_log format ["STORE: %1", _x];
	// Create Unit
	_npcPos = (_x select 0);
	_npcDir = (_x select 1);
	_npcType = (_x select 2);
	_npcDisableOptions = (_x select 3);

	_unit = _logic createUnit ["C_man_1_1_F", _npcPos, [], 0, "NONE"]; // TODO Init Logic Code
	sleep 1;
	_unit setPos _npcPos;
	_unit setDir _npcDir;
	_face = [_unit, (_storeGeneral_objectInfo select _forEachIndex)] call _setupAITrader;

	store_npcs pushBack [_unit, _face, "General"];

	// Create Map Marker

	_markerName = format["marker_storeGeneral_%1", _forEachIndex];
	_marker = createMarker [_markerName, _npcPos];

	_zone_positions pushBack _npcPos;
	store_markers pushBack _marker;

	_markerName setMarkerShape "ICON";
	_markerName setMarkerType "mil_dot";
	_markerName setMarkerColor "ColorBlack";
	_markerName setMarkerSize [1,1];
	_markerName setMarkerText "General Store";
} forEach _storeGeneral_npcInfo;

// Weapons Store
{
	diag_log format ["STORE: %1", _x];
	// Create Unit
	_npcPos = (_x select 0);
	_npcDir = (_x select 1);
	_npcType = (_x select 2);
	_npcDisableOptions = (_x select 3);

	_unit = _logic createUnit ["C_man_1_1_F", _npcPos, [], 0, "NONE"]; // TODO Init Logic Code
	_unit setPos _npcPos;
	_unit setDir _npcDir;
	_face = [_unit, (_storeWeapons_objectInfo select _forEachIndex)] call _setupAITrader;

	store_npcs pushBack [_unit, _face, "Weapons"];

	// Create Map Marker

	_markerName = format["marker_storeWeapons_%1", _forEachIndex];
	_marker = createMarker [_markerName, _npcPos];

	_zone_positions pushBack _npcPos;
	store_markers pushBack _marker;

	_markerName setMarkerShape "ICON";
	_markerName setMarkerType "mil_dot";
	_markerName setMarkerColor "ColorBlack";
	_markerName setMarkerSize [1,1];
	_markerName setMarkerText "Weapons Store";
} forEach _storeWeapons_npcInfo;

// Vehicles Store
{
	diag_log format ["STORE: %1", _x];
	// Create Unit
	_npcPos = (_x select 0);
	_npcDir = (_x select 1);
	_npcType = (_x select 2);
	_npcDisableOptions = (_x select 3);

	_unit = _logic createUnit ["C_man_1_1_F", _npcPos, [], 0, "NONE"]; // TODO Init Logic Code
	_unit setPos _npcPos;
	_unit setDir _npcDir;
	_face = [_unit, (_storeVehicles_objectInfo select _forEachIndex)] call _setupAITrader;

	store_npcs pushBack [_unit, _face, "Vehicles"];

	// Create Map Marker

	_markerName = format["marker_storeVehicles_%1", _forEachIndex];
	_marker = createMarker [_markerName, _npcPos];

	_zone_positions pushBack _npcPos;
	store_markers pushBack _marker;

	_markerName setMarkerShape "ICON";
	_markerName setMarkerType "mil_dot";
	_markerName setMarkerColor "ColorBlack";
	_markerName setMarkerSize [1,1];
	_markerName setMarkerText "Vehicle Store";
} forEach _storeVehicles_npcInfo;



{
	zone_counters = zone_counters + [[0,0,0]];

	_pos = _x;

	_triggerX = 150;
	_triggerY = 150;

	_marker = createMarker[("capture_" + str(_forEachIndex)), (_pos)];
	_marker setMarkerShape "ELLIPSE";
	_marker setMarkerSize [_triggerX, _triggerY];
	_marker setMarkerDir 0;
	_marker setMarkerBrush "Solid";
	_marker setMarkerAlpha 0.7;



	zone_markers = zone_markers + [_marker];

	// EAST TRIGGER
	_east_trigger = createTrigger["EmptyDetector", _pos];
	_east_trigger setTriggerArea[_triggerX, _triggerY, 0, false];
	_east_trigger setTriggerActivation["EAST", "PRESENT", true];
	_east_trigger setTriggerStatements["this",

			// Activation
		"hint str(1); _counter = zone_counters select " +str(_forEachIndex)+ "; _counter set [0,((zone_counters select " +str(_forEachIndex)+ ") select 0) + 1]; zone_counters set[" +str(_forEachIndex)+ ", _counter]; zone_update = true;",

			// Deactivation
		"_counter = zone_counters select " +str(_forEachIndex)+ "; _counter set [0,((zone_counters select " +str(_forEachIndex)+ ") select 0) - 1]; zone_counters set[" +str(_forEachIndex)+ ", _counter]; zone_update = true;"];

	// WEST TRIGGER
	_west_trigger = createTrigger["EmptyDetector", _pos];
	_west_trigger setTriggerArea[_triggerX, _triggerY, 0, false];
	_west_trigger setTriggerActivation["WEST", "PRESENT", true];
	_west_trigger setTriggerStatements["this",

			// Activation
		"hint str(2); _counter = zone_counters select " +str(_forEachIndex)+ "; _counter set [1,((zone_counters select " +str(_forEachIndex)+ ") select 1) + 1]; zone_counters set[" +str(_forEachIndex)+ ", _counter]; zone_update = true;",

			// Deactivation
		"_counter = zone_counters select " +str(_forEachIndex)+ "; _counter set [1,((zone_counters select " +str(_forEachIndex)+ ") select 1) - 1]; zone_counters set[" +str(_forEachIndex)+ ", _counter]; zone_update = true;"];

	// GUER TRIGGER
	_guer_trigger = createTrigger["EmptyDetector", _pos];
	_guer_trigger setTriggerArea[_triggerX, _triggerY, 0, false];
	_guer_trigger setTriggerActivation["GUER", "PRESENT", true];
	_guer_trigger setTriggerStatements["this",

		// Activation
		"hint str(3); _counter = zone_counters select " +str(_forEachIndex)+ "; _counter set [2,((zone_counters select " +str(_forEachIndex)+ ") select 2) + 1]; zone_counters set[" +str(_forEachIndex)+ ", _counter]; zone_update = true;",
		// Deactivation
		"_counter = zone_counters select " +str(_forEachIndex)+ "; _counter set [2,((zone_counters select " +str(_forEachIndex)+ ") select 1) - 1]; zone_counters set[" +str(_forEachIndex)+ ", _counter]; zone_update = true;"
		];

} forEach _zone_positions;

// Add EventHandlers for Stores

"client_buyItem" addPublicVariableEventHandler
	{diag_log str(_this); (_this select 1) spawn serverEvents_fnc_buyItem};

"client_buyVehicle" addPublicVariableEventHandler
	{diag_log str(_this); (_this select 1) spawn serverEvents_fnc_buyVehicle};
/*
	File: init.sqf
	Authors: Declan Ireland

	Description:

	Parameters:

*/


_return = false;

if ( isNil {uiNamespace getVariable "waste_server_extDB_ID"}) then
{
	_result = "extDB" callExtension "9:VERSION";

	diag_log format ["extDB: Version: %1", _result];
	if(_result == "") exitWith {diag_log "extDB: Failed to Load"; false};
	if ((parseNumber _result) < 20) exitWith {diag_log "Error: extDB version 20 or Higher Required";};

	_result = call compile ("extDB" callExtension "9:DATABASE:A3Waste");

	if (_result select 0 == 0) exitWith {diag_log format ["extDB: Error Database: %1", _result]; false};
	diag_log "extDB: Connected to Database";

	waste_server_extDB_ID = compileFinal str(round(random(999999)));
	waste_server_extDB_miscID = compileFinal str ((call(waste_server_extDB_ID)) + 1);

	_result = call compile ("extDB" callExtension ("9:ADD:DB_CUSTOM_V3:" + str(call waste_server_extDB_ID) + ":a3waste"));

	if (_result select 0 == 0) exitWith {diag_log format ["extDB: Error Database Setup: %1", _result]; false};
	diag_log "extDB: Initalized DB_Custom_V3 Protocol";

	_result = call compile ("extDB" callExtension ("9:ADD:MISC:" + str(call waste_server_extDB_miscID)));

	if (_result select 0 == 0) exitWith {diag_log format ["extDB: Error Misc Setup: %1", _result]; false};
	diag_log "extDB: Initalized Misc Protocol";

	"extDB" callExtension "9:LOCK";
	diag_log "extDB: Locked";

	uiNamespace setVariable ["waste_server_extDB_ID", str(call(waste_server_extDB_ID))];
	uiNamespace setVariable ["waste_server_extDB_miscID", str(call(waste_server_extDB_miscID))];

	_return = false;

	// Check if DB_CUSTOM File is compatiable with Database
	_result = (["checkDBVersion",2] call extDB_fnc_async) select 0;
	if (!_result) exitWith {
		diag_log "extDB: Error Incompatiable DB_CUSTOM File";
		false
	};

	// Check Database Info Table Version
	_dbVersion = (["getDBVersion",2] call extDB_fnc_async) select 0;
	if (_dbVersion != 7) exitWith {
		diag_log "extDB: Error Wrong Database Version";
		false
	};

	// Check for Server Instance
	_serverID_exists = ([format["existServerInstance:%1", call(waste_server_instanceID)],2] call extDB_fnc_async) select 0;
	if (!_serverID_exists) exitWith {
		diag_log format ["extDB: ServerID %1 doesn't exist in Database", call(waste_server_instanceID)];
		false
	};

	// Check Server Map is same as mission
	_serverMapID = ([format["getMapID:%1", call(waste_server_instanceID)],2] call extDB_fnc_async) select 0;
	waste_server_mapID = compileFinal str(_serverMapID);

	_return = true;
}
else
{
	waste_server_extDB_ID = compileFinal str(uiNamespace getVariable "waste_server_extDB_ID");
	waste_server_extDB_miscID = compileFinal str(uiNamespace getVariable "waste_server_extDB_miscID");
	diag_log "extDB: Already Setup";
	_return = true;
};

_return
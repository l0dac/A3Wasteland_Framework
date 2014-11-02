/*
	File: fn_dataGet.sqf
	Orig Author: AgentRev
	Authors: Declan Ireland

	Description:

	Parameters:
		0: Object / Classname

	Changelog:  Updated to use configClasses

*/


_class = _this;

if (typeName _class == "OBJECT") then
{
	_class = typeOf _class;
};

_parts = [];
{
	_parts pushBack (configName _x);
} forEach ("true" configClasses (configFile >> "CfgVehicles" >> _class >> "HitPoints"));

_parts
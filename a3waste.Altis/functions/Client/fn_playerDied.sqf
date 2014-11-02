/*
	File: fn_playerDied.sqf
	Author:

	Description:
		Get all kill notification nicely displayed in the left upper corner
	Parameters:
		NONE
*/

private["_victim","_killer","_distance","_killerWep","_weaponName","_killerVeh","_vehName"];

_victim = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_killer = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;

_distance = _killer distance _victim;
_distance = floor(_distance);

_killerWep = currentWeapon _killer;
_killerVeh = vehicle _killer;

if((_killer isKindOf "landVehicle") OR (_killer isKindOf "Ship") OR (_killer isKindOf "Air")) then {
_pic = getText(configFile >> "CfgVehicles" >> (typeOf _killerVeh) >> "picture");
}else{
_pic = gettext((configFile >> "CfgWeapons" >> _killerWep) >> "picture");
};

[] spawn {

		private ["_finaltxt"];
		_finaltxt = format ["<t align='left' size='0.9'>%1 </t><img size='1.0' align='left' image='%2'/><t align='left' size='0.9'> %3 </t><t align='left' size='0.9'>[%4m]</t>",_killer,_pic,_victim,_distance];
		[_finaltxt,[safezoneX + 0.01 * safezoneW,2.0],[safezoneY + 0.01 * safezoneH,0.3],30,0.5] spawn BIS_fnc_dynamicText;

};

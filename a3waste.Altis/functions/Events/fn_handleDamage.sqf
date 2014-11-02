//
// Farooq's Revive 1.5
//
//------------------------------------------//
// Parameters - Feel free to edit these
//------------------------------------------//

private ["_unit", "_killer", "_amountOfDamage", "_isUnconscious"];

_unit = _this select 0;
_hitPart = "";
_amountOfDamage = _this select 2;
_killer = _this select 3;

_enableDamageEH = _unit getVariable ["enableDamageEH", false];

if (_enableDamageEH) then {
	_isUnconscious = _unit getVariable ["FAR_isUnconscious", 0];
	if (alive _unit && _amountOfDamage >= 1 && _isUnconscious == 0) then
	{
		_unit setDamage 0;
		_unit allowDamage false;
		_amountOfDamage = 0;
		[_unit, _killer] spawn FAR_Player_Unconscious;
	};
};
_amountOfDamage
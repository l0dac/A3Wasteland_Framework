private ["_unit"];

_return = false;
_unit = _this;
_isMedic = getNumber (configfile >> "CfgVehicles" >> typeOf _unit >> "attendant");

if ( alive _unit && (isPlayer _unit || FAR_Debugging) && side _unit == FAR_PlayerSide && _unit getVariable "FAR_isUnconscious" == 0 && (_isMedic == 1 || FAR_ReviveMode > 0) ) then
{
	_return = true;
};

_return
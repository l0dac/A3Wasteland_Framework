if(count _this < 2) exitWith {};

_EH  = _this select 0;
_target = _this select 1;

// FAR_isDragging
if (_EH == "FAR_isDragging_EH") then
{
	_target setDir 180;
};

// FAR_deathMessage
if (_EH == "FAR_deathMessage") then
{
	_killed = _target select 0;
	_killer = _target select 1;

	if (isPlayer _killed && isPlayer _killer) then
	{
		systemChat format["%1 was injured by %2", name _killed, name _killer];
	};
};
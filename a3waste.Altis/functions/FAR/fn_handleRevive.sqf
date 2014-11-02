////////////////////////////////////////////////
// Revive Player
////////////////////////////////////////////////

private ["_target"];

_target = _this select 0;

if (alive _target) then
{
	player playMove "AinvPknlMstpSlayWrflDnon_medic";

	_target setVariable ["FAR_isUnconscious", 0, true];
	_target setVariable ["FAR_isDragged", 0, true];

	sleep 6;

	// [Debugging] Code below is only relevant if revive script is enabled for AI
	if (!isPlayer _target) then
	{
		_target enableSimulation true;
		_target allowDamage true;
		_target setDamage 0;
		_target setCaptive false;

		_target playMove "amovppnemstpsraswrfldnon";
	};

};
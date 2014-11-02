////////////////////////////////////////////////
// Stabilize Player
////////////////////////////////////////////////

private ["_target"];

_target = _this select 0;

if (alive _target) then
{
	player playMove "AinvPknlMstpSlayWrflDnon_medic";

	if (!("Medikit" in (items player)) ) then {
		player removeItem "FirstAidKit";
	};

	_target setVariable ["FAR_isStabilized", 1, true];

	sleep 6;
};
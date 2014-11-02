// Author KillzoneKid
// http://killzonekid.com/arma-scripting-tutorials-arrays-part-4-arrayshuffle/

private ["_el","_rnd"];
for "_i" from count _this - 1 to 0 step -1 do
{
	_el = _this select _i;
	_rnd = floor random (_i + 1);
	_this set [_i, _this select _rnd];
	_this set [_rnd, _el];
};
_this
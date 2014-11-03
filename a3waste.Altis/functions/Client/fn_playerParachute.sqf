/*
	File: fn_playerParachute.sqf
	Author:

	Description:
		Auto Deploys Parachute 75 Meters High
	Parameters:
		<NONE>
*/

waitUntil {(position player select 2) <= 75};
if (alive player) then
{
	_vel = velocity player;
	_pos = position player;
	_dir = direction player;
	_chute = createVehicle ["Steerable_Parachute_F", _pos, [], _dir, 'FLY'];
	_chute setPos _pos;
	_chute setDir _dir;
	_chute setVelocity _vel;
	player assignAsDriver _chute;
	player action ["GetInDriver",_chute];

	[player, _chute] spawn {
		private ["_player", "_chute"];
		_player = _this select 0;
		_chute = _this select 1;

		waitUntil {isTouchingGround player || (getPos _player select 2) < 1 && alive _player};
		if (alive _player) then {
			deleteVehicle _chute;
		};
	};
};
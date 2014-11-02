private ["_params", "_action"];

// Parameters passed by the action
_params = _this select 3;
_action = _params select 0;

////////////////////////////////////////////////
// Handle actions
////////////////////////////////////////////////
if (_action == "action_revive") then
{
	[cursorTarget] spawn FAR_fnc_handleRevive;
};

if (_action == "action_stabilize") then
{
	[cursorTarget] spawn FAR_fnc_handleStabilize;
};

if (_action == "action_suicide") then
{
	player setDamage 1;
};

if (_action == "action_drag") then
{
	[cursorTarget] spawn FAR_fnc_drag;
};

if (_action == "action_release") then
{
	[] spawn FAR_fnc_release;
};
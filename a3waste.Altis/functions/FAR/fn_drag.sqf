
private ["_target", "_id"];

FAR_isDragging = true;

_target = _this select 0;

_target attachTo [player, [0, 1.1, 0.092]];
_target setDir 180;
_target setVariable ["FAR_isDragged", 1, true];

player playMoveNow "AcinPknlMstpSrasWrflDnon";

// Rotation fix
FAR_isDragging_EH = _target;
publicVariable "FAR_isDragging_EH";

// Add release action and save its id so it can be removed
_id = player addAction ["<t color=""#C90000"">" + "Release" + "</t>", "FAR_revive\FAR_handleAction.sqf", ["action_release"], 10, true, true, "", "true"];

hint "Press 'C' if you can't move.";

// Wait until release action is used
waitUntil
{
	!alive player || player getVariable "FAR_isUnconscious" == 1 || !alive _target || _target getVariable "FAR_isUnconscious" == 0 || !FAR_isDragging || _target getVariable "FAR_isDragged" == 0
};

// Handle release action
FAR_isDragging = false;

if (!isNull _target && alive _target) then
{
	_target switchMove "AinjPpneMstpSnonWrflDnon";
	_target setVariable ["FAR_isDragged", 0, true];
	detach _target;
};

player removeAction _id;

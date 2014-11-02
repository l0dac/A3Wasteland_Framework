
// addAction args: title, filename, (arguments, priority, showWindow, hideOnUse, shortcut, condition, positionInModel, radius, radiusView, showIn3D, available, textDefault, textToolTip)
player addAction ["<t color=""#C90000"">" + "Revive" + "</t>", FAR_fnc_handleAction, ["action_revive"], 10, true, true, "", "call FAR_Check_Revive"];
player addAction ["<t color=""#C90000"">" + "Stabilize" + "</t>", FAR_fnc_handleAction, ["action_stabilize"], 10, true, true, "", "call FAR_Check_Stabilize"];
player addAction ["<t color=""#C90000"">" + "Suicide" + "</t>", FAR_fnc_handleAction, ["action_suicide"], 9, false, true, "", "call FAR_Check_Suicide"];
player addAction ["<t color=""#C90000"">" + "Drag" + "</t>", FAR_fnc_handleAction, ["action_drag"], 9, false, true, "", "call FAR_Check_Dragging"];

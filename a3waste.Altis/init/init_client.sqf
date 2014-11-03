/*
	File: init_client.sqf
	Author: Declan Ireland

	Description:


	Parameters:

*/



waitUntil {(!isnil "bis_fnc_init")};
waitUntil {(!isNull player)};
waitUntil {(player==player)};

removeAllWeapons player;
player addEventHandler ["Respawn", { removeAllWeapons (_this select 0) }];
cutText [(localize "STR_Server_Wait"), "BLACK"];
endLoadingScreen;

// Spawn so can work on list while waiting for Server

waitUntil {sleep 0.01; (!(isNil "server_status"))};

if (!server_status) then
{
	cutText [(localize "STR_Server_Error"), "BLACK"];
}
else
{
	cutText [(localize "STR_Client_Initializing"), "BLACK"];
	waitUntil {sleep 0.01; (!(isNil "all_locations"))};
	if (thirdPersonView) then
	{
		[] spawn client_fnc_thirdPersonView;
	};
	[] execVM "scripts\hud\init.sqf";
	[] execVM "scripts\kk_marker_resize.sqf";
	//[] execVM "scripts\atm.sqf"; //TODO Change most of this code ServerSide, easier to block things via Battleye then. Will still need to pass client ARRAY of atm objects, so it can addactions
};

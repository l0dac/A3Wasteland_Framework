/*
	File: fn_addEventhandlers.sqf
	Author:

	Description:
		Add PEV to player, uses clientID to generate PEV Names
	Parameters:
		0: INTEGER ClientID
*/

_clientID = _this select 0;

player addEventHandler ["Respawn", { _this spawn clientEvents_fnc_respawn }];
player addEventHandler ["Killed", { _this spawn clientEvents_fnc_killed }];

player addEventHandler ["InventoryOpened", { _this spawn clientEvents_fnc_inventoryOpened }];
player addEventHandler ["InventoryClosed", { _this spawn clientEvents_fnc_inventoryClosed }];

player addEventHandler ["Hit", { _this spawn clientEvents_fnc_hit }];

player addEventHandler ["Fired", { _this spawn clientEvents_fnc_fired }];
player addEventHandler ["FiredNear", { _this spawn clientEvents_fnc_firedNear }];

player addEventHandler ["HandleDamage", { _this call clientEvents_fn_handleDamageEH }];

// FARR Revive Handlers
"FAR_isDragging_EH" addPublicVariableEventHandler FAR_fnc_publicEH;
"FAR_deathMessage" addPublicVariableEventHandler FAR_fnc_publicEH;


(format["oldSpawn_%1", _clientID]) addPublicVariableEventHandler {(_this select 1) call clientEvents_fnc_oldSpawn;};
(format["newSpawn_%1", _clientID]) addPublicVariableEventHandler {(_this select 1) call clientEvents_fnc_newSpawn;};

(format["boughtItem_%1", _clientID]) addPublicVariableEventHandler {(_this select 1) spawn clientEvents_fnc_boughtItem;};
(format["updateCMoney_%1", _clientID]) addPublicVariableEventHandler {(_this select 1) call clientEvents_fnc_updateCMoney;};

(format["insufficentMoney_%1", _clientID]) addPublicVariableEventHandler {(_this select 1) call clientEvents_fnc_insufficentMoney;};
(format["storeWait_%1", _clientID]) addPublicVariableEventHandler {(_this select 1) call clientEvents_fnc_storeWait;};



waitUntil {sleep 0.01; (!(isNil "all_locations"))}; // Wait for Client to be Ready with Town List for spawns, just incase
client_onPlayerSpawn = [player];
publicVariableServer "client_onPlayerSpawn";
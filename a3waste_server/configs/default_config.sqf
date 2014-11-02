// This will all be moved to MySQL for Config Options @ later point ideally with fallback option to this file

waste_server_instanceID = compileFinal str("1");

waste_mapMode =  compileFinal str("Wasteland");   // Possible Options Wasteland / KOFH

waste_thirdPersonView = compileFinal str(true);
// false == Default
// true == Force 1st Person View for Players, 3rd Person View for Vehicles = OK

waste_realTime = compileFinal str(true);
waste_realTimeOffset = compileFinal str(0);

waste_spawnLoot = compileFinal str(true);

waste_spawnObjects = compileFinal str(0);
waste_spawnVehicles = compileFinal str(0);


waste_playerLoadOut = compileFinal str(call compile preprocessFileLineNumbers "waste_server\configs\default_loadout.sqf");
class DefaultEventhandlers;

class CfgPatches 
{
	class waste_server
	{
		units[] = {};
		weapons[] = {};
		requiredAddons[] = {};
		fileName = "Wasteland_Server.pbo";
		author[]= {"Torndeco"}; 
	};
};

class CfgFunctions
{

	class events
	{
		tag = "serverEvents";
		class events
		{
			file = "\waste_server\functions\events";
			class buyItem{};
			class buyVehicle{};
			class handleDisconnect{};
			class onConnect{};
			class onSpawn{};
			class onKilled{};
			class inventoryClosed{};
			class inventoryOpened{};
		};
	};

	class extDB
	{
		tag = "extDB";
		class extDB
		{
			file = "\waste_server\functions\extDB";
			class async{};
			class async_misc{};
			class strip{};
			class newPlayer{};
			class newVehicle{};
			class newObject{};
			class deadPlayer{};
			class updatePlayerAll{};
		};
	};

	class loot
	{
		tag = "loot";
		class loot
		{
			file = "\waste_server\functions\loot";
			class clean{};
			class spawnBuilding{};
			class spawnCheck{};
			class spawn{};
			class updateInfo{};
		};
	};

	class players
	{
		tag = "players";
		class players
		{
			file = "\waste_server\functions\players";
			class dataDel{};
			class dataGet{};
			class dataInit{};
			class dataSet{};
			class updateCheck{};
		};
	};

	class server
	{
		tag = "server";
		class server
		{
			file = "\waste_server\functions";
			class arrayShuffle{};
			class getHitPoints{};
		};
	};

	class objects
	{
		tag = "objects";
		class objects
		{
			file = "\waste_server\functions\objects";
			class addDB{};
			class check{};
			class loadDB{};
		};
	};

	class vehicles
	{
		tag = "vehicles";
		class vehicles
		{
			file = "\waste_server\functions\vehicles";
			class addDB{};
			class check{};
			class loadDB{};
		};
	};

	class zones
	{
		tag = "zones";
		class zones
		{
			file = "\waste_server\functions\zones";
			class updateZones{};
		};
	};
};

class CfgLoot {
	class Wasteland {
		#include "configs\Wasteland\loot\loot.h"
	};
};

class CfgLootSmall {
	class Wasteland {
		#include "configs\Wasteland\loot\loot-small.h"
	};
};

class CfgBuildingLoot{
	class Wasteland {
		#include "configs\Wasteland\loot\building-loot.h"
		#include "configs\Wasteland\loot\building-pos.h"
	};
};

class CfgWasteObjects {
	class Wasteland {
		#include "configs\Wasteland\objects.h"
	};
};

class CfgWasteVehicles {
	class Wasteland {
		#include "configs\Wasteland\vehicles.h"
	};
};
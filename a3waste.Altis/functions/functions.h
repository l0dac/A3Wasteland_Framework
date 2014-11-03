class CfgFunctions
{
	class client
	{
		class network
		{
			class updateClientID{};
			class updateStores{};
		};
		class client
		{
			class addEventhandlers{};
			class handleDamage{};
			class playerDied{}; // TODO ADD Eventhandler for this
			class playerParachute{};
			class playerSetup{};
			class thirdPersonView{};
			class welcomeMessage{};
		};
	};

	class clientEvents
	{
		class events
		{
			class boughtItem{};
			class fired{};
			class firedNear{};
			class handleDamage{};
			class hit{};
			class inventoryClosed{};
			class inventoryOpened{};
			class killed{};
			class newSpawn{};
			class oldSpawn{};
			class respawn{};
		};
	};

	class FAR
	{
		class FAR
		{
			class checkDragging{};
			class checkFriendlies{};
			class checkRevive{};
			class checkStabilize{};
			class checkSuicide{};
			class drag{};
			class handleAction{};
			class handleRevive{};
			class handleStabilize{};
			class isFriendlyMedic{};
			class playerActions{};
			class playerUnconscious{};
			class publicEH{};
			class release{};
		};
	};

	class Spawn
	{
		class Spawn
		{
			class changeType{};
			class createDialog{};
			class townChangeSel{};
		};
	};

	class Store
	{
		class Store
		{
			file = "functions\Store";
			class buyItem{};
			class buyVehicle{};
		};
	};

	class StoreGeneral
	{
		class StoreGeneral
		{
			file = "functions\Store\General";
			class createDialog{};
			class mainButton{};
			class mainSel{};
		};
	};

	class StoreVehicles
	{
		class StoreVehicles
		{
			file = "functions\Store\Vehicles";
			class createDialog{};
			class vehicleButton{};
			class vehicleSel{};
		};
	};

	class StoreWeapons
	{
		class StoreWeapons
		{
			file = "functions\Store\Weapons";
			class accButton{};
			class accSel{};
			class createDialog{};
			class getAttachmentInfo{};
			class weaponButton{};
			class weaponSel{};
		};
	};
};
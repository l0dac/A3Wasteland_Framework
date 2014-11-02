private ["_headgear", "_goggles"];
private ["_uniform", "_vest", "_backpack"];
private ["_uniformWeapons", "_uniformItems", "_uniformMagazines"];
private ["_vestMagazines", "_vestItems", "_vestMagazines"];
private ["_backpackWeapons", "_backpackItems", "_backpackMagazines"];
private ["_primaryWeapon", "_secondaryWeapon", "_handgunWeapon"];
private ["_primaryWeaponItems", "_secondaryWeaponItems", "_handgunItems", "_assignedItems"];
private ["_partialItems", "_loadedMagazines", "_wasteItems"];


_hunger = 1;
_thirst = 1;
_money = 1000;

_currentWeapon = "arifle_MX_pointer_F";
_stance = "";

_headgear = "H_HelmetB_light_desert";
_goggles = "G_Combat";

_uniform = "U_B_CombatUniform_mcam_tshirt";
_vest = "V_PlateCarrierSpec_rgr";
_backpack = "";

_uniformWeapons = [[],[]];
_uniformItems = [["FirstAidKit"],[1]];
_uniformMagazines = [["30Rnd_65x39_caseless_mag",30],["Chemlight_green",1],["30Rnd_65x39_caseless_mag",30]];

_vestWeapons = [[],[]];
_vestItems = [[],[]];
_vestMagazines = [["30Rnd_65x39_caseless_mag",30],["30Rnd_65x39_caseless_mag",30],["30Rnd_65x39_caseless_mag",30],["16Rnd_9x21_Mag",16],["16Rnd_9x21_Mag",16],["SmokeShell",1],["SmokeShellGreen",1],["SmokeShellBlue",1],["SmokeShellOrange",1],["Chemlight_green",1]];

_backpackWeapons = [[],[]];
_backpackItems = [[],[]];
_backpackMagazines = [];

_primaryWeapon = "arifle_MX_pointer_F";
_secondaryWeapon = "";
_handgunWeapon = "hgun_P07_F";

_primaryWeaponItems = ["","",""];
_secondaryWeaponItems = [];
_handgunItems = ["","",""];
_assignedItems = ["ItemMap","ItemCompass","ItemWatch","ItemRadio","NVGoggles"];

_loadedMagazines = [["30Rnd_65x39_caseless_mag",30],["16Rnd_9x21_Mag",16]];
_wasteItems = [];


_data = [
		_hunger,
		_thirst,
		_money,

		_currentWeapon,
		_stance,

		_headgear,
		_goggles,

		_uniform,
		_vest,
		_backpack,

		_uniformWeapons,
		_uniformItems,
		_uniformMagazines,

		_vestWeapons,
		_vestItems,
		_vestMagazines,

		_backpackWeapons,
		_backpackItems,
		_backpackMagazines,

		_primaryWeapon,
		_secondaryWeapon,
		_handgunWeapon,

		_primaryWeaponItems,
		_secondaryWeaponItems,
		_handgunItems,
		_assignedItems,

		_loadedMagazines,
		_wasteItems
		];
_data
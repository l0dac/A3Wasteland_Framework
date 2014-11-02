/*
	File: init.sqf
	Orig Authors: Author: [404] Deadbeat, [KoS] His_Shadow, AgentRev
	Author: Declan Ireland

	Description:
		Generate Store Price Lists (arrays)

	Parameters:

	Changelog:
		Based of populateGun/GenStore.sqf in A3Wasteland etc...

*/

waitUntil {(!isNull "R3F_LOG_CFG_CF_creation_cost_factor")};

_shopParentCfg = (missionConfigFile >> "CfgShopList");

_count = count _shopParentCfg;


for "_i" from 0 to (_count - 1) do
{
	_shopCfgName = configName (_shopParentCfg select _i);

	_itemName = [];
	_itemClassname = [];
	_itemPrice = [];
	_itemDesc = [];
	_itemPic  = [];
	_itemCfgType = [];


	{
		_classname = _x select 0;
		_price = _x select 1;

		switch (true) do
		{
			case (isClass (configFile >> "CfgVehicles" >> _classname)):
			{
				// Price Cost code from R3F Creation Factory
				_categorie_toLower = toLower getText (configFile >> "CfgVehicles" >> _classname >> "vehicleClass");
				_facteur_cout = 1;
				{
					if (_categorie_toLower == toLower (_x select 0)) exitWith {_facteur_cout = _x select 1;};
				} forEach R3F_LOG_CFG_CF_creation_cost_factor;
				_price = _facteur_cout * (1 max ceil (0.01 * getNumber (configFile >> "CfgVehicles" >> _classname >> "cost")));

				_itemName pushBack (getText (configFile >> "CfgVehicles" >> _classname >> "displayName"));
				_itemDesc pushBack (getText (configFile >> "CfgVehicles" >> _classname >> "descriptionShort"));
				_itemPic pushBack (getText (configFile >> "CfgVehicles" >> _classname >> "picture"));
				_itemCfgType pushBack "CfgVehicles";
			};
			case (isClass (configFile >> "CfgWeapons" >> _classname)):
			{
				_type = "CfgWeapons";
				// Yeah gonna get abit Complicated Below...
				// 		Why couldn't BIS Just split up Vests / Uniforms etc into own Configs
				_isWeapon = false;
				_weaponType = getNumber(configFile >> "CfgWeapons" >> _classname >> "type");
				_weaponTypeInfo = -1;
				if(isClass (configFile >> "CfgWeapons" >> _classname >> "ItemInfo")) then
				{
					_weaponTypeInfo = getNumber(configFile >> "CfgWeapons" >> _classname >> "ItemInfo" >> "Type");
				};
				if(_weaponType in [1,2,4,5]) then
				{
					_isWeapon = true;
				}
				else
				{
					if ((_weaponType == 4096) && (_weaponTypeInfo == -1)) then
					{
						_isWeapon = true;
					};
				};

				if (!_isWeapon) then
				{
					switch (_weaponTypeInfo) do
					{
						case 701:	//addItem   VEST
						{
							_type = "Vest";
						};
						case 801:	//addItem	Uniform
						{
							_type = "Uniform";
						};
						default
						{
							_type = "WeaponItem";
						};
					};
				};

				_itemName pushBack (getText (configFile >> "CfgWeapons" >> _classname >> "displayName"));
				_itemDesc pushBack (getText (configFile >> "CfgWeapons" >> _classname >> "descriptionShort"));
				_itemPic pushBack (getText (configFile >> "CfgWeapons" >> _classname >> "picture"));
				_itemCfgType pushBack _type;
			};

			case (isClass (configFile >> "CfgMagazines" >> _classname)):
			{
				_itemName pushBack (getText (configFile >> "CfgMagazines" >> _classname >> "displayName"));
				_itemDesc pushBack (getText (configFile >> "CfgMagazines" >> _classname >> "descriptionShort"));
				_itemPic pushBack (getText (configFile >> "CfgMagazines" >> _classname >> "picture"));
				_itemCfgType pushBack "CfgMagazines";
			};

			case (isClass (configFile >> "CfgGlasses" >> _classname)):
			{
				_itemName pushBack (getText (configFile >> "CfgGlasses" >> _classname >> "displayName"));
				_itemDesc pushBack (getText (configFile >> "CfgGlasses" >> _classname >> "descriptionShort"));
				_itemPic pushBack (getText (configFile >> "CfgGlasses" >> _classname >> "picture"));
				_itemCfgType pushBack "CfgGlasses";
			};

			default
			{
				_itemDesc pushBack (localize (_x select 2));
				_itemPic pushBack (_x select 3);
				_itemName pushBack (_x select 4);
				_itemCfgType pushBack "";
			};

			_itemPrice pushBack _price;
			_itemClassname pushBack _classname;
		};

	} forEach (getArray (_shopParentCfg >> _shopCfgName));

	missionNamespace setvariable [format ["StoreCfg_%1_itemClassName", _shopCfgName], _itemClassname];
	missionNamespace setvariable [format ["StoreCfg_%1_itemPrice", _shopCfgName], _itemPrice];

	if (!isDedicated) then
	{
		// Dont need these values for Dedicated Server
			// Not worth the effort of if statements above to prevent working out values... we will just not save the results
		missionNamespace setvariable [format ["StoreCfg_%1_itemCfgType", _shopCfgName], _itemCfgType];
		missionNamespace setvariable [format ["StoreCfg_%1_itemName", _shopCfgName], _itemName];
		missionNamespace setvariable [format ["StoreCfg_%1_itemDesc", _shopCfgName], _itemDesc];
		missionNamespace setvariable [format ["StoreCfg_%1_itemPic", _shopCfgName], _itemPic];
	};
};
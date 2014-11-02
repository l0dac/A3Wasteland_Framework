/*
	File: fn_weaponSel.sqf
	Author: Declan Ireland

	Description:

	Parameters:

*/


#define waste_storeWeapons_DIALOG				2400
#define waste_storeWeapons_MONEY_TEXT   		2401
#define waste_storeWeapons_ITEM_PRICE			2402
#define waste_storeWeapons_ITEM_DESC			2403
#define waste_storeWeapons_ITEM_LIST    		2404
#define waste_storeWeapons_ITEM_AMMO_LIST   	2405
#define waste_storeWeapons_ITEM_POINTER_LIST	2406
#define waste_storeWeapons_ITEM_MUZZLE_LIST 	2407
#define waste_storeWeapons_ITEM_SCOPE_LIST  	2408
#define waste_storeWeapons_ITEM_PIC				2409

#define waste_storeWeapons_AMMO_BUTTON  		2410
#define waste_storeWeapons_POINTER_BUTTON  		2411
#define waste_storeWeapons_MUZZLE_BUTTON   		2412
#define waste_storeWeapons_SCOPE_BUTTON   		2413
#define waste_storeWeapons_BUY1X_BUTTON			2414
#define waste_storeWeapons_BUY5X_BUTTON			2415

_updateAttachmentInfo =
{
	disableSerialization;
	// Update Accessories
	_dialog = _this select 0;
	_itemClassname = _this select 1;
	_type = _this select 2;

	_listIDC = -1;
	_buttonIDC = -1;

	_data = [_itemClassname, _type] call storeWeapons_fnc_getAttachmentInfo;

	switch (_type) do
	{
		case "MuzzleSlot":
		{
			_listIDC = waste_storeWeapons_ITEM_MUZZLE_LIST;
			_buttonIDC = waste_storeWeapons_MUZZLE_BUTTON;
		};
		case "CowsSlot":
		{
			_listIDC = waste_storeWeapons_ITEM_SCOPE_LIST;
			_buttonIDC = waste_storeWeapons_SCOPE_BUTTON;
		};
		case "PointerSlot":
		{
			_listIDC = waste_storeWeapons_ITEM_POINTER_LIST;
			_buttonIDC = waste_storeWeapons_POINTER_BUTTON;
		};
	};

	_accessoriesClassnames = _data select 0;
	_accessoriesNames = _data select 1;
	_accessoriesDescs = _data select 2;
	_accessoriesPics = _data select 3;
	_dialog_list = _dialog displayCtrl _listIDC;
	lbClear _dialog_list;


	if (( count _accessoriesNames) == 0) then
	{
		ctrlShow [_buttonIDC, false];
		ctrlShow [_listIDC, false];
	}
	else
	{
		ctrlShow [_buttonIDC, true];
		{
			_aName = _x;
			_aClassname = _accessoriesClassnames select _forEachIndex;
			//_aPrice = _allowedAccPrice select (_allowedAccClassNames find _x);  //TODO Finish
			_aPrice = 100;
			_aDesc = _accessoriesDescs select _forEachIndex;
			_aPic = _accessoriesPics select _forEachIndex;
			_data = str(["accessories", _aClassname, _aPrice, _aDesc, _aPic]);

			_index = _dialog_list lbAdd format ["%1", _aName];
			_dialog_list lbSetData [_index, _data];
		} forEach _accessoriesNames;
	};
};

disableSerialization;

_curIndex = (_this select 1);

_dialog = findDisplay waste_storeWeapons_DIALOG;
_dialogPrice = _dialog displayCtrl waste_storeWeapons_ITEM_PRICE;
_dialogDesc = _dialog displayCtrl waste_storeWeapons_ITEM_DESC;

ctrlshow[waste_storeWeapons_BUY1X_BUTTON, true];
ctrlshow[waste_storeWeapons_BUY5X_BUTTON, true];

if (_curIndex == -1) then
{
	// Hide Crap
	ctrlshow[waste_storeWeapons_ITEM_AMMO_LIST, false];
	ctrlshow[waste_storeWeapons_ITEM_POINTER_LIST, false];
	ctrlshow[waste_storeWeapons_ITEM_MUZZLE_LIST, false];
	ctrlshow[waste_storeWeapons_ITEM_SCOPE_LIST, false];
	ctrlshow[waste_storeWeapons_AMMO_BUTTON, false];
	ctrlshow[waste_storeWeapons_ITEM_POINTER_BUTTON, false];
	ctrlshow[waste_storeWeapons_ITEM_MUZZLE_BUTTON, false];
	ctrlshow[waste_storeWeapons_ITEM_SCOPE_BUTTON, false];

	_dialogPrice ctrlSetText "Price: $0";
	_dialogDesc ctrlSetStructuredText parseText "";
}
else
{
	_itemName = lbText[waste_storeWeapons_ITEM_LIST, _curIndex];
	_itemData = call compile (lbData[waste_storeWeapons_ITEM_LIST, _curIndex]);

	_shopCfgName = _itemData select 0;
	_itemClassname = _itemData select 1;
	_itemPrice = _itemData select 2;
	_itemDesc = _itemData select 3;
	_itemPic = _itemData select 4;

	_dialogPrice ctrlSetText format ["Price: $%1", [_itemPrice] call BIS_fnc_numberText];
	_dialogDesc ctrlSetStructuredText parseText _itemDesc;
	ctrlSetText [waste_storeWeapons_ITEM_PIC , _itemPic];

	player_store_data = [_shopCfgName, _itemClassname];

	// Update Magazines
	_allowedMagsClassNames = missionNamespace getvariable ["StoreCfg_ammo_itemClassName", []];
	_allowedMagsPrice = missionNamespace getvariable ["StoreCfg_ammo_itemPrice", []];
	_mags = getArray(configFile >> "CfgWeapons" >> _itemClassname >> "magazines");
	_dialog_itemList2 = _dialog displayCtrl waste_storeWeapons_ITEM_AMMO_LIST;
	lbClear _dialog_itemList2;
	if ((count _mags) == 0) then
	{
		ctrlShow [waste_storeWeapons_AMMO_BUTTON, false];
	}
	else
	{
		ctrlShow [waste_storeWeapons_AMMO_BUTTON, true];
		{
			if (_x in _allowedMagsClassNames) then
			{
				_magClassname = _x;
				_magName = getText(configFile >> "CfgMagazines" >> _x >> "displayName");
				_magDesc = getText(configFile >> "CfgMagazines" >> _x >> "descriptionShort");
				_magPic = getText(configFile >> "CfgMagazines" >> _x >> "picture");
				_magPrice = _allowedMagsPrice select (_allowedMagsClassNames find _x);

				_data = str(["ammo", _magClassname, _magPrice, _magDesc, _magPic]);
				_index = _dialog_itemList2 lbAdd format ["%1", _magName];
				_dialog_itemList2 lbSetData [_index, _data];
			};
		} forEach _mags;
	};

	// MuzzleSlot / CowsSlot / PointerSlot
	[_dialog, _itemClassname, "MuzzleSlot"] call _updateAttachmentInfo;
	[_dialog, _itemClassname, "CowsSlot"] call _updateAttachmentInfo;
	[_dialog, _itemClassname, "PointerSlot"] call _updateAttachmentInfo;
};
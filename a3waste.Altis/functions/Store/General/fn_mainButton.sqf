/*
	File: fn_mainButton.sqf
	Author: Declan Ireland

	Description:

	Parameters:

*/


#define waste_storeGeneral_DIALOG 		2200
#define waste_storeGeneral_MONEY_TEXT   2201
#define waste_storeGeneral_ITEM_PRICE	2202
#define waste_storeGeneral_ITEM_DESC	2203
#define waste_storeGeneral_ITEM_LIST    2204
#define waste_storeGeneral_ITEM_PIC		2205

#define waste_storeGeneral_BUY1X_BUTTON 2206
#define waste_storeGeneral_BUY5X_BUTTON 2207

disableSerialization;

_shopCfgName = _this select 0;

_dialog = findDisplay waste_storeGeneral_DIALOG;
_handleID = _dialog displayAddEventHandler ["KeyDown", "if ((_this select 1) == 1) then { true }"];

_dialog_itemList = _dialog displayCtrl waste_storeGeneral_ITEM_LIST;
_dialog_itemPrice = _dialog displayCtrl waste_storeGeneral_ITEM_PRICE;
_dialog_itemDesc = _dialog displayCtrl waste_storeGeneral_ITEM_DESC;

//Clear the list
lbClear _dialog_itemList;
_dialog_itemList lbSetCurSel -1;
_dialog_itemPrice ctrlSetText "";
_dialog_itemDesc ctrlSetText "";

_itemClassArray = missionNamespace getvariable [format ["StoreCfg_%1_itemClassName", _shopCfgName], []];
_itemPriceArray = missionNamespace getvariable [format ["StoreCfg_%1_itemPrice", _shopCfgName], []];
_itemNameArray  = missionNamespace getvariable [format ["StoreCfg_%1_itemName", _shopCfgName], []];
_itemDescArray  = missionNamespace getvariable [format ["StoreCfg_%1_itemDesc", _shopCfgName], []];
_itemPicArray   = missionNamespace getvariable [format ["StoreCfg_%1_itemPic", _shopCfgName], []];


{
	_skip = false;
	if (!(playerSide in [BLUFOR,OPFOR])) then
	{
		if (_x == "warchest") then
		{
			_skip = true;
		};
	};


	if (!_skip) then
	{
		_itemClass = _x;
		_itemPrice = _itemPriceArray select _forEachIndex;
		_itemName = _itemNameArray select _forEachIndex;
		_itemDesc = _itemDescArray select _forEachIndex;
		_itemPic = _itemPicArray select _forEachIndex;

		_index = _dialog_itemList lbAdd format ["%1", _itemName];
		if ((_itemPic == "pictureStaticObject") || (_itemPic == "picturething")) then
		{
			_itemPic = "";
		};

		if (_itemDesc == "") then
		{
			_itemDesc = _itemName;
		};

		_dialog_itemList lbSetPicture [_index, _itemPic];
		_data = str([_shopCfgName, _itemClass, _itemPrice, _itemDesc, _itemPic]);
		_dialog_itemList lbSetData [_index, _data];
	};
} forEach _itemClassArray;
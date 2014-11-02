class storeWeapons {

	idd = waste_storeWeapons_DIALOG;
	movingEnable = true;
	enableSimulation = true;

	class controlsBackground {
		class MainBackground: waste_RscFrame_legacy
		{
			x = 9.5 * GUI_GRID_W + GUI_GRID_X;
			y = 3.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 21 * GUI_GRID_W;
			h = 13 * GUI_GRID_H;
		};
		class TopBar: waste_RscFrame_legacy
		{
			moving = true;
			x = 9.5 * GUI_GRID_W + GUI_GRID_X;
			y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 21 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class DialogTitleText: waste_RscText
		{
			text = "Weapon Store";
			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 20.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class PlayerMoneyText: waste_RscTextRight
		{
			idc = waste_storeWeapons_MONEY_TEXT;
			text = "Cash: $0";
			x = 15 * GUI_GRID_W + GUI_GRID_X;
			y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 15.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
	};

	class controls {
		class HandgunsButton: waste_RscButton_legacy
		{
			onButtonClick = "['handguns'] call storeWeapons_fnc_weaponButton";
			text = "Handguns"; //--- ToDo: Localize;
			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 3 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class SMGsButton: waste_RscButton_legacy
		{
			onButtonClick = "['smgs'] call storeWeapons_fnc_weaponButton";
			text = "SMGs"; //--- ToDo: Localize;
			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 6.2 * GUI_GRID_H + GUI_GRID_Y;
			w = 3 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RiflesButton: waste_RscButton_legacy
		{
			onButtonClick = "['rifles'] call storeWeapons_fnc_weaponButton";
			text = "Rifles"; //--- ToDo: Localize;
			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 7.4 * GUI_GRID_H + GUI_GRID_Y;
			w = 3 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class LMGsButton: waste_RscButton_legacy
		{
			onButtonClick = "['lmgs'] call storeWeapons_fnc_weaponButton";
			text = "LMGs"; //--- ToDo: Localize;
			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 8.6 * GUI_GRID_H + GUI_GRID_Y;
			w = 3 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class LaunchersButton: waste_RscButton_legacy
		{
			onButtonClick = "['launchers'] call storeWeapons_fnc_weaponButton";
			text = "Launchers"; //--- ToDo: Localize;
			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 9.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 3 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class ThrowButton: waste_RscButton_legacy
		{
			onButtonClick = "['throw_put'] call storeWeapons_fnc_weaponButton";
			text = "Throw"; //--- ToDo: Localize;
			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 11 * GUI_GRID_H + GUI_GRID_Y;
			w = 3 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class StaticGunsButton: waste_RscButton_legacy
		{
			onButtonClick = "['static_guns'] call storeWeapons_fnc_weaponButton";
			text = "Static Guns"; //--- ToDo: Localize;
			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 12.2 * GUI_GRID_H + GUI_GRID_Y;
			w = 3 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class ListBox: waste_RscListBox_legacy
		{
			onLBSelChanged = "_this call storeWeapons_fnc_weaponSel;";
			idc = waste_storeWeapons_ITEM_LIST;
			x = 13.5 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 11.5 * GUI_GRID_W;
			h = 5 * GUI_GRID_H;
		};
		class AmmoListBox: waste_RscListBox_legacy
		{
			onLBSelChanged = "_this call storeWeapons_fnc_accSel;";
			idc = waste_storeWeapons_ITEM_AMMO_LIST;
			x = 15.8 * GUI_GRID_W + GUI_GRID_X;
			y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 9.2 * GUI_GRID_W;
			h = 5 * GUI_GRID_H;
		};
		class PointerListBox: waste_RscListBox_legacy
		{
			onLBSelChanged = "_this call storeWeapons_fnc_accSel;";
			idc = waste_storeWeapons_ITEM_POINTER_LIST;
			x = 15.8 * GUI_GRID_W + GUI_GRID_X;
			y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 9.2 * GUI_GRID_W;
			h = 5 * GUI_GRID_H;
		};
		class MuzzleListBox: waste_RscListBox_legacy
		{
			onLBSelChanged = "_this call storeWeapons_fnc_accSel;";
			idc = waste_storeWeapons_ITEM_MUZZLE_LIST;
			x = 15.8 * GUI_GRID_W + GUI_GRID_X;
			y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 9.2 * GUI_GRID_W;
			h = 5 * GUI_GRID_H;
		};
		class ScopeListBox: waste_RscListBox_legacy
		{
			onLBSelChanged = "_this call storeWeapons_fnc_accSel;";
			idc = waste_storeWeapons_ITEM_SCOPE_LIST;
			x = 15.8 * GUI_GRID_W + GUI_GRID_X;
			y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 9.2 * GUI_GRID_W;
			h = 5 * GUI_GRID_H;
		};
		class AmmoButton: waste_RscButton_legacy
		{
			onButtonClick = "['ammo'] call storeWeapons_fnc_accButton";
			idc = waste_storeWeapons_AMMO_BUTTON;
			text = "Ammo"; //--- ToDo: Localize;
			x = 13.5 * GUI_GRID_W + GUI_GRID_X;
			y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 0.7 * GUI_GRID_H;
		};
		class PointerButton: waste_RscButton_legacy
		{
			onButtonClick = "['pointer'] call storeWeapons_fnc_accButton";
			idc = waste_storeWeapons_POINTER_BUTTON;
			text = "Pointer"; //--- ToDo: Localize;
			x = 13.5 * GUI_GRID_W + GUI_GRID_X;
			y = 11.4 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 0.7 * GUI_GRID_H;
		};
		class MuzzleButton: waste_RscButton_legacy
		{
			onButtonClick = "['muzzle'] call storeWeapons_fnc_accButton";
			idc = waste_storeWeapons_MUZZLE_BUTTON;
			text = "Muzzle"; //--- ToDo: Localize;
			x = 13.5 * GUI_GRID_W + GUI_GRID_X;
			y = 12.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 0.7 * GUI_GRID_H;
		};
		class ScopeButton: waste_RscButton_legacy
		{
			onButtonClick = "['scope'] call storeWeapons_fnc_accButton";
			idc = waste_storeWeapons_SCOPE_BUTTON;
			text = "Scope"; //--- ToDo: Localize;
			x = 13.5 * GUI_GRID_W + GUI_GRID_X;
			y = 13.2 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 0.7 * GUI_GRID_H;
		};
		class Buy1xButton: waste_RscButton_legacy
		{
			onButtonClick = "[1] call store_fnc_buyItem;";
			idc = waste_storeWeapons_BUY1X_BUTTON;
			text = "Buy 1x"; //--- ToDo: Localize;
			x = 25.5 * GUI_GRID_W + GUI_GRID_X;
			y = 13 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class Buy5xButton: waste_RscButton_legacy
		{
			onButtonClick = "[5] call store_fnc_buyItem;";
			idc = waste_storeWeapons_BUY5X_BUTTON;
			text = "Buy 5x"; //--- ToDo: Localize;
			x = 28 * GUI_GRID_W + GUI_GRID_X;
			y = 13 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class CloseButton: waste_RscButton_legacy
		{
			onButtonClick = "closeDialog 0;";
			text = "Close"; //--- ToDo: Localize;
			x = 27 * GUI_GRID_W + GUI_GRID_X;
			y = 15 * GUI_GRID_H + GUI_GRID_Y;
			w = 3 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class SellButton: waste_RscButton_legacy
		{
			text = "Sell"; //--- ToDo: Localize;
			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 15 * GUI_GRID_H + GUI_GRID_Y;
			w = 3 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class ItemDesc: waste_RscStructuredText
		{
			idc = waste_storeWeapons_ITEM_DESC;
			x = 25.5 * GUI_GRID_W + GUI_GRID_X;
			y = 9 * GUI_GRID_H + GUI_GRID_Y;
			w = 4.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class ItemPrice: waste_RscText
		{
			text = "";
			idc = waste_storeWeapons_ITEM_PRICE;
			x = 25.5 * GUI_GRID_W + GUI_GRID_X;
			y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class RscPicture_1200: waste_RscPictureKeepAspect
		{
			idc = waste_storeWeapons_ITEM_PIC;
			text = "";
			x = 25.5 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4.5 * GUI_GRID_W;
			h = 3.5 * GUI_GRID_H;
		};
	};
};

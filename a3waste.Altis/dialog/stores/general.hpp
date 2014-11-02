class storeGeneral {

	idd = waste_storeGeneral_DIALOG;
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
			text = "General Store";
			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 20.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class PlayerMoneyText: waste_RscTextRight
		{
			idc = waste_storeGeneral_MONEY_TEXT;
			text = "Cash: $0";
			x = 15 * GUI_GRID_W + GUI_GRID_X;
			y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 15.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
	};

	class controls {
		class HeadGearButton: waste_RscButton_legacy
		{
			onButtonClick = "['headgear'] call storeGeneral_fnc_mainButton";
			text = "Headgear"; //--- ToDo: Localize;
			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 3 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class UniformsButton: waste_RscButton_legacy
		{
			onButtonClick = "['uniforms'] call storeGeneral_fnc_mainButton";
			text = "Uniforms"; //--- ToDo: Localize;
			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 6.2 * GUI_GRID_H + GUI_GRID_Y;
			w = 3 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class VestsButton: waste_RscButton_legacy
		{
			onButtonClick = "['vests'] call storeGeneral_fnc_mainButton";
			text = "Vests"; //--- ToDo: Localize;
			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 7.4 * GUI_GRID_H + GUI_GRID_Y;
			w = 3 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class BackpacksButton: waste_RscButton_legacy
		{
			onButtonClick = "['backpacks'] call storeGeneral_fnc_mainButton";
			text = "Backpacks"; //--- ToDo: Localize;
			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 8.6 * GUI_GRID_H + GUI_GRID_Y;
			w = 3 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class ItemsButton: waste_RscButton_legacy
		{
			onButtonClick = "['items'] call storeGeneral_fnc_mainButton";
			text = "Items"; //--- ToDo: Localize;
			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 9.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 3 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class SuppliesButton: waste_RscButton_legacy
		{
			onButtonClick = "['supplies'] call storeGeneral_fnc_mainButton";
			text = "Supplies"; //--- ToDo: Localize;
			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 11 * GUI_GRID_H + GUI_GRID_Y;
			w = 3 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class ObjectsButton: waste_RscButton_legacy
		{
			onButtonClick = "['objects'] call storeGeneral_fnc_mainButton";
			text = "Objects"; //--- ToDo: Localize;
			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 12.2 * GUI_GRID_H + GUI_GRID_Y;
			w = 3 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class ListBox: waste_RscListBox_legacy
		{
			onLBSelChanged = "_this call storeGeneral_fnc_mainSel;";
			idc = waste_storeGeneral_ITEM_LIST;
			x = 13.5 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 11.5 * GUI_GRID_W;
			h = 10.5 * GUI_GRID_H;
		};
		class Buy1xButton: waste_RscButton_legacy
		{
			onButtonClick = "[1] call store_fnc_buyItem;";
			idc = waste_storeGeneral_BUY1X_BUTTON;
			text = "Buy 1x"; //--- ToDo: Localize;
			x = 25.5 * GUI_GRID_W + GUI_GRID_X;
			y = 13 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class Buy5xButton: waste_RscButton_legacy
		{
			onButtonClick = "[5] call store_fnc_buyItem;";
			idc = waste_storeGeneral_BUY5X_BUTTON;
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
			idc = waste_storeGeneral_ITEM_DESC;
			x = 25.5 * GUI_GRID_W + GUI_GRID_X;
			y = 9 * GUI_GRID_H + GUI_GRID_Y;
			w = 4.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class ItemPrice: waste_RscText
		{
			text = "";
			idc = waste_storeGeneral_ITEM_PRICE;
			x = 25.5 * GUI_GRID_W + GUI_GRID_X;
			y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class RscPicture_1200: waste_RscPictureKeepAspect
		{
			idc = waste_storeGeneral_ITEM_PIC;
			text = "";
			x = 25.5 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4.5 * GUI_GRID_W;
			h = 3.5 * GUI_GRID_H;
		};
	};
};

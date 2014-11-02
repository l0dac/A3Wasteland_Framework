class storeVehicles {

	idd = waste_storeVehicles_DIALOG;
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
			text = "Vehicle Store";
			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 20.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class PlayerMoneyText: waste_RscTextRight
		{
			idc = waste_storeVehicles_MONEY_TEXT;
			text = "Cash: $0";
			x = 15 * GUI_GRID_W + GUI_GRID_X;
			y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 15.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
	};

	class controls {
		class LandButton: waste_RscButton_legacy
		{
			onButtonClick = "['land'] call storeVehicles_fnc_vehicleButton";
			text = "Land"; //--- ToDo: Localize;
			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 3 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class ArmouredButton: waste_RscButton_legacy
		{
			onButtonClick = "['armored'] call storeVehicles_fnc_vehicleButton";
			text = "Armoured"; //--- ToDo: Localize;
			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 6.2 * GUI_GRID_H + GUI_GRID_Y;
			w = 3 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class TanksButton: waste_RscButton_legacy
		{
			onButtonClick = "['tanks'] call storeVehicles_fnc_vehicleButton";
			text = "Tanks"; //--- ToDo: Localize;
			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 7.4 * GUI_GRID_H + GUI_GRID_Y;
			w = 3 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class HelisButton: waste_RscButton_legacy
		{
			onButtonClick = "['helicopters'] call storeVehicles_fnc_vehicleButton";
			text = "Helicopters"; //--- ToDo: Localize;
			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 8.6 * GUI_GRID_H + GUI_GRID_Y;
			w = 3 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class PlanesButton: waste_RscButton_legacy
		{
			onButtonClick = "['planes'] call storeVehicles_fnc_vehicleButton";
			text = "Planes"; //--- ToDo: Localize;
			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 9.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 3 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class BoatsButton: waste_RscButton_legacy
		{
			onButtonClick = "['boats'] call storeVehicles_fnc_vehicleButton";
			text = "Boats"; //--- ToDo: Localize;
			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 11 * GUI_GRID_H + GUI_GRID_Y;
			w = 3 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class ListBox: waste_RscListBox_legacy
		{
			onLBSelChanged = "_this call storeVehicles_fnc_Vehiclesel;";
			idc = waste_storeVehicles_ITEM_LIST;
			x = 13.5 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 11.5 * GUI_GRID_W;
			h = 5 * GUI_GRID_H;
		};
		class HiddenSelectionListBox: waste_RscListBox_legacy
		{
			onLBSelChanged = "_this call storeVehicles_fnc_accSel;";
			idc = waste_storeVehicles_ITEM_HiddenSelection_LIST;
			x = 13.8 * GUI_GRID_W + GUI_GRID_X;
			y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 11.2 * GUI_GRID_W;
			h = 5 * GUI_GRID_H;
		};
		class Buy1xButton: waste_RscButton_legacy
		{
			onButtonClick = "[1] call store_fnc_buyVehicle;";
			idc = waste_storeVehicles_BUY1X_BUTTON;
			text = "Buy 1x"; //--- ToDo: Localize;
			x = 25.5 * GUI_GRID_W + GUI_GRID_X;
			y = 13 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class Buy5xButton: waste_RscButton_legacy
		{
			onButtonClick = "[5] call store_fnc_buyVehicle;";
			idc = waste_storeVehicles_BUY5X_BUTTON;
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
		class ItemDesc: waste_RscStructuredText
		{
			idc = waste_storeVehicles_ITEM_DESC;
			x = 25.5 * GUI_GRID_W + GUI_GRID_X;
			y = 9 * GUI_GRID_H + GUI_GRID_Y;
			w = 4.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class ItemPrice: waste_RscText
		{
			text = "";
			idc = waste_storeVehicles_ITEM_PRICE;
			x = 25.5 * GUI_GRID_W + GUI_GRID_X;
			y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class RscPicture_1200: waste_RscPictureKeepAspect
		{
			idc = waste_storeVehicles_ITEM_PIC;
			text = "";
			x = 25.5 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4.5 * GUI_GRID_W;
			h = 3.5 * GUI_GRID_H;
		};
	};
};

class playerSettings {

	idd = waste_playerSettings_DIALOG;
	movingEnable = true;
	enableSimulation = true;
	//onLoad = "[] execVM 'systems\playerMenu\item_list.sqf'";

	class controlsBackground
	{
		class Background: waste_RscFrame_legacy
		{
			x = 0.0;
			y = 0.1;
			w = 0.745;
			h = 0.65;
			moving = true;
		};

		class TopBar: waste_RscFrame_legacy
		{
			x = 0;
			y = 0.1;
			w = 0.745;
			h = 0.05;
		};

		class MainTitle : waste_RscText {
			text = "Player Settings"; // TODO LOCALIZE
			sizeEx = 0.04;
			shadow = 2;
			x = 0.260;
			y = 0.1;
			w = 0.3;
			h = 0.05;
		};

		class waterIcon : waste_RscPicture {
        	text = "icons\water.paa";
        	x = 0.022;
        	y = 0.21;
			w = 0.04 / (4/3);
			h = 0.04;
		};

		class foodIcon : waste_RscPicture {
        	text = "icons\food.paa";
        	x = 0.022;
        	y = 0.26;
			w = 0.04 / (4/3);
			h = 0.04;
		};
		class moneyIcon : waste_RscPicture {
        	text = "icons\dollar.paa";
        	x = 0.022;
        	y = 0.32;
			w = 0.04 / (4/3);
			h = 0.04;
		};

		class waterText : waste_RscText {
			idc = waste_playerSettings_waterText;
			text = "";
			sizeEx = 0.03;
			x = 0.06;
			y = 0.193;
			w = 0.3;
			h = 0.05;
		};

		class foodText : waste_RscText {
			idc = waste_playerSettings_foodText;
			sizeEx = 0.03;
			text = "";
			x = 0.06;
			y = 0.254;
			w = 0.3;
			h = 0.05;
		};

		class moneyText : waste_RscText {
			idc = waste_playerSettings_moneyText;
			text = "";
			sizeEx = 0.03;
			x = 0.06;
			y = 0.313;
			w = 0.3;
			h = 0.05;
		};
		class distanceText : waste_RscText {
			text = "View range:";
			sizeEx = 0.025;
			x = 0.03; y = 0.40;
			w = 0.3; h = 0.02;
		};

		class uptimeText : waste_RscText {
			idc = waste_playerSettings_uptimeText;
			text = "";
			sizeEx = 0.030;
			x = 0.52; y = 0.69;
			w = 0.225; h = 0.03;
		};
	};

	class controls {

		class itemList : waste_RscListBox_legacy {
			idc = waste_playerSettings_itemList;
			x = 0.49;
			y = 0.185;
			w = 0.235;
			h = 0.325;
		};

		class DropButton : waste_RscButton_legacy {
			text = "Drop";
			onButtonClick = "[1] execVM 'systems\playerMenu\itemfnc.sqf'";
			x = 0.610;
			y = 0.525;
			w = 0.116;
			h = 0.033 * safezoneH;
		};

		class UseButton : waste_RscButton_legacy {
			text = "Use";
			onButtonClick = "[0] execVM 'systems\playerMenu\itemfnc.sqf'";
			x = 0.489;
			y = 0.525;
			w = 0.116;
			h = 0.033 * safezoneH;
		};

		class moneyInput: waste_RscCombo {
			idc = waste_playerSettings_moneyValue;
			x = 0.610;
			y = 0.618;
			w = .116;
			h = .030;
		};

		class DropcButton : waste_RscButton_legacy {
			text = "Drop";
			onButtonClick = "[] execVM 'systems\playerMenu\dropMoney.sqf'";
			x = 0.489;
			y = 0.60;
			w = 0.116;
			h = 0.033 * safezoneH;
		};

		class CloseButton : waste_RscButton_legacy {
			text = "Close";
			onButtonClick = "closeDialog 0;";
			x = 0.02;
			y = 0.66;
			w = 0.125;
			h = 0.033 * safezoneH;
		};

		class GroupsButton : waste_RscButton_legacy {
			text = "Group Management";
			onButtonClick = "closeDialog 0; createDialog 'groupManagement'";
			x = 0.158;
			y = 0.66;
			w = 0.225;
			h = 0.033 * safezoneH;
		};

		class btnDistanceNear : waste_RscButton_legacy {
			text = "Near";
			onButtonClick = "setViewDistance 1100;";
			x = 0.02;
			y = 0.43;
			w = 0.125;
			h = 0.033 * safezoneH;
		};

		class btnDistanceMedium : waste_RscButton_legacy {
			text = "Medium";
			onButtonClick = "setViewDistance 2200;";
			x = 0.02;
			y = 0.5;
			w = 0.125;
			h = 0.033 * safezoneH;
		};

		class btnDistanceFar : waste_RscButton_legacy {
			text = "Far";
			onButtonClick = "setViewDistance 3300;";
			x = 0.02;
			y = 0.54;
			w = 0.125;
			h = 0.033 * safezoneH;
		};

		class btnDistanceInsane : waste_RscButton_legacy {
			text = "Insane";
			onButtonClick = "setViewDistance 5000;";
			x = 0.02;
			y = 0.60;
			w = 0.125;
			h = 0.033 * safezoneH;
		};
	};
};

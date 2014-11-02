class groupManagement
{
	idd= waste_groupManagement_DIALOG;
	name= "waste_group";
	movingEnable = true;
	enableSimulation = true;

	class controls
	{

		class group_backround: waste_RscFrame_legacy
		{
			moving = true;
			x = 0.292034 * safezoneW + safezoneX;
			y = 0.26199 * safezoneH + safezoneY;
			w = 0.42393 * safezoneW;
			h = 0.442021 * safezoneH;
		};

		class TopBar: waste_RscFrame_legacy
		{
			x = 0.292034 * safezoneW + safezoneX;
			y = 0.26199 * safezoneH + safezoneY;
			w = 0.42393 * safezoneW;
			h = 0.0340016 * safezoneH;
		};

		class group_header: waste_RscText
		{
			text = "Group Manager"; //--- ToDo: Localize;
			x = 0.452008 * safezoneW + safezoneX;
			y = 0.26199 * safezoneH + safezoneY;
			w = 0.111981 * safezoneW;
			h = 0.0340016 * safezoneH;
		};

		class group_playerlist: waste_RscListBox_legacy
		{
			x = 0.308032 * safezoneW + safezoneX;
			y = 0.363994 * safezoneH + safezoneY;
			w = 0.127979 * safezoneW;
			h = 0.272013 * safezoneH;
		};
		class group_memberlist: waste_RscListBox_legacy
		{
			x = 0.571988 * safezoneW + safezoneX;
			y = 0.363994 * safezoneH + safezoneY;
			w = 0.127979 * safezoneW;
			h = 0.272013 * safezoneH;
		};
		class group_invite: waste_RscButton_legacy
		{
			text = "Invite"; //--- ToDo: Localize;
			onButtonClick = "";
			x = 0.460007 * safezoneW + safezoneX;
			y = 0.363994 * safezoneH + safezoneY;
			w = 0.0879854 * safezoneW;
			h = 0.0340016 * safezoneH;
		};
		class group_kick: waste_RscButton_legacy
		{
			text = "Kick"; //--- ToDo: Localize;
			onButtonClick = "";
			x = 0.460007 * safezoneW + safezoneX;
			y = 0.414996 * safezoneH + safezoneY;
			w = 0.0879854 * safezoneW;
			h = 0.0340016 * safezoneH;
		};
		class group_disband: waste_RscButton_legacy
		{
			text = "Disband"; //--- ToDo: Localize;
			onButtonClick = "";
			x = 0.460007 * safezoneW + safezoneX;
			y = 0.534002 * safezoneH + safezoneY;
			w = 0.0879854 * safezoneW;
			h = 0.0340016 * safezoneH;
		};
		class group_leave: waste_RscButton_legacy
		{
			text = "Leave"; //--- ToDo: Localize;
			onButtonClick = "";
			x = 0.460007 * safezoneW + safezoneX;
			y = 0.585004 * safezoneH + safezoneY;
			w = 0.0879854 * safezoneW;
			h = 0.0340016 * safezoneH;
		};
		class playerlist: waste_RscText
		{
			text = "Players"; //--- ToDo: Localize;
			x = 0.340026 * safezoneW + safezoneX;
			y = 0.312991 * safezoneH + safezoneY;
			w = 0.103983 * safezoneW;
			h = 0.0340016 * safezoneH;
		};
		class group_groupHeader: waste_RscText
		{
			text = "Your Group"; //--- ToDo: Localize;
			x = 0.603983 * safezoneW + safezoneX;
			y = 0.312991 * safezoneH + safezoneY;
			w = 0.103983 * safezoneW;
			h = 0.0340016 * safezoneH;
		};
		class CloseButton: waste_RscButton_legacy
		{
			text = "Close"; //--- ToDo: Localize;
			onButtonClick = "closeDialog 0;";
			x = 0.300033 * safezoneW + safezoneX;
			y = 0.670008 * safezoneH + safezoneY;
			w = 0.0639894 * safezoneW;
			h = 0.0340016 * safezoneH;
		};
		class group_accept: waste_RscButton_legacy
		{
			text = "Accept"; //--- ToDo: Localize;
			onButtonClick = "";
			x = 0.404016 * safezoneW + safezoneX;
			y = 0.653007 * safezoneH + safezoneY;
			w = 0.0879854 * safezoneW;
			h = 0.0340016 * safezoneH;
		};
		class group_Decline: waste_RscButton_legacy
		{
			text = "Decline"; //--- ToDo: Localize;
			onButtonClick = "";
			x = 0.507999 * safezoneW + safezoneX;
			y = 0.653007 * safezoneH + safezoneY;
			w = 0.0879854 * safezoneW;
			h = 0.0340016 * safezoneH;
		};
	};
};
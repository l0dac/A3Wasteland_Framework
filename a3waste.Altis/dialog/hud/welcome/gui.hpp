class WelcomeMessage {
	idd = -1;
	duration = 1e+011;
	name= "WelcomeMessage";
	onLoad = "uiNamespace setVariable ['WelcomeMessage', _this select 0]";

	class controlsBackground {
		class WelcomeMessage_Text:waste_RscStructuredText
		{
			idc = waste_welcomeText;
			type = CT_STRUCTURED_TEXT;
			size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.6)";
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 10.5 * GUI_GRID_H;
		};
	};
};

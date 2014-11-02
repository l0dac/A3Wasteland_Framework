class spawnSelection
{
	idd= waste_spawn_DIALOG;
	name= "spawnSelection";
	movingEnable = true;
	enableSimulation = true;

	class controlsBackground
	{
		class waste_RscFrame_legacy_1800: waste_RscFrame_legacy
		{
			x = 9.5 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 21 * GUI_GRID_W;
			h = 13 * GUI_GRID_H;
			moving = true;
		};
		class waste_RscFrame_legacy_1801: waste_RscFrame_legacy
		{
			x = 9.5 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 21 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class waste_RscText_1000: waste_RscText
		{
			text = "Players"; //--- ToDo: Localize;
			x = 17 * GUI_GRID_W + GUI_GRID_X;
			y = 6 * GUI_GRID_H + GUI_GRID_Y;
			w = 3 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class waste_RscText_1001: waste_RscText
		{
			text = "Spawn Location"; //--- ToDo: Localize;
			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.5 * GUI_GRID_W;
			h = 0.5 * GUI_GRID_H;
		};
		class waste_Map: waste_RscMapControl
		{
			idc = waste_spawn_map;
			x = 21 * GUI_GRID_W + GUI_GRID_X;
			y = 6 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 9 * GUI_GRID_H;
		};
	};

	class controls
	{
		class waste_Town_Button: waste_RscButton_legacy
		{
			onButtonClick = "[0] call spawn_fnc_changeType;";
			text = "Towns"; //--- ToDo: Localize;
			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 6 * GUI_GRID_H + GUI_GRID_Y;
			w = 3 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class waste_Beacons_Button: waste_RscButton_legacy
		{
			onButtonClick = "[1] call spawn_fnc_changeType;";
			text = "Beacons"; //--- ToDo: Localize;
			x = 13 * GUI_GRID_W + GUI_GRID_X;
			y = 6 * GUI_GRID_H + GUI_GRID_Y;
			w = 3 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class waste_Town_Locations: waste_RscListBox_legacy
		{
			onLBSelChanged = "_this call spawn_fnc_townChangeSel;";
			idc = waste_Town_Locations_LISTBOX;
			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 7 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 9.5 * GUI_GRID_H;
		};
		class waste_Beacons_Locations: waste_RscListBox_legacy
		{
			idc = waste_Beacons_Locations_LISTBOX;
			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 7 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 9.5 * GUI_GRID_H;
		};
		class waste_Players: waste_RscListBox_legacy
		{
			x = 16.5 * GUI_GRID_W + GUI_GRID_X;
			y = 7 * GUI_GRID_H + GUI_GRID_Y;
			w = 3.5 * GUI_GRID_W;
			h = 9.5 * GUI_GRID_H;
		};
		class waste_Spawn: waste_RscButton_legacy
		{
			idc = waste_spawn_BUTTON;
			onButtonClick = "player setVariable ['waste_spawnType', 1]; closeDialog 0;";
			text = "Spawn"; //--- ToDo: Localize;
			x = 21 * GUI_GRID_W + GUI_GRID_X;
			y = 15.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 3 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class waste_Random: waste_RscButton_legacy
		{
			onButtonClick = "player setVariable ['waste_spawnType', 0]; closeDialog 0;";
			text = "Random"; //--- ToDo: Localize;
			x = 24 * GUI_GRID_W + GUI_GRID_X;
			y = 15.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 3 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class waste_Lobby: waste_RscButton_legacy
		{
			onButtonClick = "endMission 'LOSER';";
			text = "Lobby"; //--- ToDo: Localize;
			x = 27 * GUI_GRID_W + GUI_GRID_X;
			y = 15.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 3 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
	};
};
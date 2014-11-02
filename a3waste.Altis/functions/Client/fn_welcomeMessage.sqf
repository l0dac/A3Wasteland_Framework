#define waste_welcomeText 1100

10 cutrsc["WelcomeMessage", "PLAIN"];

disableSerialization;

_display = uiNamespace getVariable "WelcomeMessage";
_control = _display displayCtrl waste_welcomeText;

private ["_teamRules", "_teamIcon", "_teamColor"];

switch (playerSide) do
{
	case BLUFOR:
	{
		_teamRules = "STR_WASTE_YouAreInTeam";
		_teamicon = "a3\ui_f\data\map\Diary\Icons\playerwest_ca.paa";
		_teamColor = "#0066ff";
	};
	case OPFOR:
	{
		_teamRules = "STR_WASTE_YouAreInTeam";
		_teamicon = "a3\ui_f\data\map\Diary\Icons\playereast_ca.paa";
		_teamColor = "#ff1111";
	};
	case INDEPENDENT:
	{
		_teamRules = "STR_WASTE_YouAreInFFA";
		_teamicon = "a3\ui_f\data\map\Diary\Icons\playerguer_ca.paa";
		_teamColor = "#00ff00";
	};
	default {diag_log str(playerSide)};
};

_message = format ["<t shadow=""1"">%1<br/>%2<br/>%3<br/></t>",
	localize "STR_WASTE_WelcomeToWasteland",
	localize "STR_WASTE_MapMoreInfo",
	format [localize _teamRules,
		_teamIcon,
		_teamColor,
		localize format ["STR_WASTE_Team%1", str playerSide],
		localize format ["STR_WASTE_Team%1", str playerSide]
	]
];

_control ctrlSetStructuredText (parseText _message);

sleep 20;

_control ctrlSetFade 1;
_control ctrlCommit 2;

waitUntil {ctrlCommitted _control};

_control ctrlShow false;
_control ctrlCommit 0;
class Money
{
	// Topic title (displayed only in topic listbox in Field Manual)
	displayName = "Insufficent Money";
	class InsufficentMoney
	{
		// Hint title, filled by arguments from 'arguments' param
		displayName = "Insufficent Money";
					// Optional hint subtitle, filled by arguments from 'arguments' param
		displayNameShort = "";
		// Structured text, filled by arguments from 'arguments' param
		description = "You only have %11 dollars in cash.";
					// Optional structured text, filled by arguments from 'arguments' param (first argument
		tip = "";
		arguments[] = {
			"player getVariable ['cmoney',0]"
		};
		image = "icons\dollar.paa";
	};
};
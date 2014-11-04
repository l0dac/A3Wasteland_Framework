class Store
{
	// Topic title (displayed only in topic listbox in Field Manual)
	displayName = "Store Hints";

	class Wait
	{
		// Hint title, filled by arguments from 'arguments' param
		displayName = "Previous Store Purchase In-Progress please wait";
					// Optional hint subtitle, filled by arguments from 'arguments' param
		displayNameShort = "";
		// Structured text, filled by arguments from 'arguments' param
		description = "Previous store purchase still in progress please wait.";
					// Optional structured text, filled by arguments from 'arguments' param (first argument
		tip = "";
		arguments[] = {
		};
	};

	class NotEnoughRoom
	{
		// Hint title, filled by arguments from 'arguments' param
		displayName = "Not enough Space";
					// Optional hint subtitle, filled by arguments from 'arguments' param
		displayNameShort = "";
		// Structured text, filled by arguments from 'arguments' param
		description = "Sorry you don't have enough Space to hold Items.";
					// Optional structured text, filled by arguments from 'arguments' param (first argument
		tip = "";
		arguments[] = {
		};
	};
};
while {true} do
{
	_animState = animationState player;
	if (_animState == "acinpknlmstpsraswrfldnon_acinpercmrunsraswrfldnon" || _animState == "helper_switchtocarryrfl" || _animState == "AcinPknlMstpSrasWrflDnon") then
	{
		if (FAR_isDragging) then
		{
			player switchMove "AcinPknlMstpSrasWrflDnon";
		}
		else
		{
			player switchMove "amovpknlmstpsraswrfldnon";
		};
	};
	sleep 3;
}

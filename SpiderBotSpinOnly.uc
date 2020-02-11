//=============================================================================
// SpiderBotSpinOnly.
// Used to prevent SpiderBots from shooting bombs.
//=============================================================================
class SpiderBotSpinOnly expands SpiderBot;


state Fighting
{
	function ChooseBotType( )
	{	
		NextState = 'BettyAttack';
		SkelMesh = 0;
	}
	
begin:
	ChooseBotType( );
	GotoState( NextState );
}
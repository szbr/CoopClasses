//=============================================================================
// PumpGong - Pump with a special anim.
//
//
//=============================================================================
class PumpGong expands Pump;


var( ) name anim;


function name GetUseAnim( )
{
	return anim;
}

defaultproperties
{
	anim=neutral_kick
}
//=============================================================================
// LOTFEZombieBreath.
//
//=============================================================================
class LOTFEZombieBreath expands ZombieBreath;


function Timer( )
{
	local actor Victim;
	
	foreach VisibleActors( class 'Actor', Victim, 50, Location )
	{
		if( Victim != self && !Victim.IsA( 'ReptilianBeast' ) )
		{
			Victim.JointDamaged( 4, Pawn( Owner ), Location, vect( 0, 0, 0 ), 'magic', 0 );
		} 
	}

	LifeCount--;
	if( LifeCount <= 0 )
		RemoveCloud( );
}
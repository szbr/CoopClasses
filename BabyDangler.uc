//=============================================================================
// BabyDangler.
//=============================================================================
class BabyDangler expands Dangler;


state Fighting
{
ignores SeePlayer, HearNoise;

Begin:
	DesiredRotation = rotator( Enemy.Location - Location );
	GotoState( 'Charging', 'ResumeFromFighting' );
}

defaultproperties
{
    DrawScale=0.250000
    CollisionRadius=20.000000
    CollisionHeight=16.000000
}
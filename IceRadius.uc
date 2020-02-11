//=============================================================================
// IceRadius.
//=============================================================================
class IceRadius expands BlastRadius;


var float TimePassed;
const StartRadius = 22.0;
const EndRadius = 125.0;
const EffectTime = 0.75;


simulated function Spawned( )
{
	TimePassed = 0.0;
	ScaleGlow = EffectTime * 2;

	DoRadiusEffect( );
}

function DoRadiusEffect( )
{
	local actor A;
	local int i;
	local bool bCollisionJoints;

	foreach RadiusActors( class'actor', A, EndRadius * 2, Location )
	{
		if( A == self || A == Owner || A.Owner == Owner )
			continue;

		if( A.bHidden || !A.bSweepable )
			continue;

		if( ScriptPawn( A ) != None && ScriptPawn( A ).bIsBoss )
			continue;

		if( !FastTrace( Location, A.Location ) )
			continue;

		if( A.IsA( 'Pawn' ) && !PlayerPawn( A ).bBloodlust )
			Pawn( A ).PowerupIce( Pawn( Owner ) );
	}
}

simulated function Tick( float DeltaTime )
{
	local float newRadius;

	TimePassed += DeltaTime;
	newRadius = StartRadius + (EndRadius - StartRadius) * (TimePassed / EffectTime);
	DrawScale = newRadius / StartRadius;
	
	ScaleGlow -= DeltaTime * 2;
	if( ScaleGlow <= 0 )
		Destroy( );
}

defaultproperties
{
    Texture=Texture'LOTFE_CSkins.IceRadius.IceRadius'
}
//=============================================================================
// DistanceLightning class from the Unreal 227i patch.
// 
//=============================================================================
class DistanceLightning expands Light;


simulated function BeginPlay( )
{
	Role = ROLE_Authority;
	if( Level.NetMode != NM_DedicatedServer )
		SetTimer( 5 + FRand( ) * 10, false );
	LightType = LT_None;
}

simulated function Timer( )
{
	if( LightType == LT_Flicker )
	{
		LightType = LT_None;
		SetTimer( 9 + FRand( ) * 20, false );
	}
	else
	{
		LightType = LT_Flicker;
		SetTimer( 0.4 + FRand( ) * 0.05, false );
	}
}

defaultproperties
{
    bStatic=False
    LightType=LT_Flicker
    LightBrightness=255
    LightHue=0
    LightPeriod=128
    LightPhase=32
}
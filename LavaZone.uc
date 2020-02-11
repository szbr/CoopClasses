//=============================================================================
// LavaZone.
//=============================================================================
class LavaZone expands ZoneInfo;


event ActorEntered( Actor entered )
{
	local int i;
	local vector SpawnLocation;
    local Pawn P;
		
    P = Pawn( entered );
    
	if( P == None )
		return;
    
	SpawnLocation = P.Location + vect( 0, 0, 10 );
	
    Spawn( class'FireRadius', , , SpawnLocation, rotator( vect( 0, 0, 1 ) ) );   
    for( i = 0; i < 8; i++ )
        Spawn( class'DebrisBone', , , SpawnLocation );
    Spawn( class'DebrisSkull', , , SpawnLocation );
    Spawn( class'DebrisPelvis', , , SpawnLocation );
    Spawn( class'DebrisRibs', , , SpawnLocation );
    
	P.Died( None, 'Fire', P.Location );
}

defaultproperties
{
    DamagePerSec=10
    EntrySound=Sound'LOTFEmisc.Fluids.LavaEn'
    EntrySoundBig=Sound'LOTFEmisc.Fluids.LavaEn'
    ExitSound=Sound'LOTFEmisc.Fluids.LavaEx'
    bWaterZone=True
    bFogZone=True
    bPainZone=True
    FogBrightness=200
    FogHue=10
    FogSaturation=10
    FogDistance=250.000000
}
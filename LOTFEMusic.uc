//=============================================================================
// LOTFEMusic:
//
// A class responsible for ambient musics on the maps, spawned by LOTFEMutator.
//
//=============================================================================
class LOTFEMusic expands Mutator;


var Sound Sounds[3];
var int Index;


simulated function PostBeginPlay( )
{
	local int lev;
	
    lev = int( mid( Level, 10, 2 ) );

	if( lev >= 0 && lev <= 50 )	
        Sounds[0] = class'LOTFEData'.Default.LOTFEMusic[ lev - 1 ];
    else
		Sounds[0] = Sound'VoyCoopSounds.VoyCoop.tizenketto';
        
    Sounds[1] = Sound'VoyCoopSounds.VoyCoop.harom';
	Sounds[2] = Sound'VoyCoopSounds.VoyCoop.tizenketto';
    
	SetTimer( 10, false );
}

simulated function Timer( )
{
	PlayerPawn( Owner ).ClientPlaySound( Sounds[ Index ] );
	SetTimer( GetSoundDuration( Sounds[ Index ] ), false );
	
	Index++;
	if( Index > 2 )
		Index = 0;
}
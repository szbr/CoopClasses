//=============================================================================
// BeetleFlyer.
//=============================================================================
class BeetleFlyer expands SeaBird;


function PlayMoving( optional float tween )	
{	
	LoopAnim( 'flya', 1.0, 0.1 );
}

auto state AutoStart
{
Begin:
	EnemyAcquired( );
}

defaultproperties
{
    AcquireSound=Sound'CreaturesSnd.Beetle.beetlesee01'
    HitSound1=Sound'CreaturesSnd.Beetle.beetlesee01'
    HitSound2=Sound'CreaturesSnd.Beetle.beetlesee01'
    HitSound3=Sound'CreaturesSnd.Beetle.beetlesee01'
    Die=Sound'CreaturesSnd.Beetle.beetlesee01'
    Die2=Sound'CreaturesSnd.Beetle.beetlesee01'
    Die3=Sound'CreaturesSnd.Beetle.beetlesee01'
    DrawScale=0.500000
    SoundRadius=73
    SoundVolume=199
    AmbientSound=Sound'CreaturesSnd.Beetle.beetle11L'
    bBlockActors=True
    bBlockPlayers=True
    Skeletal=SkelModel'creatures.Beetle'
}
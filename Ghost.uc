//=============================================================================
// Ghost.
//=============================================================================
class Ghost expands SeaBird;


var( ) name AnimToPlay;


function PlayMoving( optional float tween )	
{	
	LoopAnim( AnimToPlay, 1.0, 0.1 );
}

auto state AutoStart
{
Begin:
	EnemyAcquired( );
}

defaultproperties
{
    AnimToPlay=CrucifiedA
    AnimSequence=CrucifiedA
    Style=STY_Translucent
    AmbientSound=Sound'VoyCoopSounds.VoyCoop.szellemhangok'
    bCollideActors=False
    bCollideWorld=False
    bSweepable=False
    SkelMesh=7
    Skeletal=SkelModel'Players.Ragnar'
    SkelGroupSkins(1)=None
    SkelGroupSkins(2)=None
    SkelGroupSkins(3)=None
    SkelGroupSkins(4)=None
    SkelGroupSkins(5)=None
    SkelGroupSkins(6)=None
    SkelGroupSkins(7)=None
}
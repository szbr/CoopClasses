//=============================================================================
// HellSkull.
//=============================================================================
class HellSkull expands SeaBird;


function PostBeginPlay( )
{
    local torchfire tf;
    
    tf = Spawn( class'torchfire' );
    if( tf != None )
        AttachActorToJoint( tf, JointNamed( 'offset' ) );
}

function Died( Pawn Killer, name damageType, vector HitLocation )
{
	local DebrisLava chunk;
    local torchfire tf;
	local Actor A;
	
	Spawn( class'FireRadius', , , Location, rotator( vect( 0, 0, 1 ) ) );
	Spawn( class'SpiderBotExplosion', , , Location );
	PlaySound( Sound'WeaponsSnd.impcrashes.crashmetal04', SLOT_Pain );
    for( i = 0; i < 2; i++ )
    {
        chunk = Spawn( class'DebrisLava', , , Location );
        if( chunk != None )
        {
            tf = Spawn( class'torchfire' );
            if( tf != None )
                chunk.AttachActorToJoint( tf, JointNamed( 'offset' ) );
        }
    }
    
    if( Event != '' )
		foreach AllActors( class'Actor', A, Event )
			A.Trigger( self, Killer );
	
	Destroy( );
}

auto state AutoStart
{
Begin:
	EnemyAcquired( );
}

defaultproperties
{
    AcquireSound=None
    HitSound1=None
    HitSound2=None
    HitSound3=None
    Die=None
    Die2=None
    Die3=None
    FootStepWood(0)=None
    FootStepWood(1)=None
    FootStepWood(2)=None
    FootStepMetal(0)=None
    FootStepMetal(1)=None
    FootStepMetal(2)=None
    FootStepStone(0)=None
    FootStepStone(1)=None
    FootStepStone(2)=None
    FootStepFlesh(0)=None
    FootStepFlesh(1)=None
    FootStepFlesh(2)=None
    FootStepIce(0)=None
    FootStepIce(1)=None
    FootStepIce(2)=None
    FootStepEarth(0)=None
    FootStepEarth(1)=None
    FootStepEarth(2)=None
    FootStepSnow(0)=None
    FootStepSnow(1)=None
    FootStepSnow(2)=None
    FootStepWater(0)=None
    FootStepWater(1)=None
    FootStepWater(2)=None
    FootStepMud(0)=None
    FootStepMud(1)=None
    FootStepMud(2)=None
    FootStepLava(0)=None
    FootStepLava(1)=None
    FootStepLava(2)=None
    LandSoundWood=None
    LandSoundMetal=None
    LandSoundStone=None
    LandSoundFlesh=None
    LandSoundIce=None
    LandSoundSnow=None
    LandSoundEarth=None
    LandSoundWater=None
    LandSoundMud=None
    LandSoundLava=None
    Style=STY_Translucent
    DrawScale=1.500000
    DesiredColorAdjust=(X=255.000000)
    AmbientSound=None
    Skeletal=SkelModel'objects.Skull'
    SkelGroupSkins(1)=Texture'LOTFE_CSkins.HellPack.hskull'
    SkelGroupSkins(2)=Texture'LOTFE_CSkins.HellPack.hskull'
    SkelGroupSkins(3)=Texture'LOTFE_CSkins.HellPack.hskull'
    SkelGroupSkins(4)=Texture'LOTFE_CSkins.HellPack.hskull'
    SkelGroupSkins(5)=Texture'LOTFE_CSkins.HellPack.hskull'
    SkelGroupSkins(6)=Texture'LOTFE_CSkins.HellPack.hskull'
    SkelGroupSkins(7)=Texture'LOTFE_CSkins.HellPack.hskull'
}
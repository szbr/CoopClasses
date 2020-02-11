//=============================================================================
// HellBoss.
//=============================================================================
class HellBoss expands Berserker;


function PostBeginPlay( )
{
    local Fire f;
    
    f = Spawn( class'Fire' );
    if( f == None )
        return;
    
	AttachActorToJoint( f, JointNamed( 'Head' ) );
}

function Texture PainSkin( int BodyPart )
{
	return None;
}

function Died( Pawn Killer, name damageType, vector HitLocation )
{
	local Actor A;
	local DebrisCloud DCloud;
	
	DCloud = Spawn( class'DebrisCloud', , , Location );
	DCloud.SetRadius( 36 );
	
	Spawn( class'BlastDestroyEffect', , , Location, rotator( vect( 0, 0, 1 ) ) );
	Spawn( class'FireRadius'		, , , Location, rotator( vect( 0, 0, 1 ) ) );
	Spawn( class'DarkDwarfBlast'	, , , Location, rotator( vect( 0, 0, 1 ) ) );
	Spawn( class'DarkDwarfExplosion', , , Location, rotator( vect( 0, 0, 1 ) ) );
	
	PlaySound( Sound'CreaturesSnd.Dwarves.BossYell02', SLOT_Pain );
	PlaySound( Sound'WeaponsSnd.impcrashes.crashxstone01', SLOT_Misc );
	
    for( i = 0; i < 10; i++ )
        Spawn( class'DebrisStone', , , Location );
    
    if( Event != '' )
		foreach AllActors( class'Actor', A, Event )
			A.Trigger( self, Killer );
	
	Destroy( );
}

function bool BodyPartSeverable( int BodyPart )
{
	return false;
}

function EMatterType MatterForJoint( int joint )
{
	return MATTER_STONE;
}

defaultproperties
{
    bIsBoss=True
    StartStowWeapon=None
    AcquireSound=None
    AmbientWaitSounds(0)=None
    AmbientWaitSounds(1)=None
    AmbientWaitSounds(2)=None
    AmbientFightSounds(0)=None
    AmbientFightSounds(1)=None
    AmbientFightSounds(2)=None
    StartWeapon=Class'CoopClasses.HellDBA'
    Health=7500
    MaxHealth=7500
    GibClass=Class'RuneI.DebrisStone'
    HitSound1=Sound'WeaponsSnd.ImpStone.impactstone13'
    HitSound2=Sound'WeaponsSnd.ImpStone.impactstone11'
    HitSound3=Sound'WeaponsSnd.ImpStone.impactstone12'
    Die=None
    Die2=None
    Die3=None
    LandGrunt=Sound'CreaturesSnd.Dwarves.bossfoot01'
    FootStepWood(0)=Sound'CreaturesSnd.Dwarves.bossfoot01'
    FootStepWood(1)=Sound'CreaturesSnd.Dwarves.bossfoot02'
    FootStepWood(2)=Sound'CreaturesSnd.Dwarves.bossfoot03'
    FootStepMetal(0)=Sound'CreaturesSnd.Dwarves.bossfoot01'
    FootStepMetal(1)=Sound'CreaturesSnd.Dwarves.bossfoot02'
    FootStepMetal(2)=Sound'CreaturesSnd.Dwarves.bossfoot03'
    FootStepStone(0)=Sound'CreaturesSnd.Dwarves.bossfoot01'
    FootStepStone(1)=Sound'CreaturesSnd.Dwarves.bossfoot02'
    FootStepStone(2)=Sound'CreaturesSnd.Dwarves.bossfoot03'
    FootStepFlesh(0)=Sound'CreaturesSnd.Dwarves.bossfoot01'
    FootStepFlesh(1)=Sound'CreaturesSnd.Dwarves.bossfoot02'
    FootStepFlesh(2)=Sound'CreaturesSnd.Dwarves.bossfoot03'
    FootStepIce(0)=Sound'CreaturesSnd.Dwarves.bossfoot01'
    FootStepIce(1)=Sound'CreaturesSnd.Dwarves.bossfoot02'
    FootStepIce(2)=Sound'CreaturesSnd.Dwarves.bossfoot03'
    FootStepEarth(0)=Sound'CreaturesSnd.Dwarves.bossfoot01'
    FootStepEarth(1)=Sound'CreaturesSnd.Dwarves.bossfoot02'
    FootStepEarth(2)=Sound'CreaturesSnd.Dwarves.bossfoot03'
    FootStepSnow(0)=Sound'CreaturesSnd.Dwarves.bossfoot01'
    FootStepSnow(1)=Sound'CreaturesSnd.Dwarves.bossfoot02'
    FootStepSnow(2)=Sound'CreaturesSnd.Dwarves.bossfoot03'
    FootStepWater(0)=Sound'CreaturesSnd.Dwarves.bossfoot01'
    FootStepWater(1)=Sound'CreaturesSnd.Dwarves.bossfoot02'
    FootStepWater(2)=Sound'CreaturesSnd.Dwarves.bossfoot03'
    FootStepMud(0)=Sound'CreaturesSnd.Dwarves.bossfoot01'
    FootStepMud(1)=Sound'CreaturesSnd.Dwarves.bossfoot02'
    FootStepMud(2)=Sound'CreaturesSnd.Dwarves.bossfoot03'
    FootStepLava(0)=Sound'CreaturesSnd.Dwarves.bossfoot01'
    FootStepLava(1)=Sound'CreaturesSnd.Dwarves.bossfoot02'
    FootStepLava(2)=Sound'CreaturesSnd.Dwarves.bossfoot03'
    LandSoundWood=Sound'CreaturesSnd.Dwarves.bossfoot01'
    LandSoundMetal=Sound'CreaturesSnd.Dwarves.bossfoot01'
    LandSoundStone=Sound'CreaturesSnd.Dwarves.bossfoot01'
    LandSoundFlesh=Sound'CreaturesSnd.Dwarves.bossfoot01'
    LandSoundIce=Sound'CreaturesSnd.Dwarves.bossfoot01'
    LandSoundSnow=Sound'CreaturesSnd.Dwarves.bossfoot01'
    LandSoundEarth=Sound'CreaturesSnd.Dwarves.bossfoot01'
    LandSoundWater=Sound'CreaturesSnd.Dwarves.bossfoot01'
    LandSoundMud=Sound'CreaturesSnd.Dwarves.bossfoot01'
    LandSoundLava=Sound'CreaturesSnd.Dwarves.bossfoot01'
    DrawScale=2.000000
    CollisionRadius=36.000000
    CollisionHeight=92.000000
    SkelMesh=23
    SkelGroupSkins(1)=Texture'LOTFE_CSkins.HellPack.StoneGuardTorso'
    SkelGroupSkins(3)=Texture'LOTFE_CSkins.HellPack.StoneGuardArmLe'
    SkelGroupSkins(6)=Texture'LOTFE_CSkins.HellPack.StoneGuardArmLe'
    SkelGroupSkins(7)=Texture'LOTFE_CSkins.HellPack.StoneGuardArmLe'
    SkelGroupSkins(8)=Texture'LOTFE_CSkins.HellPack.StoneGuardArmLe'
    SkelGroupSkins(9)=Texture'LOTFE_CSkins.HellPack.StoneGuardArmLe'
    SkelGroupSkins(10)=Texture'LOTFE_CSkins.HellPack.StoneGuardHead'
}
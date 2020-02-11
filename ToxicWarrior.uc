//=============================================================================
// ToxicWarrior.
//=============================================================================
class ToxicWarrior expands Alric;


function PostBeginPlay( )
{
	local int Rnd;
	local Weapon WPN;
	
	bUnlit          = true;
	LightType 		= LT_Steady;
    LightEffect 	= LE_None;
    LightBrightness = 170;
    LightHue 		= 140;
    LightSaturation = 120;
    LightRadius 	= 16;
    
    Rnd = Rand( 4 );
    if( Rnd == 0 )
    	WPN = Spawn( Class'TTongue', self, , Location );
    else if( Rnd == 1 )
    	WPN = Spawn( Class'CrabClaw', self, , Location );
    else if( Rnd == 2 )
    	WPN = Spawn( Class'CrabLeg', self, , Location );
    else
    	WPN = Spawn( Class'MechBladeArm', self, , Location );
    
    WPN.DesiredColorAdjust.Y = 5000;
    WPN.Damage = 15;
}

function Texture PainSkin( int BodyPart )
{
	return None;
}

function Died( Pawn Killer, name damageType, vector HitLocation )
{
	local Actor A;
	
	for( i = 0; i < 8; i++ )
		Spawn( Class'DebrisBoneTox'	, , , Location );
	Spawn( Class'DebrisPelvisTox'	, , , Location );
	Spawn( Class'DebrisRibsTox'		, , , Location );
	Spawn( Class'DebrisSkullTox'	, , , Location );
	
    for( i = 0; i < 6; i++ )
    	Spawn( Class'DebrisToxicMat', , , Location );
    	
    PlaySound( Sound'LOTFEmisc.Slime.takonyrobbanas1', , 255 );
    
    if( FRand( ) > 0.5f )
    	PlaySound( Die2, SLOT_Pain );
    else
    	PlaySound( Die3, SLOT_Pain );
    
    if( Event != '' )
		foreach AllActors( class'Actor', A, Event )
			A.Trigger( self, Killer );
	
	Destroy( );
}

function bool CanPickup( Inventory Item )
{
	if( Health <= 0 )
		return false;

	if( ( BodyPartHealth[BODYPART_RARM1] > 0 ) && ( Weapon == None ) )
	{
		if( Item.IsA( 'TTongue' ) || Item.IsA( 'CrabClaw' ) ||
			Item.IsA( 'CrabLeg' ) || Item.IsA( 'MechBladeArm' ) )
				return true;
	}
	return false;
}

function bool BodyPartSeverable( int BodyPart )
{
	return false;
}

function EMatterType MatterForJoint( int joint )
{
	return MATTER_NONE;
}

defaultproperties
{
    StartStowWeapon=None
    Health=275
    MaxHealth=275
    GibClass=Class'CoopClasses.DebrisToxicMat'
    HitSound1=Sound'LOTFEmisc.Slime.takonyutes2'
    HitSound2=Sound'LOTFEmisc.Slime.takonyutes4'
    HitSound3=Sound'LOTFEmisc.Slime.takonyutes6'
    Die=Sound'LOTFEmisc.Slime.takonyhalal1'
    Die2=Sound'LOTFEmisc.Slime.takonyhalal1'
    Die3=Sound'LOTFEmisc.Slime.takonyhalal2'
    FootStepWood(0)=Sound'FootstepsSnd.Mud.footmud01'
    FootStepWood(1)=Sound'FootstepsSnd.Mud.footmud02'
    FootStepWood(2)=Sound'FootstepsSnd.Mud.footmud03'
    FootStepMetal(0)=Sound'FootstepsSnd.Mud.footmud01'
    FootStepMetal(1)=Sound'FootstepsSnd.Mud.footmud02'
    FootStepMetal(2)=Sound'FootstepsSnd.Mud.footmud03'
    FootStepStone(0)=Sound'FootstepsSnd.Mud.footmud01'
    FootStepStone(1)=Sound'FootstepsSnd.Mud.footmud02'
    FootStepStone(2)=Sound'FootstepsSnd.Mud.footmud03'
    FootStepFlesh(0)=Sound'FootstepsSnd.Mud.footmud01'
    FootStepFlesh(1)=Sound'FootstepsSnd.Mud.footmud02'
    FootStepFlesh(2)=Sound'FootstepsSnd.Mud.footmud03'
    FootStepIce(0)=Sound'FootstepsSnd.Mud.footmud01'
    FootStepIce(1)=Sound'FootstepsSnd.Mud.footmud02'
    FootStepIce(2)=Sound'FootstepsSnd.Mud.footmud03'
    FootStepEarth(0)=Sound'FootstepsSnd.Mud.footmud01'
    FootStepEarth(1)=Sound'FootstepsSnd.Mud.footmud02'
    FootStepEarth(2)=Sound'FootstepsSnd.Mud.footmud03'
    FootStepSnow(0)=Sound'FootstepsSnd.Mud.footmud01'
    FootStepSnow(1)=Sound'FootstepsSnd.Mud.footmud02'
    FootStepSnow(2)=Sound'FootstepsSnd.Mud.footmud03'
    FootStepWater(0)=Sound'FootstepsSnd.Mud.footmud01'
    FootStepWater(1)=Sound'FootstepsSnd.Mud.footmud02'
    FootStepWater(2)=Sound'FootstepsSnd.Mud.footmud03'
    FootStepLava(0)=Sound'FootstepsSnd.Mud.footmud01'
    FootStepLava(1)=Sound'FootstepsSnd.Mud.footmud02'
    FootStepLava(2)=Sound'FootstepsSnd.Mud.footmud03'
    LandSoundWood=Sound'FootstepsSnd.Mud.footlandmud01'
    LandSoundMetal=Sound'FootstepsSnd.Mud.footlandmud01'
    LandSoundStone=Sound'FootstepsSnd.Mud.footlandmud01'
    LandSoundFlesh=Sound'FootstepsSnd.Mud.footlandmud01'
    LandSoundIce=Sound'FootstepsSnd.Mud.footlandmud01'
    LandSoundSnow=Sound'FootstepsSnd.Mud.footlandmud01'
    LandSoundEarth=Sound'FootstepsSnd.Mud.footlandmud01'
    LandSoundWater=Sound'FootstepsSnd.Mud.footlandmud01'
    LandSoundLava=Sound'FootstepsSnd.Mud.footlandmud01'
    DesiredFatness=200
    SkelGroupSkins(0)=Texture'LOTFE_Textures.ToxicWarer'
    SkelGroupSkins(1)=Texture'LOTFE_Textures.ToxicWarer'
    SkelGroupSkins(2)=Texture'LOTFE_Textures.ToxicWarer'
    SkelGroupSkins(3)=Texture'LOTFE_Textures.ToxicWarer'
    SkelGroupSkins(4)=Texture'LOTFE_Textures.ToxicWarer'
    SkelGroupSkins(5)=Texture'LOTFE_Textures.ToxicWarer'
    SkelGroupSkins(6)=Texture'LOTFE_Textures.ToxicWarer'
    SkelGroupSkins(7)=Texture'LOTFE_Textures.ToxicWarer'
    SkelGroupSkins(8)=Texture'LOTFE_Textures.ToxicWarer'
    SkelGroupSkins(9)=Texture'LOTFE_Textures.ToxicWarer'
    SkelGroupSkins(10)=Texture'LOTFE_Textures.ToxicWarer'
    SkelGroupSkins(11)=Texture'LOTFE_Textures.ToxicWarer'
    SkelGroupSkins(12)=Texture'LOTFE_Textures.ToxicWarer'
    SkelGroupSkins(13)=Texture'LOTFE_Textures.ToxicWarer'
    SkelGroupSkins(14)=Texture'LOTFE_Textures.ToxicWarer'
    SkelGroupSkins(15)=Texture'LOTFE_Textures.ToxicWarer'
}
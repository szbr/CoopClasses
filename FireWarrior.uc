//=============================================================================
// FireWarrior.
//=============================================================================
class FireWarrior expands DarkViking;


function PostBeginPlay( )
{
	local Fire fire;
	
	fire = Spawn( class'Fire' );
	
	if( fire != None )
	{
		AttachActorToJoint( fire, JointNamed( 'head' ) );
	}
}

function Died( Pawn Killer, name DamageType, vector HitLocation )
{
	local Actor fire;

	fire = DetachActorFromJoint( JointNamed( 'head' ) );
	if( fire != None )
	{
		fire.Destroy( );
	}
	
	Spawn( class'FireRadius', , , Location, rotator( vect( 0, 0, 1 ) ) );
	Spawn( class'SpiderBotExplosion', , , Location );
	
	Super.Died( Killer, DamageType, HitLocation );
}

function bool BodyPartSeverable( int BodyPart )
{
	return false;
}

function Texture PainSkin( int BodyPart )
{
	return None;
}

function EMatterType MatterForJoint( int Joint )
{
	return MATTER_None;
}

defaultproperties
{
    AcquireSound=Sound'CreaturesSnd.SnowBeast.beastyell06'
    AmbientWaitSounds(0)=Sound'CreaturesSnd.Zombie.zombie2ambient01'
    AmbientWaitSounds(1)=Sound'CreaturesSnd.Zombie.zombie2ambient02'
    AmbientWaitSounds(2)=Sound'CreaturesSnd.Zombie.zombie2ambient03'
    AmbientFightSounds(0)=Sound'CreaturesSnd.SnowBeast.beastattack07'
    AmbientFightSounds(1)=Sound'CreaturesSnd.SnowBeast.beastsee02'
    AmbientFightSounds(2)=Sound'CreaturesSnd.Zombie.zombie2see01'
    StartWeapon=Class'RuneI.DwarfWorkSword'
    StartShield=None
    Health=1000
    MaxHealth=1000
    GibClass=None
    HitSound1=Sound'CreaturesSnd.SnowBeast.beasthit01'
    HitSound2=Sound'CreaturesSnd.SnowBeast.beasthit13'
    HitSound3=Sound'CreaturesSnd.SnowBeast.beasthit02'
    Die=Sound'CreaturesSnd.SnowBeast.beastyell13'
    Die2=Sound'CreaturesSnd.SnowBeast.beastdeath06'
    Die3=Sound'CreaturesSnd.SnowBeast.beasthit13'
    SkelGroupSkins(0)=Texture'UWindow.BlackTexture'
    SkelGroupSkins(1)=Texture'UWindow.BlackTexture'
    SkelGroupSkins(2)=Texture'UWindow.BlackTexture'
    SkelGroupSkins(3)=Texture'objects.SkullSKULL'
    SkelGroupSkins(4)=Texture'UWindow.BlackTexture'
    SkelGroupSkins(5)=Texture'UWindow.BlackTexture'
    SkelGroupSkins(6)=Texture'UWindow.BlackTexture'
    SkelGroupSkins(7)=Texture'UWindow.BlackTexture'
    SkelGroupSkins(8)=Texture'UWindow.BlackTexture'
    SkelGroupSkins(9)=Texture'UWindow.BlackTexture'
    SkelGroupSkins(10)=Texture'UWindow.BlackTexture'
    SkelGroupSkins(11)=Texture'UWindow.BlackTexture'
    SkelGroupSkins(12)=Texture'UWindow.BlackTexture'
}
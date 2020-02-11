//=============================================================================
// GhostPack.
//=============================================================================
class GhostPack expands Viking;


function Died( Pawn Killer, name damageType, vector HitLocation )
{
	local Actor A;
	
	Spawn( class'GroundDust', , ,  Location );
	Spawn( class'DebrisCloud', , , Location );
	PlaySound( Sound'CreaturesSnd.Zombie.zombieattack03', SLOT_Pain );
	
	if( Event != '' )
		foreach AllActors( class'Actor', A, Event )
			A.Trigger( self, Killer );
	
	Destroy( );
}

function Texture PainSkin( int BodyPart )
{
	return None;
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
    StartShield=None
    Health=250
    MaxHealth=250
    GibClass=None
    HitSound1=Sound'CreaturesSnd.TubeStriker.tubesee01'
    HitSound2=Sound'CreaturesSnd.TubeStriker.tubesee02'
    HitSound3=Sound'CreaturesSnd.Ragnar.ragthrow01'
    Style=STY_Modulated
    bBlockActors=False
    bBlockPlayers=False
    AmbientWaitSoundDelay=9.000000
    AmbientFightSoundDelay=6.000000
    SkelGroupSkins(0)=Texture'UWindow.Icons.MenuArea'
    SkelGroupSkins(1)=Texture'UWindow.Icons.MenuArea'
    SkelGroupSkins(2)=Texture'UWindow.Icons.MenuArea'
    SkelGroupSkins(3)=Texture'UWindow.Icons.MenuArea'
    SkelGroupSkins(4)=Texture'UWindow.Icons.MenuArea'
    SkelGroupSkins(5)=Texture'UWindow.Icons.MenuArea'
    SkelGroupSkins(6)=Texture'UWindow.Icons.MenuArea'
    SkelGroupSkins(7)=Texture'UWindow.Icons.MenuArea'
    SkelGroupSkins(8)=Texture'UWindow.Icons.MenuArea'
    SkelGroupSkins(9)=Texture'UWindow.Icons.MenuArea'
    SkelGroupSkins(10)=Texture'UWindow.Icons.MenuArea'
    SkelGroupSkins(11)=Texture'UWindow.Icons.MenuArea'
    SkelGroupSkins(12)=Texture'UWindow.Icons.MenuArea'
    SkelGroupSkins(13)=Texture'UWindow.Icons.MenuArea'
    SkelGroupSkins(14)=Texture'UWindow.Icons.MenuArea'
    SkelGroupSkins(15)=Texture'UWindow.Icons.MenuArea'
}
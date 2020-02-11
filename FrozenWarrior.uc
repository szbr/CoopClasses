//=============================================================================
// FrozenWarrior.
//=============================================================================
class FrozenWarrior expands Viking;


function Died( Pawn Killer, name damageType, vector HitLocation )
{
	local Actor A;
	
	Spawn( class'DebrisCloud', , , Location );
	PlaySound( Sound'WeaponsSnd.impcrashes.crashglass02', SLOT_Pain );
    for( i = 0; i < 5; i++ )
    {
       Spawn( class'DebrisIce', , , Location );
    }
    
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
	return MATTER_ICE;
}

defaultproperties
{
    StartShield=None
    Health=250
    MaxHealth=250
    GibClass=Class'RuneI.DebrisIce'
    HitSound1=Sound'MurmurSnd.Ice.icecrack14'
    HitSound2=Sound'MurmurSnd.Ice.icecrack12'
    HitSound3=Sound'MurmurSnd.Ice.icecrack10'
    Die=None
    Die2=None
    Die3=None
    AmbientWaitSoundDelay=9.000000
    AmbientFightSoundDelay=6.000000
    SkelGroupSkins(0)=Texture'Statues.ICE1'
    SkelGroupSkins(1)=Texture'Statues.ICE1'
    SkelGroupSkins(2)=Texture'Statues.ICE1'
    SkelGroupSkins(3)=Texture'Statues.ICE1'
    SkelGroupSkins(4)=Texture'Statues.ICE1'
    SkelGroupSkins(5)=Texture'Statues.ICE1'
    SkelGroupSkins(6)=Texture'Statues.ICE1'
    SkelGroupSkins(7)=Texture'Statues.ICE1'
    SkelGroupSkins(8)=Texture'Statues.ICE1'
    SkelGroupSkins(9)=Texture'Statues.ICE1'
    SkelGroupSkins(10)=Texture'Statues.ICE1'
    SkelGroupSkins(11)=Texture'Statues.ICE1'
    SkelGroupSkins(12)=Texture'Statues.ICE1'
    SkelGroupSkins(13)=Texture'Statues.ICE1'
    SkelGroupSkins(14)=Texture'Statues.ICE1'
    SkelGroupSkins(15)=Texture'Statues.ICE1'
}
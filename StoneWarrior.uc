//=============================================================================
// StoneWarrior.
//=============================================================================
class StoneWarrior expands Viking;


function Texture PainSkin( int BodyPart )
{
	return None;
}

function Died( Pawn Killer, name damageType, vector HitLocation )
{
	local Actor A;
	
	Spawn( class'DebrisCloud', , , Location );
	PlaySound( Sound'WeaponsSnd.impcrashes.crashxstone01', SLOT_Pain );
    for( i = 0; i < 5; i++ )
    {
       Spawn( class'DebrisStone', , , Location );
    }
    
    if( Event != '' )
		foreach AllActors( class 'Actor', A, Event )
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
    StartShield=None
    StartStowWeapon=None
    StartWeapon=Class'RuneI.DwarfBattleHammer'
    Health=375
    MaxHealth=375
    GibClass=Class'RuneI.DebrisStone'
    HitSound1=Sound'WeaponsSnd.ImpStone.impactstone13'
    HitSound2=Sound'WeaponsSnd.ImpStone.impactstone11'
    HitSound3=Sound'WeaponsSnd.ImpStone.impactstone12'
    Die=None
    Die2=None
    Die3=None
    AmbientWaitSoundDelay=9.000000
    AmbientFightSoundDelay=6.000000
    FootStepWood(0)=Sound'LOTFEmisc.Footsteps.step1t'
    FootStepWood(1)=Sound'LOTFEmisc.Footsteps.step1t'
    FootStepWood(2)=Sound'LOTFEmisc.Footsteps.step1t'
    FootStepMetal(0)=Sound'LOTFEmisc.Footsteps.step1t'
    FootStepMetal(2)=Sound'LOTFEmisc.Footsteps.step1t'
    FootStepStone(0)=Sound'LOTFEmisc.Footsteps.step1t'
    FootStepStone(1)=Sound'LOTFEmisc.Footsteps.step1t'
    FootStepStone(2)=Sound'LOTFEmisc.Footsteps.step1t'
    FootStepFlesh(0)=Sound'LOTFEmisc.Footsteps.step1t'
    FootStepFlesh(1)=Sound'LOTFEmisc.Footsteps.step1t'
    FootStepFlesh(2)=Sound'LOTFEmisc.Footsteps.step1t'
    FootStepIce(0)=Sound'LOTFEmisc.Footsteps.step1t'
    FootStepIce(1)=Sound'LOTFEmisc.Footsteps.step1t'
    FootStepIce(2)=Sound'LOTFEmisc.Footsteps.step1t'
    FootStepEarth(0)=Sound'LOTFEmisc.Footsteps.step1t'
    FootStepEarth(1)=Sound'LOTFEmisc.Footsteps.step1t'
    FootStepEarth(2)=Sound'LOTFEmisc.Footsteps.step1t'
    FootStepSnow(0)=Sound'LOTFEmisc.Footsteps.step1t'
    FootStepSnow(1)=Sound'LOTFEmisc.Footsteps.step1t'
    FootStepSnow(2)=Sound'LOTFEmisc.Footsteps.step1t'
    FootStepWater(0)=Sound'LOTFEmisc.Footsteps.step1t'
    FootStepWater(1)=Sound'LOTFEmisc.Footsteps.step1t'
    FootStepWater(2)=Sound'LOTFEmisc.Footsteps.step1t'
    FootStepMud(0)=Sound'LOTFEmisc.Footsteps.step1t'
    FootStepMud(1)=Sound'LOTFEmisc.Footsteps.step1t'
    FootStepMud(2)=Sound'LOTFEmisc.Footsteps.step1t'
    FootStepLava(0)=Sound'LOTFEmisc.Footsteps.step1t'
    FootStepLava(1)=Sound'LOTFEmisc.Footsteps.step1t'
    FootStepLava(2)=Sound'LOTFEmisc.Footsteps.step1t'
    LandSoundWood=Sound'LOTFEmisc.Footsteps.step1t'
    LandSoundMetal=Sound'LOTFEmisc.Footsteps.step1t'
    LandSoundStone=Sound'LOTFEmisc.Footsteps.step1t'
    LandSoundFlesh=Sound'LOTFEmisc.Footsteps.step1t'
    LandSoundIce=Sound'LOTFEmisc.Footsteps.step1t'
    LandSoundSnow=Sound'LOTFEmisc.Footsteps.step1t'
    LandSoundEarth=Sound'LOTFEmisc.Footsteps.step1t'
    LandSoundWater=Sound'LOTFEmisc.Footsteps.step1t'
    LandSoundMud=Sound'LOTFEmisc.Footsteps.step1t'
    LandSoundLava=Sound'LOTFEmisc.Footsteps.step1t'
    SkelMesh=21
    SkelGroupSkins(0)=Texture'rock.Rock10_d'
    SkelGroupSkins(1)=Texture'rock.Rock10_d'
    SkelGroupSkins(2)=Texture'rock.Rock10_d'
    SkelGroupSkins(3)=Texture'rock.Rock10_d'
    SkelGroupSkins(4)=Texture'rock.Rock10_d'
    SkelGroupSkins(5)=Texture'rock.Rock10_d'
    SkelGroupSkins(6)=Texture'rock.Rock10_d'
    SkelGroupSkins(7)=Texture'rock.Rock10_d'
    SkelGroupSkins(8)=Texture'rock.Rock10_d'
    SkelGroupSkins(9)=Texture'rock.Rock10_d'
    SkelGroupSkins(10)=Texture'rock.Rock10_d'
    SkelGroupSkins(11)=Texture'rock.Rock10_d'
    SkelGroupSkins(12)=Texture'rock.Rock10_d'
    SkelGroupSkins(13)=Texture'rock.Rock10_d'
    SkelGroupSkins(14)=Texture'rock.Rock10_d'
    SkelGroupSkins(15)=Texture'rock.Rock10_d'
}
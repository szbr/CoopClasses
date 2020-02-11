//=============================================================================
// LSnowBall.
//=============================================================================
class LSnowBall expands NonStow;


function SpawnHitEffect( vector HitLoc, vector HitNorm, int LowMask, int HighMask, Actor HitActor )
{	
	PlaySound( Sound'WeaponsSnd.ImpCrashes.crashglass04', SLOT_Interface );
	Spawn( class'DebrisIce', , , HitLoc );
	
	Destroy( );
}

defaultproperties
{
    Damage=1
    RunePowerRequired=0
    RunePowerDuration=0.000000
    A_AttackA=None
    A_AttackAReturn=None
    A_AttackStandA=None
    A_AttackStandAReturn=None
    A_AttackBackupA=None
    A_AttackBackupAReturn=None
    A_AttackStrafeRight=None
    A_AttackStrafeLeft=None
    PickupMessage="You have found a Snowball!"
    Skeletal=SkelModel'objects.Fruit'
    SkelGroupSkins(1)=Texture'snowice.SNO2'
}
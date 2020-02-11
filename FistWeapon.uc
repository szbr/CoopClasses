//=============================================================================
// FistWeapon.
//
//=============================================================================
class FistWeapon expands TrialPitMace;


function DropFrom( vector loc )
{
	Destroy( );
}

defaultproperties
{
    Damage=12
    ThroughAir(0)=None
    ThroughAirBerserk(0)=None
    HitFlesh(0)=None
    HitWood(0)=None
    HitStone(0)=None
    HitMetal(0)=None
    HitDirt(0)=None
    HitShield=None
    HitWeapon=None
    HitBreakableWood=None
    HitBreakableStone=None
    SheathSound=None
    UnsheathSound=None
    PowerUpSound=None
    PoweredUpSoundLOOP=None
    PickupSound=None
    DropSound=None
    DrawType=DT_None
}
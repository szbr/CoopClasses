//=============================================================================
// Crystal.
//=============================================================================
class Crystal expands Torch;


function Ignite( )
{
	DamageType = 'None';
	bUnlit = true;
	ScaleGlow = 2.0f;
	Style = STY_TRANSLUCENT;

    LightType 		= LT_Steady;
    LightEffect 	= LE_None;
    LightBrightness = 255;
    LightHue 		= 147;
    LightSaturation = 60;
    LightRadius 	= 16;
}

function SpawnHitEffect( vector HitLoc, vector HitNorm, int LowMask, int HighMask, Actor HitActor )
{	
	PlaySound( Sound'WeaponsSnd.ImpCrashes.crashglass04', SLOT_Interface );
	Spawn( class'DebrisCrystal', , , HitLoc );
	
	HitCount--;
	if( HitCount <= 0 )
	{
		Douse( );
	}
}

function Douse( )
{
	local int i;
	
	PlaySound( Sound'WeaponsSnd.ImpCrashes.crashglass05', SLOT_Interface );
	for( i = 0; i < 3; i++ )
		Spawn( class'DebrisCrystal', , , Location );
		
	Destroy( );
}

function bool FindFire( out vector fireLoc )
{
	return false;
}

function ZoneChange( ZoneInfo newZone )
{

}

defaultproperties
{
    HitCount=5
    ThroughAir(0)=None
    ThroughAir(1)=None
    ThroughAir(2)=None
    HitFlesh(0)=None
    HitWood(0)=None
    HitStone(0)=None
    HitMetal(0)=None
    HitDirt(0)=None
    HitShield=None
    HitWeapon=None
    HitBreakableWood=None
    HitBreakableStone=None
    ThrownSoundLOOP=None
    PickupMessage="You have found a Crystal!"
    PickupSound=None
    RespawnSound=None
    DropSound=None
    Style=STY_Translucent
    DrawScale=1.700000
    SkelGroupSkins(0)=Texture'CoopTextures.Crystal'
    SkelGroupSkins(1)=Texture'CoopTextures.Crystal'
}
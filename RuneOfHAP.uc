//=============================================================================
// Health and Power
//=============================================================================
class RuneOfHAP extends Runes;

#exec Texture Import File=Textures\rhap.bmp Name=rhap Mips=OFF

function PickupFunction( Pawn Other )
{
	local int i;
   
    Other.MaxHealth = 200;
	Other.Health = 200;
    
    Other.MaxPower = 200;
	Other.RunePower = 200;
    
	if( Other.Fatness != 128 )
		Other.DesiredFatness = 128;
	if( Other.ScaleGlow != 1.0 )
		Other.ScaleGlow = 1.0;
	if( Other.BodyPartMissing( BODYPART_LARM1 ) )
		Other.RestoreBodyPart( BODYPART_LARM1 );
	if( Other.BodyPartMissing( BODYPART_RARM1 ) )
		Other.RestoreBodyPart( BODYPART_RARM1 );

	for( i = 0; i < NUM_BODYPARTS; i++ )
		Other.BodyPartHealth[i] = Other.Default.BodyPartHealth[i];

	Destroy( );
}

function bool PawnWantsRune( Pawn Other )
{
	return (Other.MaxHealth < 200 ||
			Other.Health < Other.MaxHealth ||
			Other.BodyPartMissing(BODYPART_LARM1) ||
			Other.BodyPartMissing(BODYPART_RARM1))
            ||
            (Other.MaxPower < 200 ||
			Other.RunePower < Other.MaxPower ||
			Other.BodyPartMissing(BODYPART_LARM1) ||
			Other.BodyPartMissing(BODYPART_RARM1));
}

defaultproperties
{
    SkelGroupSkins(1)=Texture'rhap'
    SpheresClass=Class'RuneSpheresHAP'
    PickupMessage="You picked up a Rune of Health & Power!"
    PickupSound=Sound'OtherSnd.Pickups.pickup12'
    SoundRadius=21
    SoundVolume=126
    SoundPitch=83
    AmbientSound=Sound'WeaponsSnd.PowerUps.power66L'
    CollisionRadius=11.000000
    CollisionHeight=11.000000
    Skeletal=SkelModel'objects.Rune3'
}
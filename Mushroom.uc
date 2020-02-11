//=============================================================================
// Mushroom - Blue:
//	- Hp++;
//
//=============================================================================
class Mushroom expands food;


var( ) int HPMod; 	// Health to add or remove.
var( ) int RPMod; 	// RunePower to add.


function PostBeginPlay( )
{
	SkelMesh = Rand( 5 );		
	DesiredColorAdjust.Z = 255;
}

function PickupFunction( Pawn Other )
{
	local int i, Rnd;
	
	Other.Health += HPMod;
	
	if( Other.Health > Other.MaxHealth )
		Other.Health = Other.MaxHealth;
		 
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
	
	Rnd = Rand( 4 );
	if( Rnd == 0 )
		PlaySound( Sound'LOTFEmisc.PickupRelated.bufibofoges', SLOT_Interface );
	else if( Rnd == 1 )
		PlaySound( Sound'LOTFEmisc.PickupRelated.gombanyeles1', SLOT_Interface );
	else if( Rnd == 2 )
		PlaySound( Sound'LOTFEmisc.PickupRelated.gombanyeles2', SLOT_Interface );
	else
		PlaySound( Sound'LOTFEmisc.PickupRelated.gombanyeles3', SLOT_Interface );
	
	if( Other.bIsPawn )
		FireEvent( Event );

	Destroy( );
}

defaultproperties
{
    HPMod=20
    RPMod=25
    Nutrition=0
    PickupMessage="You have eaten a Blue Mushroom!"
    DrawScale=0.500000
    CollisionRadius=10.000000
    CollisionHeight=10.000000
    Skeletal=SkelModel'plants.Sponge_Mushroom'
}
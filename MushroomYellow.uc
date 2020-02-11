//=============================================================================
// Mushroom - Yellow:
//	- Hp--;
//
//=============================================================================
class MushroomYellow expands Mushroom;


function PostBeginPlay( )
{
	SkelMesh = Rand( 5 );
	
	DesiredColorAdjust.X = 255; // Yellow
	DesiredColorAdjust.Y = 255;
}

function PickupFunction( Pawn Other )
{
	Other.Health -= HPMod;
	
	if( Other.Health <= 0 )
	{
		if( FRand( ) > 0.5f )
			Other.Died( None, 'thrownweaponsever', Other.Location );
		else
			Other.Died( None, 'decapitated', Other.Location );
	}
		
	if( FRand( ) > 0.5f )
		PlaySound( Sound'LOTFEmisc.PickupRelated.kohoges01', SLOT_Interface );
	else
		PlaySound( Sound'LOTFEmisc.PickupRelated.kohoges02', SLOT_Interface );
	
	if( Other.bIsPawn )
		FireEvent( Event );

	Destroy( );
}

defaultproperties
{
    PickupMessage="You have eaten a Yellow Mushroom!"
}
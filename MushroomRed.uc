//=============================================================================
// Mushroom - Red:
//	- Hp--, Rp++;
//
//=============================================================================
class MushroomRed expands Mushroom;


function PostBeginPlay( )
{
	SkelMesh = Rand( 5 );
	
	DesiredColorAdjust.X = 255; // Red
}

function PickupFunction( Pawn Other )
{
	local int Rnd;
	
	Other.Health    -= HPMod;
	Other.RunePower += RPMod;
	
	if( Other.Health <= 0 )
	{
		if( FRand( ) > 0.5f )
			Other.Died( None, 'thrownweaponsever', Other.Location );
		else
			Other.Died( None, 'decapitated', Other.Location );
	}
	
	if( Other.RunePower > Other.MaxPower )
		Other.RunePower = Other.MaxPower;
    
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
    PickupMessage="You have eaten a Red Mushroom!"
}
//=============================================================================
// Cheese.
//=============================================================================
class Cheese expands food;


function PickupFunction( Pawn Other )
{	
	local int Rnd;
	
	Rnd = Rand( 4 );
	if( Rnd == 0 )
		PlaySound( Sound'CreaturesSnd.Goblin.goblinhit14', SLOT_Interface, 1.0, true, 700, 0.95 + FRand( ) * 0.1 );
	else if( Rnd == 1 )
		PlaySound( Sound'CreaturesSnd.SnowBeast.BeastFlesh02', SLOT_Interface, 1.0, true, 700, 0.95 + FRand( ) * 0.1 );
	else if( Rnd == 2  )
		PlaySound( Sound'OtherSnd.Pickups.pickuplizard01', SLOT_Interface, 1.0, true, 700, 0.95 + FRand( ) * 0.1 );
	else
		PlaySound( Sound'OtherSnd.Pickups.pickupmeat01', SLOT_Interface, 1.0, true, 700, 0.95 + FRand( ) * 0.1 );
		
	Super.PickupFunction( Other );
}

defaultproperties
{
    Nutrition=25
    PickupMessage="You have eaten a Cheese!"
    DrawScale=0.500000
    Skeletal=SkelModel'objects.Rune3'
    SkelGroupSkins(1)=Texture'LOTFE_CSkins.Cheese.Cheese1'
}
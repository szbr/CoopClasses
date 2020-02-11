//=============================================================================
// Corn.
//=============================================================================
class Corn expands food;


function PostBeginPlay( )
{
	SkelMesh = Rand( 4 );
}

function PickupFunction( Pawn Other )
{	
	local int Rnd;
	
	Rnd = Rand( 4 );
	if( Rnd == 0 )
		PlaySound( Sound'LOTFEmisc.PickupRelated.bufibofoges', SLOT_Interface );
	else if( Rnd == 1 )
		PlaySound( Sound'LOTFEmisc.PickupRelated.gombanyeles1', SLOT_Interface );
	else if( Rnd == 2 )
		PlaySound( Sound'LOTFEmisc.PickupRelated.gombanyeles2', SLOT_Interface );
	else
		PlaySound( Sound'LOTFEmisc.PickupRelated.gombanyeles3', SLOT_Interface );
	
	Super.PickupFunction( Other );
}

defaultproperties
{
    Nutrition=20
    PickupMessage="You have eaten a corn!"
    DrawScale=0.600000
    Skeletal=SkelModel'plants.Sponge'
    SkelGroupSkins(1)=Texture'LOTFE_CSkins.Corn.corncorn'
}
//=============================================================================
// Bug:
//
// an edible version of ...
//=============================================================================
class Bug expands food;


var( ) bool bChameleon;
var int Rnd;


function PostBeginPlay( )
{
	local Texture tex;
	local int Flags;
	local vector ScrollDir;
	local vector X, Y, Z;
    local int i;

	Super.PostBeginPlay( );

	if( bChameleon )
	{
		GetAxes( Rotation, X, Y, Z );

		tex = TraceTexture( Location - Z * 100, Location, Flags, ScrollDir );
		if( tex != None )
		{
			for( i = 1; i < 16; i++ )
            {
                SkelGroupSkins[i] = tex;
            }
		}
	}
}

function PickupFunction( Pawn Other )
{
	Rnd = Rand( 4 );
	if( Rnd == 0 )
		PlaySound( Sound'OtherSnd.Pickups.pickupfruit01', SLOT_Interface, 1.0, true, 700, 0.95 + FRand( ) * 0.1 );
	else if( Rnd == 1 )
		PlaySound( Sound'OtherSnd.Pickups.pickupfruit02', SLOT_Interface, 1.0, true, 700, 0.95 + FRand( ) * 0.1 );
	else if( Rnd == 2  )
		PlaySound( Sound'OtherSnd.Pickups.pickuplizard01', SLOT_Interface, 1.0, true, 700, 0.95 + FRand( ) * 0.1 );
	else
		PlaySound( Sound'OtherSnd.Pickups.pickupmeat01', SLOT_Interface, 1.0, true, 700, 0.95 + FRand( ) * 0.1 );
		
	Super.PickupFunction( Other );
}

auto state Pickup
{
Begin:
	Rnd = Rand( 3 );
	if( Rnd == 0 )
		PlaySound( Sound'MurmurSnd.Insects.Insect01', SLOT_Talk, 1.0, true, 700, 0.95 + FRand( ) * 0.1 );
	else if( Rnd == 1 )
		PlaySound( Sound'MurmurSnd.Insects.Insect02', SLOT_Talk, 1.0, true, 700, 0.95 + FRand( ) * 0.1 );
	else
		PlaySound( Sound'MurmurSnd.Insects.Insect03', SLOT_Talk, 1.0, true, 700, 0.95 + FRand( ) * 0.1 );
	
	Sleep( 4 + Rand( 3 ) );
	Goto( 'Begin' );
}

defaultproperties
{
    Nutrition=10
    PickupMessage="You have eaten a bug."
    DrawScale=0.125000
    Skeletal=SkelModel'creatures.GiantCrab'
}
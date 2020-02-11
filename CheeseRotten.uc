//=============================================================================
// CheeseRotten:
//   - Decreases health, but gives you RunePower.
//
//=============================================================================
class CheeseRotten expands Cheese;


var( ) int HPToRem;
var( ) int RPToAdd;


function PickupFunction( Pawn Other )
{
	Other.Health    -= HPToRem;
	Other.RunePower += RPToAdd;
	
	if( Other.Health <= 0 )
		Other.Died( None, 'None', Other.Location );
		
	if( Other.RunePower > Other.MaxPower )
		Other.RunePower = Other.MaxPower;
	
	if( Other.bIsPawn )
		FireEvent( Event );

	Destroy( );
}

defaultproperties
{
    HPToRem=15
    RPToAdd=25
    Nutrition=0
    PickupMessage="You have eaten a Rotten Cheese!"
    Skeletal=SkelModel'objects.Rune4'
    SkelGroupSkins(1)=Texture'LOTFE_CSkins.Cheese.CheeseRotten'
}
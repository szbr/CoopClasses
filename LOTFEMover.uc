//=============================================================================
// LOTFEMover:
// - Circular movement:
//		Point: A, B, C
//		Default: A->B->C->B->A...
//		This: A->B->C->A->B->C...
//=============================================================================
class LOTFEMover expands Mover;


var bool bLotfeMoverState;
var byte CurKey;


function InterpolateEnd( Actor Other )
{
	
}

state( ) LOTFELoop
{
	function Trigger( Actor Other, Pawn EventInstigator )
	{
		bLotfeMoverState = !bLotfeMoverState;
		if( bLotfeMoverState )
			GotoState( 'LOTFELoop', 'Loop' );
		else
			GotoState( 'LOTFELoop', '' );
	}

	function Loop( )
	{
		if( curKey == numKeys - 1 )
		{
			curKey = 0;
			InterpolateTo( 0, MoveTime[0] );
			return;
		}
		curKey++;
		InterpolateTo( curKey, MoveTime[CurKey] );
	}
Loop:
	Loop( );
	FinishInterpolation( );
	Goto( 'Loop' );
}
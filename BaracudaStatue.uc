//=============================================================================
//
//=============================================================================
class BaracudaStatue extends Statue;


function EMatterType MatterForJoint( int joint )
{
	return MATTER_FLESH;
}

defaultproperties
{
    bDestroyable=False
    Skeletal=SkelModel'creatures.Baracuda'
}
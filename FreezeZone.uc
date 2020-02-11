//=============================================================================
// FreezeZone.
//
//=============================================================================
class FreezeZone expands WaterZone;


event ActorEntered( Actor other )
{
    local Pawn P;

    P = Pawn( other );
    
    if( P == None )
        return;

    P.PowerupIce( None );
}

defaultproperties
{
    DamagePerSec=100
    bPainZone=True
}
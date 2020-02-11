//=============================================================================
// BossMace.
//=============================================================================
class BossMace expands MagicWand;


function SpecialDamage( Actor Victim )
{
	local vector Vel;

	Vel = Normal( Victim.Location - Owner.Location );
	Vel.Z = 0.5;
	Vel *= 600;
	Victim.AddVelocity( Vel );
}

defaultproperties
{
    DrawScale=2.000000
    Skeletal=SkelModel'objects.Torch'
}
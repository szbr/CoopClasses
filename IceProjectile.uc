//=============================================================================
// IceProjectile.
//=============================================================================
class IceProjectile expands GroundProjectile;


simulated function PostBeginPlay( )
{
	local Actor effect;

	effect = Spawn( class'Smoke', , , Location );
	AttachActorToJoint( effect, 0 );

	SetTimer( 0.1, true );
}

simulated function Timer( )
{
	local int i;
	local vector loc;
	local debris D;

	PrePivot.X = ( FRand( ) - 0.5 ) * 20;
	PrePivot.Y = ( FRand( ) - 0.5 ) * 20;

	for( i = 0; i < 3; i++ )
	{
		loc = GetJointPos( 0 );
		loc.X += ( FRand( ) - 0.5 ) * 30;
		loc.Y += ( FRand( ) - 0.5 ) * 30;
		loc.Z += ( FRand( ) - 0.5 ) * 10;

		D = Spawn( class'DebrisIce', , , loc );
		if( D != none )
		{
			D.SetSize( 0.1 + FRand( ) * 0.15 );
			D.Velocity = VRand( ) * 80;
			D.Velocity.Z = FRand( ) * 100;
		}
	}
}

function FreezePawns( float DamageRadius, vector HitLocation )
{
	local Pawn victim;
	
	foreach VisibleCollidingActors( class 'Pawn', victim, DamageRadius, HitLocation )
	{
		if( victim != Owner )
		{
			if( victim.IsA( 'PlayerPawn' ) || ( victim.IsA( 'ScriptPawn' ) && !ScriptPawn( victim ).bIsBoss ) )
			{
                if( FRand( ) < 0.1 )
                {
                    victim.PowerupIce( None );
                }
                else
                {
                    victim.JointDamaged( 25, Instigator, victim.Location, Vect( 0, 0, 0 ), 'None', 0 );
                }
			}
		}
	}
}

simulated function Explode( vector HitLocation, vector HitNormal )
{
	PlaySound( ExplosionSound, SLOT_None );
	Spawn( class'DebrisCloud' );
	FreezePawns( DamageRadius, Location );
	
	Destroy( );
}

defaultproperties
{
    ExplosionSound=Sound'WeaponsSnd.PowerUps.atfreezeice01'
    SkelGroupSkins(1)=Texture'snowice.Ice5'
}
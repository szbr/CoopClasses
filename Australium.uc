//=============================================================================
// Australium.
//=============================================================================
class Australium expands DwarfBattleSword;


function ZoneChange( ZoneInfo newZone )
{

}

function WeaponFire( int SwingCount )
{

}

simulated function SpawnPowerupEffect( )
{
	local EffectSkeleton ES;

	ES = Spawn( class'EffectSkelVampire', self );
	if( ES != None )
	{
		AttachActorToJoint( ES, 0 );
	}
}

simulated function RemovePowerupEffect( )
{
	local Actor A;
	
	A = DetachActorFromJoint( 0 );
	if( A != None )
		A.Destroy( );
}

function int CalculateDamage( Actor Victim )
{
	local int i;
	local VampireTrail vamp;
	local rotator r;
	local int dam;
	local int actualDam;
	local Pawn P;
	
	dam = Super.CalculateDamage( Victim );
	
	P = Pawn( Owner );
	if( P == None )
		return dam;

	if( Pawn( Victim ) != None && Pawn( Victim ).Health < dam )
		actualDam = Pawn( Victim ).Health;
	else
		actualDam = dam;

	if( bPoweredUp && Victim.IsA( 'Pawn' ) && actualDam > 0 )
	{
		for( i = 0; i < 5; i++ )
		{
			vamp = Spawn( Class'VampireTrail', Owner, , Victim.Location, Owner.Rotation );
			r = rotator( Victim.Location - Owner.Location );
			r.Yaw += -12000 + 4800 * i + (FRand( ) - 0.5) * 1000;
			vamp.Velocity = (350 + 100 * FRand( )) * vector( r );
			vamp.Velocity.Z += 150 + 100 * FRand( );

			r = rotator( vamp.Velocity );
			
			if( i < 2 )
			{
				r.Yaw -= 8000 + FRand( ) * 2000;
			}
			else if( i > 2 )
			{
				r.Yaw += 8000 + FRand( ) * 2000;
			}
			
			vamp.Acceleration = vector( r ) * 1000;
			vamp.VampireDest = P;
			vamp.HealthBoost = dam / 5;
			SetRotation( rotator( vamp.Velocity ) );
			
			if( P.RunePower < P.MaxPower )
				P.RunePower += 1;
		}
	}
	return dam;
}

defaultproperties
{
	PickupMessage="You have found an Australium sword!"
	SkelGroupSkins(1)=Texture'VoyTexture.gold'
	RunePowerRequired=50
	RunePowerDuration=20.000000
	A_AttackA=S4_attackA
	A_AttackB=S4_attackB
	A_AttackC=S4_attackC
	A_AttackAReturn=s4_attackareturn
	A_AttackBReturn=None
	A_AttackCReturn=S4_attackCReturn
}
//=============================================================================
//	LOTFEBoss:
//		- The boss of the coop
//		- Textures by MinYs
//
//=============================================================================
class LOTFEBoss expands Elder;


var int PowerupChance;


function Texture PainSkin( int BodyPart )
{
	return None;
}

function bool CanPickup( Inventory item )
{
	return item.IsA( 'MagicWand' );
}

function Died( Pawn Killer, name damageType, vector HitLocation )
{
	local Actor A;
	
	Spawn( class'DebrisCloud', , , Location );
	PlaySound( Sound'WeaponsSnd.impcrashes.crashglass02', SLOT_Pain );
    for( i = 0; i < 5; i++ )
        Spawn( class'DebrisIce', , , Location );
    
    if( Event != '' )
		foreach AllActors( class 'Actor', A, Event )
			A.Trigger( self, Killer );
	
	Destroy( );
}

function bool JointDamaged( int Damage, Pawn EventInstigator, vector HitLoc, 
							vector Momentum, name DamageType, int Joint )
{
	local IceRadius IR;
	
	PowerupChance++;
	if( PowerupChance > 10 && PowerupChance < 20 )
	{
		IR = Spawn( class'IceRadius', self, , Location - vect( 0, 0, 25 ), rotator( vect( 0, 0, 1 ) ) );
		IR.Instigator = self;
		PlaySound( Sound'WeaponsSnd.PowerUps.atfreezeice01', SLOT_Interface );
	}
	
	if( PowerupChance >= 20 )
		PowerupChance = 0;
	
	return Super.JointDamaged( Damage, EventInstigator, HitLoc, Momentum, DamageType, Joint );
}

function bool BodyPartSeverable( int BodyPart )
{
	return false;
}

function EMatterType MatterForJoint( int joint )
{
	return MATTER_ICE;
}

defaultproperties
{
    bIsBoss=True
    StartWeapon=Class'CoopClasses.MagicWand'
    Health=5000
    MaxHealth=5000
    DrawScale=1.500000
    CollisionHeight=69.000000
    SkelGroupSkins(0)=Texture'snowice.Ice4'
    SkelGroupSkins(1)=Texture'LOTFE_CSkins.LOTFEBoss.LOTFEBossH'
    SkelGroupSkins(2)=Texture'LOTFE_CSkins.LOTFEBoss.LOTFEBossH'
    SkelGroupSkins(3)=Texture'LOTFE_CSkins.LOTFEBoss.LOTFEBossH'
    SkelGroupSkins(4)=Texture'LOTFE_CSkins.LOTFEBoss.LOTFEBossA'
    SkelGroupSkins(5)=Texture'LOTFE_CSkins.LOTFEBoss.LOTFEBossA'
    SkelGroupSkins(6)=Texture'LOTFE_CSkins.LOTFEBoss.LOTFEBossA'
    SkelGroupSkins(7)=Texture'LOTFE_CSkins.LOTFEBoss.LOTFEBossH'
    SkelGroupSkins(8)=Texture'snowice.Ice4'
}
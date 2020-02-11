//=============================================================================
// LOTFESIBoss.
// 
//=============================================================================
class LOTFESIBoss expands Sigurd;


function bool JointDamaged( int Damage, Pawn EventInstigator, vector HitLoc, 
							vector Momentum, name DamageType, int Joint )
{
	local vector loc;
	local rotator rot;
	local IceProjectile proj;
    
    if( Health < 2000 )
    {
        loc = Location;
        loc.Z -= CollisionHeight;
        proj = Spawn( class'IceProjectile', self, , loc, Rotation );

        if( proj != None )
        {
            proj.Velocity = vector( Rotation ) * ( 450 + FRand( ) * 100 );
            proj.TimeToExplode = 1.5 + FRand( ) * 0.5;
        }

        proj = Spawn( class'IceProjectile', self, , loc, Rotation );
        if( proj != None )
        {
            rot = Rotation;
            rot.Yaw += 3000;
            proj.Velocity = vector( rot ) * ( 450 + FRand( ) * 100 );
            proj.TimeToExplode = 1.5 + FRand( ) * 0.5;
        }

        proj = Spawn( class'IceProjectile', self, , loc, Rotation );
        if( proj != None )
        {
            rot = Rotation;
            rot.Yaw -= 3000;
            proj.Velocity = vector( rot ) * ( 450 + FRand( ) * 100 );
            proj.TimeToExplode = 1.5 + FRand( ) * 0.5;
        }   
    }
	
	return Super.JointDamaged( Damage, EventInstigator, HitLoc, Momentum, DamageType, Joint );
}

function Died( pawn Killer, name damageType, vector HitLocation )
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

function bool CanPickup( Inventory item )
{
	return item.IsA( 'BossMace' );
}

function bool BodyPartSeverable( int BodyPart )
{
	return false;
}

function Texture PainSkin( int BodyPart )
{
	return None;
}

function EMatterType MatterForJoint( int Joint )
{
	return MATTER_Ice;
}

defaultproperties
{
    StartStowWeapon=None
    bIsBoss=True
    StartWeapon=Class'CoopClasses.BossMace'
    StartShield=None
    Health=7500
    MaxHealth=7500
    GibClass=Class'RuneI.DebrisIce'
    DrawScale=1.500000
    CollisionHeight=62.000000
    SkelGroupSkins(1)=Texture'LOTFE_CSkins.SiBoss1.SiBossBody5'
    SkelGroupSkins(2)=Texture'LOTFE_CSkins.SiBoss1.SiBossHead1'
    SkelGroupSkins(3)=Texture'LOTFE_CSkins.SiBoss1.SiBossBody5'
    SkelGroupSkins(4)=Texture'LOTFE_CSkins.SiBoss1.SiBossBody5'
    SkelGroupSkins(5)=Texture'LOTFE_CSkins.SiBoss1.SiBossArmLeg5'
    SkelGroupSkins(6)=Texture'LOTFE_CSkins.SiBoss1.SiBossArmLeg5'
    SkelGroupSkins(9)=Texture'LOTFE_CSkins.SiBoss1.SiBossArmLeg5'
    SkelGroupSkins(10)=Texture'LOTFE_CSkins.SiBoss1.SiBossArmLeg5'
    SkelGroupSkins(11)=Texture'LOTFE_CSkins.SiBoss1.SiBossHead1'
    SkelGroupSkins(13)=Texture'LOTFE_CSkins.SiBoss1.SiBossArmLeg5'
    SkelGroupSkins(14)=Texture'LOTFE_CSkins.SiBoss1.SiBossArmLeg5'
}
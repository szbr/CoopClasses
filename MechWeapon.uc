//=============================================================================
// MechWeapon.
//=============================================================================
class MechWeapon expands MechArm;


function WeaponFire( int SwingCount )
{
	local MechRocket Rocket;
	
	Rocket = Spawn( class'CoopMechRocket', Owner, , Location, PlayerPawn( Owner ).ViewRotation );
    if( Rocket == None )
        return;
    
	Rocket.SetPhysics( PHYS_Projectile );
	Rocket.Velocity = vector( PlayerPawn( Owner ).ViewRotation ) * Rocket.Speed;
    Rocket.Damage = 40;
	PlaySound( Sound'CreaturesSnd.Mech.mechfire01', SLOT_Misc );
}

defaultproperties
{
    PickupMessage="You have picked up a Mech's Rocket Launcher!"
    bNeverExpire=True
}
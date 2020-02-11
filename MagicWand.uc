//=============================================================================
// MagicWand.
//=============================================================================
class MagicWand expands Hammer;


function PowerupInit( ) { }
function PowerupEndingPulseOn( ) { }
function PowerupEndingPulseOff( ) { }
function PowerupEnded( ) { }
simulated function SpawnPowerupEffect( ) { }
simulated function RemovePowerupEffect( ) { }


function SpecialDamage( Actor Victim )
{
    if( Victim.IsA( 'Pawn' ) )
    {
        Pawn( Victim ).PowerupIce( Pawn( Owner ) );
    }
}

function int CalculateDamage( actor Victim )
{
    SpecialDamage( Victim );
	
	return Super.CalculateDamage( Victim );
}

function WeaponFire( int SwingCount )
{
	local IceRadius IR;

	if( bPoweredUp )
	{
		IR = Spawn( class'IceRadius', Owner, , Location, rotator( vect( 0, 0, 1 ) ) );
		IR.Instigator = Pawn( Owner );
		PlaySound( Sound'WeaponsSnd.PowerUps.atfreezeice01', SLOT_Interface );
	}
}

function ZoneChange( ZoneInfo newZone )
{

}

defaultproperties
{
    Damage=50
    rating=4
    RunePowerRequired=0
    RunePowerDuration=2500.000000
    ThroughAir(0)=Sound'WeaponsSnd.Swings.swing03'
    ThroughAirBerserk(0)=Sound'WeaponsSnd.Swings.bswing10'
    HitFlesh(0)=Sound'WeaponsSnd.ImpFlesh.impfleshhammer01'
    HitWood(0)=Sound'WeaponsSnd.ImpWood.impactwood07'
    HitStone(0)=Sound'WeaponsSnd.ImpStone.impactstone13'
    HitMetal(0)=Sound'WeaponsSnd.ImpMetal.impactmetal14'
    HitDirt(0)=Sound'WeaponsSnd.ImpEarth.impactearth04'
    HitShield=Sound'WeaponsSnd.Shields.shield10'
    HitWeapon=Sound'WeaponsSnd.Swords.sword10'
    HitBreakableWood=Sound'WeaponsSnd.ImpWood.impactwood12'
    HitBreakableStone=Sound'WeaponsSnd.ImpStone.impactstone13'
    SheathSound=Sound'WeaponsSnd.Stows.xstow02'
    UnsheathSound=Sound'WeaponsSnd.Stows.xunstow02'
    ThrownSoundLOOP=Sound'WeaponsSnd.Throws.throw03L'
    PowerUpSound=Sound'WeaponsSnd.PowerUps.powerstart18'
    PoweredUpSoundLOOP=Sound'WeaponsSnd.PowerUps.power10L'
    PowerupIcon=Texture'RuneFX2.bhammer'
    PowerupIconAnim=Texture'RuneFX2.bhammer1a'
    PoweredUpSwipeClass=Class'RuneI.WeaponSwipeGray'
    BloodTexture=Texture'Statues.ICE1'
    PowerupMessage="Ice Blast!"
    ThroughAir(0)=Sound'WeaponsSnd.Swings.swing02'
    PowerupIcon=Texture'RuneFX2.saxe'
    PowerupIconAnim=Texture'RuneFX2.saxe1a'
    A_Idle=S2_idle
    A_AttackA=H1_attackA
    A_AttackAReturn=H1_attackAReturn
    A_AttackB=H1_attackB
    A_AttackBReturn=H1_AttackBReturn
    A_AttackC=H1_attackC
    A_AttackCReturn=H1_AttackCReturn
    A_AttackStandA=H1_StandingAttackA
    A_AttackStandAReturn=H1_StandingAttackAreturn
    A_AttackStandB=H1_StandingAttackB
    A_AttackStandBReturn=H1_StandingAttackBreturn
    A_AttackBackupB=S1_BackupAttackB
    A_AttackBackupBReturn=S1_BackupAttackBReturn
    A_AttackStrafeRight=H1_StrafeRightAttack
    A_AttackStrafeLeft=H1_StrafeLeftAttack
    A_Throw=S2_Throw
    A_Powerup=s2_powerup
    A_Defend=S2_DefendTo
    A_DefendIdle=S2_DefendIdle
    A_PainFront=S2_painFront
    A_PainRight=S1_painBack
    A_PickupGroundLeft=S2_PickupLeft
    A_PickupHighLeft=S2_PickupLeftHigh
    A_Taunt=H1_Taunt
    A_PumpTrigger=S2_PumpTrigger
    A_LeverTrigger=S2_LeverTrigger
    PickupMessage="You have the Magic Wand!"
    DrawScale=0.400000
    Skeletal=SkelModel'objects.Crucifix'
    SkelGroupSkins(0)=Texture'Statues.ICE1'
    SkelGroupSkins(1)=Texture'Statues.ICE1'
}
//=============================================================================
// DMace.
//=============================================================================
class DMace expands RustyMace;


function PowerupInit( )
{
	Super.PowerupInit( );
	DesiredColorAdjust.X = 128;
}	

function PowerupEndingPulseOn( )
{
	DesiredFatness = 140;
	DesiredColorAdjust.X = 0;
	DesiredColorAdjust.Y = 0;
	PlaySound( PoweredUpEndingSound, SLOT_None );
}

function PowerupEndingPulseOff( )
{
	DesiredFatness = 128;
	DesiredColorAdjust.X = 128;
	DesiredColorAdjust.Y = 70;
}

function PowerupEnded( )
{
	Super.PowerupEnded( );

	DesiredColorAdjust.X = 0;
	DesiredColorAdjust.Y = 0;
}	

simulated function SpawnPowerupEffect( )
{

}

simulated function RemovePowerupEffect( )
{

}

function WeaponFire( int SwingCount )
{
	local FireRadius B;

	if( bPoweredUp )
	{
		B = Spawn( class'FireRadius', Owner, , Location - vect( 0, 0, 10 ), rotator( vect( 0,0,1 ) ) );
		B.Instigator = Pawn( Owner );
		PlaySound( PoweredUpFireSound, SLOT_Interface );
	}
}

defaultproperties
{
    PoweredUpFireSound=None
    bCrouchTwoHands=True
    Damage=55
    rating=4
    RunePowerRequired=50
    PowerupMessage="Fire!"
    ThroughAir(0)=Sound'WeaponsSnd.Swings.swing03'
    ThroughAirBerserk(0)=Sound'WeaponsSnd.Swings.bswing10'
    HitFlesh(0)=Sound'WeaponsSnd.ImpFlesh.impfleshhammer01'
    HitWood(0)=Sound'WeaponsSnd.ImpWood.impactwood07'
    HitStone(0)=Sound'WeaponsSnd.ImpStone.impactstone13'
    HitMetal(0)=Sound'WeaponsSnd.ImpMetal.impactmetal14'
    HitDirt(0)=Sound'WeaponsSnd.ImpEarth.impactearth04'
    HitShield=Sound'WeaponsSnd.Shields.shield10'
    HitWeapon=Sound'WeaponsSnd.Swords.sword10'
    HitBreakableStone=Sound'WeaponsSnd.ImpStone.impactstone13'
    SheathSound=Sound'WeaponsSnd.Stows.xstow02'
    UnsheathSound=Sound'WeaponsSnd.Stows.xunstow02'
    ThrownSoundLOOP=Sound'WeaponsSnd.Throws.throw03L'
    PowerUpSound=Sound'WeaponsSnd.PowerUps.powerstart18'
    PoweredUpSoundLOOP=Sound'WeaponsSnd.PowerUps.power02L'
    PitchDeviation=0.090000
    PowerupIcon=Texture'RuneFX2.tmace'
    PowerupIconAnim=Texture'RuneFX2.tmace1a'
    PoweredUpSwipeClass=Class'RuneI.WeaponSwipeFire'
    A_Idle=H5_Idle
    A_Forward=walkforwardTwohands
    A_Backward=H5_Backup
    A_Forward45Right=H5_Walk45Right
    A_Forward45Left=H5_Walk45Left
    A_Backward45Right=H5_BackupRight
    A_Backward45Left=H5_BackupLeft
    A_StrafeRight=H5_StrafeRight
    A_StrafeLeft=H5_StrafeLeft
    A_Jump=H5_Jump
    A_AttackA=H5_attackA
    A_AttackAReturn=H5_attackAreturn
    A_AttackB=H5_attackB
    A_AttackBReturn=H5_attackBreturn
    A_AttackC=None
    A_AttackCReturn=None
    A_AttackStandA=H5_StandingattackA
    A_AttackStandAReturn=H5_StandingattackAreturn
    A_AttackStandB=H5_StandingattackB
    A_AttackStandBReturn=H5_StandingattackBReturn
    A_AttackBackupA=H5_Backupattack
    A_AttackBackupAReturn=None
    A_AttackBackupB=None
    A_AttackBackupBReturn=None
    A_AttackStrafeRight=H5_StrafeRightAttack
    A_AttackStrafeLeft=H5_StrafeLeftAttack
    A_JumpAttack=H5_jumpattack
    A_Throw=H5_Throw
    A_Powerup=H5_Powerup
    A_Defend=None
    A_DefendIdle=None
    A_PainFront=H5_painFront
    A_PainBack=H5_painFront
    A_PainLeft=H5_painFront
    A_PainRight=H5_painFront
    A_PickupGroundLeft=H5_PickupLeft
    A_PickupHighLeft=H5_PickupLeftHigh
    A_Taunt=H5_Taunt
    A_PumpTrigger=H5_PumpTrigger
    A_LeverTrigger=H5_LeverTrigger
    PickupMessage="You have found the Destroyer Mace!"
    PickupSound=Sound'OtherSnd.Pickups.grab05'
    DropSound=Sound'WeaponsSnd.Drops.hammerdrop01'
    DrawScale=2.000000
    Mass=18.000000
}
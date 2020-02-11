//=============================================================================
//
//=============================================================================
class RegeneratorAxe expands LimbWeapon;


defaultproperties
{
    Damage=20
    DamageType=BluntSever
    A_Idle=S2_idle
    A_AttackA=X3_attackA
    A_AttackAReturn=X3_attackAreturn
    A_AttackB=X3_attackB
    A_AttackBReturn=X3_attackBreturn
    A_AttackC=X3_attackC
    A_AttackCReturn=X3_attackCreturn
    A_AttackStandA=X3_StandingAttackA
    A_AttackStandAReturn=X3_StandingAttackAReturn
    A_AttackStandB=X3_StandingAttackB
    A_AttackStandBReturn=X3_StandingAttackBReturn
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
    A_Taunt=X3_Taunt
    A_PumpTrigger=S2_PumpTrigger
    A_LeverTrigger=S2_LeverTrigger
    Skeletal=SkelModel'weapons.VikingAxe'    
    PickupMessage="You have found a flesh axe!"
    SkelGroupSkins(0)=Texture'RuneFX.gore_bone'
    SkelGroupSkins(1)=Texture'RuneFX.gore_bone'
}
//=============================================================================
// Regenerator.
//
// - Can't be killed, it regrows lost limbs.
//=============================================================================
class Regenerator expands DarkViking;

#exec Texture Import File=Textures\regbody.bmp Name=regbody Mips=OFF

var BloodSpurt bs[3];


state Fleeing
{
Begin:
    GotoState( 'Regenerating' );
}

state Regenerating
{
    function SpawnBloodSpurt( )
    {
        local int joint;
        local vector pos;
               
        if( BodyPartHealth[BODYPART_HEAD] <= 0 && bs[0] == None )
        {
            joint = JointNamed( 'head' );
            pos = GetJointPos( joint );
            
            bs[0] = Spawn( class'BloodSpurt', self, , pos, Rotation );
            if( bs[0] != None )
            {
                AttachActorToJoint( bs[0], joint );
            }
        }
        
        if( BodyPartHealth[BODYPART_LARM1] <= 0 && bs[1] == None )
        {
            joint = JointNamed( 'lshoulda' );
            pos = GetJointPos( joint );
            
            bs[1] = Spawn( class'BloodSpurt', self, , pos, Rotation );
            if( bs[1] != None )
            {
                AttachActorToJoint( bs[1], joint );
            }
        }
        
        if( bs[2] != None )
            return;
        
        joint = JointNamed( 'rshoulda' );
        pos = GetJointPos( joint );
        
        bs[2] = Spawn( class'BloodSpurt', self, , pos, Rotation );
        if( bs[2] != None )
        {
            AttachActorToJoint( bs[2], joint );
        }
    }
    
    function SpawnBloodEffects( )
    {
        local vector pos;
        
        if( BodyPartHealth[BODYPART_HEAD] <= 0 )
        {
            pos = GetJointPos( JointNamed( 'head' ) );
            Spawn( class'BloodMist', self, , pos );
            Spawn( class'DebrisFlesh', self, , pos );
        }
        
        if( BodyPartHealth[BODYPART_LARM1] <= 0 )
        {
            pos = GetJointPos( JointNamed( 'lshoulda' ) );
            Spawn( class'BloodMist', self, , pos );
            Spawn( class'DebrisFlesh', self, , pos );
        }
        
        pos = GetJointPos( JointNamed( 'rshoulda' ) );
        Spawn( class'BloodMist', self, , pos );
        Spawn( class'DebrisFlesh', self, , pos );
    }
    
    function Regrow( )
    {
        if( BodyPartHealth[BODYPART_HEAD] <= 0 )
            RestoreBodyPart( BODYPART_HEAD );
            
        if( BodyPartHealth[BODYPART_LARM1] <= 0 )
            RestoreBodyPart( BODYPART_LARM1 );
            
        RestoreBodyPart( BODYPART_RARM1 );
    }
    
    function SpawnStartInventory( )
	{
		local Weapon W;
        
		if( StartWeapon != None )
		{
			W = Spawn( StartWeapon );
			W.RespawnTime = 0;
		}
	}

	function TouchSurroundingObjects( )
	{
		local Inventory Inv;
		foreach RadiusActors( class'Inventory', Inv, 10 )
		{
			Inv.Touch( self );
		}
	}

begin:
    SpawnBloodSpurt( );

    LoopAnim( 'atk_all_attack3_aa0s', 1.5, 0.15 );

    for( i = 0; i < 3; i++ )
    {
        SpawnBloodEffects( );
        Sleep( 1.0 );
    }
    
    FinishAnim( );
    
    Regrow( );
    
    SpawnStartInventory( );
    TouchSurroundingObjects( );
    
    GotoState( 'Waiting' );
}

function bool CanPickup( Inventory item )
{
    if( item.IsA( 'RegeneratorAxe' ) && (BodyPartHealth[BODYPART_RARM1] > 0) && (Weapon == None) )
        return true;
    
    return false;
}

function bool DamageBodyPart(int Damage, Pawn EventInstigator, vector HitLocation, vector Momentum, name DamageType, int bodypart)
{
	local int PassThrough;
	local int SeverDamage;
	local int BluntDamage;
	local int AppliedDamage;
	local Debris Gib;
	local int i, NumChunks;

	local vector AdjMomentum;

	if(!class'GameInfo'.Default.bVeryLowGore)
	{
		if (CurrentSkin != 0)
			SpecialPainSkin(BodyPart);
		else
			PainSkin(BodyPart);
	}

	GetDamageValues(Damage, DamageType, BluntDamage, SeverDamage);
	Level.Game.ReduceDamage(BluntDamage, SeverDamage, DamageType, self, EventInstigator);
	PassThrough = LimbPassThrough(BodyPart, BluntDamage, SeverDamage);

	if(EventInstigator!=None && EventInstigator.IsA('PlayerPawn') && Health>0 &&
		(DamageType=='blunt' || DamageType=='sever' || DamageType=='bluntsever') &&
		EventInstigator.Weapon!=None && !EventInstigator.Weapon.bPoweredUp &&
		(PassThrough>0) )
	{
		EventInstigator.BoostStrength(0.2 * Damage);
	}

	if (BodyPart != BODYPART_BODY)
	{
		if (BodyPartSeverable(BodyPart) && (BodyPartHealth[BodyPart] > 0))
		{
			BodyPartHealth[BodyPart] -= SeverDamage;
	
			if(BodyPartHealth[BodyPart] <= 0)
			{
				if (BodyPartCritical(BodyPart))
				{
					PassThrough = Max(Health, Damage);
					DamageType = 'decapitated';
				}

				if(!class'GameInfo'.Default.bLowGore)
				{
					BodyPartVisibility(BodyPart, false);
					BodyPartCollision(BodyPart, false);
					LimbSevered(BodyPart, Momentum);
				}
			}
		}
	}

	if (DamageType=='sever' || DamageType=='bluntsever')
	{
		NumChunks = (Damage / 15) + 1;
		NumChunks = NumChunks * Level.Game.DebrisPercentage;
		for(i = 0; i < NumChunks; i++)
		{
			Gib = spawn(GibClass,,, HitLocation + VRand() * 2,);
			if (Gib != None)
			{
				Gib.SetSize(RandRange(0.1, 0.4));
				Gib.SetMomentum((-0.08 * Momentum));
			}
		}
	}
	else if (DamageType == 'crushed')
	{
		PassThrough = Default.Health*3;
		bGibbable = true;
	}

	if (PassThrough != 0)
	{
		AppliedDamage = PassThrough;

		if (Health > 0)
		{
			AdjMomentum = momentum / Mass;
			if(Mass < VSize(AdjMomentum) && Velocity.Z <= 0)
			{			
				AdjMomentum.Z += (VSize(AdjMomentum) - Mass) * 0.5;
			}
			AddVelocity(AdjMomentum);

			if(CanGotoPainState())
			{
				PlayTakeHitSound(AppliedDamage, DamageType, 1);

				if(PassThrough > 5)
				{
					if (GetStateName() != 'Pain' && GetStateName() != 'pain')
					{
						NextStateAfterPain = GetStateName();
						PlayTakeHit(0.1, AppliedDamage, HitLocation, DamageType, Momentum, BodyPart);
						GotoState('Pain');
					}
					return false;
				}
			}
		}
		MakeNoise(1.0);
	}
	return false;
}

function Texture PainSkin( int BodyPart )
{
	return None;
}

function class<Actor> SeveredLimbClass( int BodyPart )
{
	switch( BodyPart )
	{
		case BODYPART_LARM1:
			return class'RegeneratorLArm';
		case BODYPART_RARM1:
			return class'RegeneratorRArm';
		case BODYPART_HEAD:
			return class'RegeneratorHead';
	}
	return None;
}

defaultproperties
{
    bIsBoss=True
    AcquireSound=Sound'CreaturesSnd.Zombie.zombie2see01'
    AmbientWaitSounds(0)=Sound'CreaturesSnd.Zombie.zombieambient01'
    AmbientWaitSounds(1)=Sound'CreaturesSnd.Zombie.zombieambient02'
    AmbientWaitSounds(2)=Sound'CreaturesSnd.Zombie.zombieambient03'
    AmbientFightSounds(0)=Sound'CreaturesSnd.Zombie.zombieattack01'
    AmbientFightSounds(1)=Sound'CreaturesSnd.Zombie.zombieattack01'
    AmbientFightSounds(2)=Sound'CreaturesSnd.Zombie.zombieattack01'
    HitSound1=Sound'CreaturesSnd.Zombie.zombiehit02'
    HitSound2=Sound'CreaturesSnd.Zombie.zombie2hit03'
    HitSound3=Sound'CreaturesSnd.Zombie.zombie2hit01'
    Die=Sound'CreaturesSnd.Zombie.zombie2death04'
    Die2=Sound'CreaturesSnd.Zombie.zombie2death03'
    Die3=Sound'CreaturesSnd.Zombie.zombie2death01'
    SkelGroupSkins(1)=Texture'Players.Ragnardv_armlegpain'
    SkelGroupSkins(2)=Texture'regbody'
    SkelGroupSkins(3)=Texture'RuneFX.gore_bone'
    SkelGroupSkins(4)=Texture'Players.Ragnardv_armlegpain'
    SkelGroupSkins(5)=Texture'RuneFX.gore_bone'
    SkelGroupSkins(7)=Texture'RuneFX.gore_bone'
    SkelGroupSkins(10)=Texture'RuneFX.gore_bone'
    SkelGroupSkins(11)=Texture'RuneFX.gore_bone'
    SkelGroupSkins(12)=Texture'RuneFX.gore_bone'
    StartWeapon=RegeneratorAxe
    StartShield=None
}
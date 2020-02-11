//=============================================================================
// ZombiePack.
//=============================================================================
class ZombiePack expands Viking;


function bool DamageBodyPart(int Damage, Pawn EventInstigator, vector HitLocation, vector Momentum, name DamageType, int bodypart)
{
	local int PassThrough;
	local int SeverDamage;
	local int BluntDamage;
	local bool bAlreadyDead;
	local int AppliedDamage;
	local Debris Gib;
	local float scale;
	local int i, NumChunks;

	local vector AdjMomentum;

	if(!class'GameInfo'.Default.bLowGore)
		PainSkin(BodyPart);

	GetDamageValues(Damage, DamageType, BluntDamage, SeverDamage);
	Level.Game.ReduceDamage(BluntDamage, SeverDamage, DamageType, self, EventInstigator);
	PassThrough = LimbPassThrough(BodyPart, BluntDamage, SeverDamage);

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

					if (EventInstigator != None)
					{
						EventInstigator.BoostStrength(0.15 * Default.Health);
					}

					DamageType = 'decapitated';
				}

				BodyPartVisibility(BodyPart, false);
				BodyPartCollision(BodyPart, false);

				for( i = 0; i < 5; i++ )
					Spawn( class'DebrisFlesh', , , HitLocation );
						
				LimbSevered( BodyPart, Momentum );
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

	if(PassThrough != 0)
	{
		bAlreadyDead = (Health <= 0);

		AppliedDamage = PassThrough;
		Health -= AppliedDamage;

		if(DamageType == 'decapitated' || DamageType == 'crushed' || DamageType == 'fire')
		{
			Health -= AppliedDamage;
		}

		if (Health > 0)
		{
			AdjMomentum = momentum / Mass;
			if(Mass < VSize(AdjMomentum) && Velocity.Z <= 0)
			{			
				AdjMomentum.Z += (VSize(AdjMomentum) - Mass) * 0.5;
			}
			AddVelocity(AdjMomentum);

			if(CanGotoPainState() && DamageType != 'fire' && FRand() > 0.25)
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
				}
			}
		}
		else if (bAlreadyDead)
		{
			if(Health < -Default.Health && bGibbable)
			{
				SpawnBodyGibs(Momentum);
				if (bIsPlayer)
					bHidden=true;
				else
					Destroy();
			}
		}
		else
		{
			AddVelocity(momentum * 2 / Mass);

			if (EventInstigator != self && PlayerPawn(EventInstigator) != None)
			{
				EventInstigator.BoostStrength(0.15 * Default.Health);
			}

			if(Health < -Default.Health && bGibbable)	
				Died(EventInstigator, 'gibbed', HitLocation);
			else
				Died(EventInstigator, DamageType, HitLocation);	
		}
		MakeNoise(1.0);
	}

	return false;
}

function int BodyPartForPolyGroup( int polygroup )
{
	switch( polygroup )
	{
		case 4:								return BODYPART_HEAD;
		case 10:							return BODYPART_LARM1;
		case 11:							return BODYPART_RARM1;
		case 2: case 6:						return BODYPART_LLEG1;
		case 1:	case 5:						return BODYPART_RLEG1;
		case 3: case 7: case 9: case 12:
                case 8: case 13:			return BODYPART_TORSO;
	}
	return BODYPART_BODY;
}

function ApplyGoreCap( int BodyPart )
{
	switch( BodyPart )
	{
		case BODYPART_LARM1:
			SkelGroupSkins[9] = Texture'runefx.gore_bone';
			SkelGroupFlags[9] = SkelGroupFlags[9] & ~POLYFLAG_INVISIBLE;
			break;
		case BODYPART_RARM1:
			SkelGroupSkins[12] = Texture'runefx.gore_bone';
			SkelGroupFlags[12] = SkelGroupFlags[12] & ~POLYFLAG_INVISIBLE;
			break;
		case BODYPART_HEAD:
			SkelGroupSkins[7] = Texture'runefx.gore_bone';
			SkelGroupFlags[7] = SkelGroupFlags[7] & ~POLYFLAG_INVISIBLE;
			break;
	}
}

function class<Actor> SeveredLimbClass( int BodyPart )
{	
	if( BodyPart == BODYPART_HEAD )
		return class'DebrisSkull';
	return None;
}

function PlayDeath( name DamageType )	          
{ 
	PlayAnim( 'z_deadhead', 1.0, 0.1 );
}

function Texture PainSkin( int BodyPart )
{
	return None;
}

function bool BodyPartSeverable( int BodyPart )
{
	if( BodyPart == BODYPART_HEAD )
		return true;
	return false;
}

function EMatterType MatterForJoint( int joint )
{
	return MATTER_FLESH;
}

defaultproperties
{
    StartShield=None
    AmbientWaitSounds(0)=Sound'CreaturesSnd.Zombie.zombieambient01'
    AmbientWaitSounds(1)=Sound'CreaturesSnd.Zombie.zombieambient02'
    AmbientWaitSounds(2)=Sound'CreaturesSnd.Zombie.zombieambient03'
    AmbientFightSounds(0)=Sound'CreaturesSnd.Zombie.zombieattack01'
    AmbientFightSounds(1)=Sound'CreaturesSnd.Zombie.zombieattack01'
    AmbientFightSounds(2)=Sound'CreaturesSnd.Zombie.zombieattack01'
    AmbientFightSoundDelay=8.000000
    Health=225
    MaxHealth=225
    BodyPartHealth(1)=125
    BodyPartHealth(3)=125
    BodyPartHealth(5)=125
    AmbientWaitSoundDelay=9.000000
    AmbientFightSoundDelay=6.000000
    HitSound1=Sound'CreaturesSnd.Zombie.zombiehit02'
    HitSound2=Sound'CreaturesSnd.Zombie.zombie2hit03'
    HitSound3=Sound'CreaturesSnd.Zombie.zombie2hit01'
    Die=Sound'CreaturesSnd.Zombie.zombie2death04'
    Die2=Sound'CreaturesSnd.Zombie.zombie2death03'
    Die3=Sound'CreaturesSnd.Zombie.zombie2death01'
    SkelGroupSkins(0)=Texture'LOTFE_CSkins.ZombiePack.Alric1'
    SkelGroupSkins(1)=Texture'LOTFE_CSkins.ZombiePack.Alric1'
    SkelGroupSkins(2)=Texture'LOTFE_CSkins.ZombiePack.Alric1'
    SkelGroupSkins(3)=Texture'LOTFE_CSkins.ZombiePack.Alric2'
    SkelGroupSkins(4)=Texture'LOTFE_CSkins.ZombiePack.Alric3'
    SkelGroupSkins(5)=Texture'LOTFE_CSkins.ZombiePack.Alric1'
    SkelGroupSkins(6)=Texture'LOTFE_CSkins.ZombiePack.Alric1'
    SkelGroupSkins(8)=Texture'LOTFE_CSkins.ZombiePack.Alric1'
    SkelGroupSkins(10)=Texture'LOTFE_CSkins.ZombiePack.Alric1'
    SkelGroupSkins(11)=Texture'LOTFE_CSkins.ZombiePack.Alric1'
    SkelGroupSkins(13)=Texture'LOTFE_CSkins.ZombiePack.Alric1'
    SkelMesh=7
}
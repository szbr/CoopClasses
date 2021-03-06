//=============================================================================
// HellBerserkerBoss.
//=============================================================================
class HellBerserkerBoss expands Berserker;


function Died( Pawn Killer, name damageType, vector HitLocation )
{
	local Actor A;
	local DebrisCloud DCloud;
	
	DCloud = Spawn( class'DebrisCloud', , , Location );
	DCloud.SetRadius( 36 );
	
	Spawn( class'BlastDestroyEffect', , , Location, rotator( vect( 0, 0, 1 ) ) );
	Spawn( class'FireRadius'		, , , Location, rotator( vect( 0, 0, 1 ) ) );
	Spawn( class'DarkDwarfBlast'	, , , Location, rotator( vect( 0, 0, 1 ) ) );
	Spawn( class'DarkDwarfExplosion', , , Location, rotator( vect( 0, 0, 1 ) ) );
	
	PlaySound( Sound'CreaturesSnd.Dwarves.BossYell02', SLOT_Pain );
	PlaySound( Sound'WeaponsSnd.impcrashes.crashxstone01', SLOT_Misc );
	
    for( i = 0; i < 10; i++ )
        Spawn( class'DebrisStone', , , Location );
    
    if( Event != '' )
		foreach AllActors( class'Actor', A, Event )
			A.Trigger( self, Killer );
	
	Destroy( );
}

function Texture PainSkin(int BodyPart)
{
	switch(BodyPart)
	{
		case BODYPART_TORSO:
			SkelGroupSkins[4] = Texture'LOTFE_CSkins.HellPack.hpitlord2';
			break;
		case BODYPART_HEAD:
			SkelGroupSkins[1] = Texture'LOTFE_CSkins.HellPack.hpitlord3';
			SkelGroupSkins[2] = Texture'LOTFE_CSkins.HellPack.hpitlord3';
			SkelGroupSkins[3] = Texture'LOTFE_CSkins.HellPack.hpitlord3';
			SkelGroupSkins[7] = Texture'LOTFE_CSkins.HellPack.hpitlord3';
			SkelGroupSkins[14] = Texture'LOTFE_CSkins.HellPack.hpitlord3';
			break;
		case BODYPART_LARM1:
			SkelGroupSkins[11] = Texture'LOTFE_CSkins.HellPack.hpitlord5';
			SkelGroupSkins[13] = Texture'LOTFE_CSkins.HellPack.hpitlord5';
			break;
		case BODYPART_RARM1:
			SkelGroupSkins[10] = Texture'LOTFE_CSkins.HellPack.hpitlord5';
			SkelGroupSkins[12] = Texture'LOTFE_CSkins.HellPack.hpitlord5';
			break;
		case BODYPART_LLEG1:
			SkelGroupSkins[6] = Texture'LOTFE_CSkins.HellPack.hpitlord5';
			break;
		case BODYPART_RLEG1:
			SkelGroupSkins[5] = Texture'LOTFE_CSkins.HellPack.hpitlord5';
			break;
	}
	return None;
}

defaultproperties
{
    bIsBoss=True
    StartStowWeapon=None
    StartWeapon=Class'CoopClasses.HellDBA'
    Health=5000
    MaxHealth=5000
    BodyPartHealth(1)=5000
    BodyPartHealth(3)=5000
    BodyPartHealth(5)=5000
    DrawScale=3.000000
    DesiredColorAdjust=(X=255.000000)
    CollisionRadius=72.000000
    CollisionHeight=128.000000
    SkelGroupSkins(1)=Texture'LOTFE_CSkins.HellPack.hpitlord3'
    SkelGroupSkins(2)=Texture'LOTFE_CSkins.HellPack.hpitlord3'
    SkelGroupSkins(3)=Texture'LOTFE_CSkins.HellPack.hpitlord3'
    SkelGroupSkins(4)=Texture'LOTFE_CSkins.HellPack.hpitlord2'
    SkelGroupSkins(5)=Texture'LOTFE_CSkins.HellPack.hpitlord5'
    SkelGroupSkins(6)=Texture'LOTFE_CSkins.HellPack.hpitlord5'
    SkelGroupSkins(7)=Texture'LOTFE_CSkins.HellPack.hpitlord3'
    SkelGroupSkins(10)=Texture'LOTFE_CSkins.HellPack.hpitlord5'
    SkelGroupSkins(11)=Texture'LOTFE_CSkins.HellPack.hpitlord5'
    SkelGroupSkins(12)=Texture'LOTFE_CSkins.HellPack.hpitlord5'
    SkelGroupSkins(13)=Texture'LOTFE_CSkins.HellPack.hpitlord5'
    SkelGroupSkins(14)=Texture'LOTFE_CSkins.HellPack.hpitlord3'
}
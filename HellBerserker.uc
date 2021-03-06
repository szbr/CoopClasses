//=============================================================================
// HellBerserker.
//=============================================================================
class HellBerserker expands Berserker;


function Texture PainSkin( int BodyPart )
{
	switch( BodyPart )
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
    StartStowWeapon=None
    StartWeapon=Class'RuneI.VikingBroadSword'
    Health=800
    MaxHealth=800
    BodyPartHealth(1)=800
    BodyPartHealth(3)=800
    BodyPartHealth(5)=800
    DrawScale=1.500000
    DesiredColorAdjust=(X=255.000000)
    CollisionHeight=69.000000
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
//=============================================================================
// ElderType1.
//=============================================================================
class ElderType1 expands Elder;


function Texture PainSkin(int BodyPart)
{
	switch(BodyPart)
	{
		case BODYPART_TORSO:
			SkelGroupSkins[6] = Texture'LOTFE_CSkins.SZEld.LOTFEszEldBPain';
			break;
		case BODYPART_HEAD:
			SkelGroupSkins[1] = Texture'LOTFE_CSkins.SZEld.LOTFEszEldHPain';
			SkelGroupSkins[7] = Texture'LOTFE_CSkins.SZEld.LOTFEszEldHPain';
			break;
		case BODYPART_LARM1:
			SkelGroupSkins[4] = Texture'LOTFE_CSkins.SZEld.LOTFEszEldHPain';
			break;
		case BODYPART_RARM1:
			SkelGroupSkins[5] = Texture'LOTFE_CSkins.SZEld.LOTFEszEldHPain';
			break;
		case BODYPART_LLEG1:
			SkelGroupSkins[2] = Texture'LOTFE_CSkins.SZEld.LOTFEszEldBPain';
			break;
		case BODYPART_RLEG1:
			SkelGroupSkins[3] = Texture'LOTFE_CSkins.SZEld.LOTFEszEldHPain';
			break;
	}

	return None;
}

function class<Actor> SeveredLimbClass(int BodyPart)
{
	switch(BodyPart)
	{
		case BODYPART_LARM1:
		case BODYPART_RARM1:
			return class'SZEldArm';
		case BODYPART_HEAD:
			return class'SZEldHead';
	}

	return None;
}

defaultproperties
{
    Health=225
    MaxHealth=225
    BodyPartHealth(1)=165
    BodyPartHealth(3)=125
    BodyPartHealth(5)=125
    SkelGroupSkins(1)=Texture'LOTFE_CSkins.SZEld.LOTFEszEldH'
    SkelGroupSkins(2)=Texture'LOTFE_CSkins.SZEld.LOTFEszEldH'
    SkelGroupSkins(3)=Texture'LOTFE_CSkins.SZEld.LOTFEszEldH'
    SkelGroupSkins(4)=Texture'LOTFE_CSkins.SZEld.LOTFEszEldB'
    SkelGroupSkins(5)=Texture'LOTFE_CSkins.SZEld.LOTFEszEldB'
    SkelGroupSkins(6)=Texture'LOTFE_CSkins.SZEld.LOTFEszEldB'
    SkelGroupSkins(7)=Texture'LOTFE_CSkins.SZEld.LOTFEszEldH'
}
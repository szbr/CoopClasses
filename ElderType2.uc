//=============================================================================
// ElderType2.
//=============================================================================
class ElderType2 expands Elder;


function Texture PainSkin(int BodyPart)
{
	switch(BodyPart)
	{
		case BODYPART_TORSO:
			SkelGroupSkins[6] = Texture'LOTFE_CSkins.SZEld.LOTFEszEldB2Pai';
			break;
		case BODYPART_HEAD:
			SkelGroupSkins[1] = Texture'LOTFE_CSkins.SZEld.LOTFEszEldH2Pai';
			SkelGroupSkins[7] = Texture'LOTFE_CSkins.SZEld.LOTFEszEldH2Pai';
			break;
		case BODYPART_LARM1:
			SkelGroupSkins[4] = Texture'LOTFE_CSkins.SZEld.LOTFEszEldH2Pai';
			break;
		case BODYPART_RARM1:
			SkelGroupSkins[5] = Texture'LOTFE_CSkins.SZEld.LOTFEszEldH2Pai';
			break;
		case BODYPART_LLEG1:
			SkelGroupSkins[2] = Texture'LOTFE_CSkins.SZEld.LOTFEszEldB2Pai';
			break;
		case BODYPART_RLEG1:
			SkelGroupSkins[3] = Texture'LOTFE_CSkins.SZEld.LOTFEszEldH2Pai';
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
			return class'SZEldArm2';
		case BODYPART_HEAD:
			return class'SZEldHead2';
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
    SkelGroupSkins(1)=Texture'LOTFE_CSkins.SZEld.LOTFEszEldH2'
    SkelGroupSkins(2)=Texture'LOTFE_CSkins.SZEld.LOTFEszEldH2'
    SkelGroupSkins(3)=Texture'LOTFE_CSkins.SZEld.LOTFEszEldH2'
    SkelGroupSkins(4)=Texture'LOTFE_CSkins.SZEld.LOTFEszEldB2'
    SkelGroupSkins(5)=Texture'LOTFE_CSkins.SZEld.LOTFEszEldB2'
    SkelGroupSkins(6)=Texture'LOTFE_CSkins.SZEld.LOTFEszEldB2'
    SkelGroupSkins(7)=Texture'LOTFE_CSkins.SZEld.LOTFEszEldH2'
}
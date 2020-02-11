//=============================================================================
// ScriptableGladiator1.
//=============================================================================
class ScriptableGladiator1 expands ScriptableGladiator;

//============================================================
//
// PainSkin
//
// returns the pain skin for a given polygroup
//============================================================
function Texture PainSkin(int BodyPart)
{
	switch(BodyPart)
	{
		case BODYPART_TORSO:
			SkelGroupSkins[3] = Texture'g2_torsopain';
			break;
		case BODYPART_HEAD:
			SkelGroupSkins[4] = Texture'g2_headpain';
			break;
		case BODYPART_LARM1:
			SkelGroupSkins[8] = Texture'g2_armpain';
			SkelGroupSkins[5] = Texture'g2_legpain';
			SkelGroupSkins[6] = Texture'g2_legpain';
			break;
		case BODYPART_RARM1:
			SkelGroupSkins[9] = Texture'g2_armpain';
			SkelGroupSkins[10] = Texture'g2_armpain';
			break;
		case BODYPART_LLEG1:
		case BODYPART_RLEG1:
			SkelGroupSkins[2] = Texture'g2_legpain';
			break;
	}

	return None;
}

//================================================
//
// SeveredLimbClass
//
//================================================
function class<Actor> SeveredLimbClass(int BodyPart)
{
	switch(BodyPart)
	{
		case BODYPART_LARM1:
		case BODYPART_RARM1:
			return class'Gladiator2Arm';
		case BODYPART_HEAD:
			return class'Gladiator2Head';
			break;
	}

	return None;
}

defaultproperties
{
    HitSound1=Sound'AddOn.bgladiator.hit01'
    HitSound2=Sound'AddOn.bgladiator.hit02'
    HitSound3=Sound'AddOn.bgladiator.hit03'
    Die=Sound'AddOn.bgladiator.death01'
    Die2=Sound'AddOn.bgladiator.death02'
    Die3=Sound'AddOn.bgladiator.death03'
    SkelGroupSkins(1)=Texture'HallsOfValhalla.g2_arm'
    SkelGroupSkins(2)=Texture'HallsOfValhalla.g2_leg'
    SkelGroupSkins(3)=Texture'HallsOfValhalla.g2_torso'
    SkelGroupSkins(4)=Texture'HallsOfValhalla.g2_head'
    SkelGroupSkins(5)=Texture'HallsOfValhalla.g2_leg'
    SkelGroupSkins(6)=Texture'HallsOfValhalla.g2_leg'
    SkelGroupSkins(7)=Texture'HallsOfValhalla.g2_arm'
    SkelGroupSkins(8)=Texture'HallsOfValhalla.g2_arm'
    SkelGroupSkins(9)=Texture'HallsOfValhalla.g2_arm'
    SkelGroupSkins(10)=Texture'HallsOfValhalla.g2_arm'
    SkelGroupSkins(11)=Texture'HallsOfValhalla.g2_arm'
}
//=============================================================================
// ScriptableGladiator.
//=============================================================================
class ScriptableGladiator expands Viking;

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
			SkelGroupSkins[3] = Texture'Gladiatortorsopain';
			break;
		case BODYPART_HEAD:
			SkelGroupSkins[4] = Texture'Gladiatorheadpain';
			break;
		case BODYPART_LARM1:
			SkelGroupSkins[8] = Texture'Gladiatorarmpain';
			SkelGroupSkins[5] = Texture'Gladiatorlegpain';
			SkelGroupSkins[6] = Texture'Gladiatorlegpain';
			break;
		case BODYPART_RARM1:
			SkelGroupSkins[9] = Texture'Gladiatorarmpain';
			SkelGroupSkins[10] = Texture'Gladiatorarmpain';
			break;
		case BODYPART_LLEG1:
		case BODYPART_RLEG1:
			SkelGroupSkins[2] = Texture'Gladiatorlegpain';
			break;
	}

	return None;
}

//============================================================
//
// BodyPartForPolyGroup
//
//============================================================

function int BodyPartForPolyGroup(int polygroup)
{
	switch(polygroup)
	{
		case 4:						return BODYPART_HEAD;
		case 8:						return BODYPART_LARM1;
		case 9:						return BODYPART_RARM1;
		case 2:						return BODYPART_LLEG1;
		case 1: case 11: case 7:		// Gore caps
		case 3:						return BODYPART_TORSO;
	}
	return BODYPART_BODY;
}

//============================================================
//
// ApplyGoreCap
//
//============================================================
function ApplyGoreCap(int BodyPart)
{
	switch(BodyPart)
	{	// no gore caps exist
		case BODYPART_LARM1:
			SkelGroupSkins[7] = Texture'runefx.gore_bone';
			SkelGroupFlags[7] = SkelGroupFlags[7] & ~POLYFLAG_INVISIBLE;
			break;
		case BODYPART_RARM1:
			SkelGroupSkins[11] = Texture'runefx.gore_bone';
			SkelGroupFlags[11] = SkelGroupFlags[11] & ~POLYFLAG_INVISIBLE;
			break;
		case BODYPART_HEAD:
			SkelGroupSkins[1] = Texture'runefx.gore_bone';
			SkelGroupFlags[1] = SkelGroupFlags[1] & ~POLYFLAG_INVISIBLE;
			break;
	}
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
			return class'GladiatorArm';
		case BODYPART_HEAD:
			return class'GladiatorHead';
			break;
	}

	return None;
}

defaultproperties
{
    SightRadius=9999999.000000
    HitSound1=Sound'AddOn.wgladiator.hit01'
    HitSound2=Sound'AddOn.wgladiator.hit02'
    HitSound3=Sound'AddOn.wgladiator.hit03'
    Die=Sound'AddOn.wgladiator.death01'
    Die2=Sound'AddOn.wgladiator.death02'
    Die3=Sound'AddOn.wgladiator.death03'
    StabJoint=None
    SkelMesh=0
    SubstituteMesh=SkelModel'HallsOfValhalla.Gladiator'    
    StartStowWeapon=Class'RuneI.VikingShortSword'
    AmbientWaitSoundDelay=9.000000
    AmbientFightSoundDelay=6.000000
    StartShield=None
}
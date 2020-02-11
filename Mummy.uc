//=============================================================================
// Mummy.
//=============================================================================
class Mummy expands Zombie;


function int BodyPartForPolyGroup(int polygroup)
{
	switch(polygroup)
	{
		case 4:								return BODYPART_HEAD;
		case 10:							return BODYPART_LARM1;
		case 11:							return BODYPART_RARM1;
		case 2: case 6:						return BODYPART_LLEG1;
		case 1:	case 5:						return BODYPART_RLEG1;
		case 3: case 7: case 9: case 12:
			case 8: case 13:				return BODYPART_TORSO;
	}
	return BODYPART_BODY;
}

function ApplyGoreCap(int BodyPart)
{
	switch(BodyPart)
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

function class<Actor> SeveredLimbClass(int BodyPart)
{
	switch(BodyPart)
	{
		case BODYPART_LARM1:
			return class'ZombieLArm';
		case BODYPART_RARM1:
			return class'ZombieRArm';
		case BODYPART_HEAD:
			return class'MummyHead';
	}
	return None;
}

defaultproperties
{
    SkelMesh=7
    SkelGroupSkins(0)=Texture'LOTFE_CSkins.Mummy.mummyarm'
    SkelGroupSkins(1)=Texture'LOTFE_CSkins.Mummy.mummyarm'
    SkelGroupSkins(2)=Texture'LOTFE_CSkins.Mummy.mummyarm'
    SkelGroupSkins(3)=Texture'LOTFE_CSkins.Mummy.mummyarm'
    SkelGroupSkins(4)=Texture'LOTFE_CSkins.Mummy.mummybody'
    SkelGroupSkins(5)=Texture'LOTFE_CSkins.Mummy.mummyhead'
    SkelGroupSkins(6)=Texture'LOTFE_CSkins.Mummy.mummyarm'
    SkelGroupSkins(7)=Texture'LOTFE_CSkins.Mummy.mummyarm'
    SkelGroupSkins(8)=Texture'LOTFE_CSkins.Mummy.mummyarm'
    SkelGroupSkins(9)=Texture'LOTFE_CSkins.Mummy.mummyhead'
    SkelGroupSkins(10)=Texture'LOTFE_CSkins.Mummy.mummybody'
    SkelGroupSkins(11)=Texture'LOTFE_CSkins.Mummy.mummyarm'
    SkelGroupSkins(12)=Texture'LOTFE_CSkins.Mummy.mummyarm'
    SkelGroupSkins(13)=Texture'LOTFE_CSkins.Mummy.mummyarm'
    SkelGroupSkins(14)=Texture'LOTFE_CSkins.Mummy.mummyarm'
    SkelGroupSkins(15)=Texture'LOTFE_CSkins.Mummy.mummyarm'
}
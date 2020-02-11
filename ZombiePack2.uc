//=============================================================================
// ZombiePack2.
//=============================================================================
class ZombiePack2 expands ZombiePack;


function int BodyPartForPolyGroup(int polygroup)
{
	switch(polygroup)
	{
		case 13:							return BODYPART_HEAD;
		case 11: 							return BODYPART_LARM1;
		case 7: 							return BODYPART_RARM1;
		case 2: case 9:						return BODYPART_LLEG1;
		case 1:	case 5:						return BODYPART_RLEG1;
		case 3: case 4: case 6: case 8: 
			case 10: case 12: 				return BODYPART_TORSO;
	}
	return BODYPART_BODY;
}

function ApplyGoreCap(int BodyPart)
{
	switch(BodyPart)
	{
		case BODYPART_LARM1:
			SkelGroupSkins[10] = Texture'runefx.gore_bone';
			SkelGroupFlags[10] = SkelGroupFlags[10] & ~POLYFLAG_INVISIBLE;
			break;
		case BODYPART_RARM1:
			SkelGroupSkins[6] = Texture'runefx.gore_bone';
			SkelGroupFlags[6] = SkelGroupFlags[6] & ~POLYFLAG_INVISIBLE;
			break;
		case BODYPART_HEAD:
			SkelGroupSkins[4] = Texture'runefx.gore_bone';
			SkelGroupFlags[4] = SkelGroupFlags[4] & ~POLYFLAG_INVISIBLE;
			break;
	}
}

defaultproperties
{
     SkelMesh=9
     SkelGroupSkins(0)=Texture'LOTFE_CSkins.ZombiePack.Ulf2'
     SkelGroupSkins(1)=Texture'LOTFE_CSkins.ZombiePack.Ulf2'
     SkelGroupSkins(2)=Texture'LOTFE_CSkins.ZombiePack.Ulf2'
     SkelGroupSkins(3)=Texture'LOTFE_CSkins.ZombiePack.Ulf3'
     SkelGroupSkins(4)=Texture'LOTFE_CSkins.ZombiePack.Ulf2'
     SkelGroupSkins(5)=Texture'LOTFE_CSkins.ZombiePack.Ulf2'
     SkelGroupSkins(6)=Texture'LOTFE_CSkins.ZombiePack.Ulf2'
     SkelGroupSkins(7)=Texture'LOTFE_CSkins.ZombiePack.Ulf2'
     SkelGroupSkins(8)=Texture'LOTFE_CSkins.ZombiePack.Ulf2'
     SkelGroupSkins(9)=Texture'LOTFE_CSkins.ZombiePack.Ulf2'
     SkelGroupSkins(10)=Texture'LOTFE_CSkins.ZombiePack.Ulf2'
     SkelGroupSkins(11)=Texture'LOTFE_CSkins.ZombiePack.Ulf2'
     SkelGroupSkins(12)=Texture'LOTFE_CSkins.ZombiePack.Ulf2'
     SkelGroupSkins(13)=Texture'LOTFE_CSkins.ZombiePack.Ulf1'
     SkelGroupSkins(14)=Texture'LOTFE_CSkins.ZombiePack.Ulf2'
}
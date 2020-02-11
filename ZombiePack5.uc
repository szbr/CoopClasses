//=============================================================================
// ZombiePack5.
//=============================================================================
class ZombiePack5 expands ZombiePack;


function int BodyPartForPolyGroup(int polygroup)
{
	switch(polygroup)
	{
		case 1: case 2: case 3: case 14:	return BODYPART_HEAD;
		case 13:							return BODYPART_LARM1;
		case 12:							return BODYPART_RARM1;
		case 6:								return BODYPART_LLEG1;
		case 5:								return BODYPART_RLEG1;
		case 4: case 7: case 8: case 9:
		case 10: case 11: case 15:			return BODYPART_TORSO;
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
			SkelGroupSkins[8] = Texture'runefx.gore_bone';
			SkelGroupFlags[8] = SkelGroupFlags[8] & ~POLYFLAG_INVISIBLE;
			break;
		case BODYPART_HEAD:
			SkelGroupSkins[15] = Texture'players.ragnarb_neckgore';
			SkelGroupFlags[15] = SkelGroupFlags[15] & ~POLYFLAG_INVISIBLE;
			break;
	}
}

defaultproperties
{
     SkelMesh=2
     SkelGroupSkins(0)=Texture'LOTFE_CSkins.ZombiePack.Berserker1'
     SkelGroupSkins(1)=Texture'LOTFE_CSkins.ZombiePack.Berserker3'
     SkelGroupSkins(2)=Texture'LOTFE_CSkins.ZombiePack.Berserker3'
     SkelGroupSkins(3)=Texture'LOTFE_CSkins.ZombiePack.Berserker3'
     SkelGroupSkins(4)=Texture'LOTFE_CSkins.ZombiePack.Berserker2'
     SkelGroupSkins(5)=Texture'LOTFE_CSkins.ZombiePack.Berserker1'
     SkelGroupSkins(6)=Texture'LOTFE_CSkins.ZombiePack.Berserker1'
     SkelGroupSkins(7)=Texture'LOTFE_CSkins.ZombiePack.Berserker3'
     SkelGroupSkins(8)=Texture'LOTFE_CSkins.ZombiePack.Berserker1'
     SkelGroupSkins(9)=Texture'LOTFE_CSkins.ZombiePack.Berserker1'
     SkelGroupSkins(10)=Texture'LOTFE_CSkins.ZombiePack.Berserker1'
     SkelGroupSkins(11)=Texture'LOTFE_CSkins.ZombiePack.Berserker1'
     SkelGroupSkins(12)=Texture'LOTFE_CSkins.ZombiePack.Berserker1'
     SkelGroupSkins(13)=Texture'LOTFE_CSkins.ZombiePack.Berserker1'
}
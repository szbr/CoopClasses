//=============================================================================
// ZombiePack4.
//=============================================================================
class ZombiePack4 expands ZombiePack;


function int BodyPartForPolyGroup(int polygroup)
{
	switch(polygroup)
	{
		case 7:								return BODYPART_HEAD;
		case 4: 							return BODYPART_LARM1;
		case 5: 							return BODYPART_RARM1;
		case 2:								return BODYPART_LLEG1;
		case 3:								return BODYPART_RLEG1;
		case 1: case 6: case 8:				return BODYPART_TORSO;
	}
	return BODYPART_BODY;
}

function ApplyGoreCap(int BodyPart)
{
	switch(BodyPart)
	{
		case BODYPART_HEAD:
			SkelGroupSkins[8] = Texture'runefx.gore_bone';
			SkelGroupFlags[8] = SkelGroupFlags[8] & ~POLYFLAG_INVISIBLE;
			break;
	}
}

defaultproperties
{
     SkelMesh=15
     SkelGroupSkins(0)=None
     SkelGroupSkins(1)=Texture'LOTFE_CSkins.ZombiePack.Elder2'
     SkelGroupSkins(2)=Texture'LOTFE_CSkins.ZombiePack.Elder2'
     SkelGroupSkins(3)=Texture'LOTFE_CSkins.ZombiePack.Elder2'
     SkelGroupSkins(4)=Texture'LOTFE_CSkins.ZombiePack.Elder1'
     SkelGroupSkins(5)=Texture'LOTFE_CSkins.ZombiePack.Elder1'
     SkelGroupSkins(6)=Texture'LOTFE_CSkins.ZombiePack.Elder1'
     SkelGroupSkins(7)=Texture'LOTFE_CSkins.ZombiePack.Elder2'
     SkelGroupSkins(8)=None
     SkelGroupSkins(10)=None
     SkelGroupSkins(11)=None
     SkelGroupSkins(13)=None
}
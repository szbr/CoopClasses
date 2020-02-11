//=============================================================================
// ZombiePack6.
//=============================================================================
class ZombiePack6 expands ZombiePack;


function int BodyPartForPolyGroup(int polygroup)
{
	switch(polygroup)
	{
		case 10:							return BODYPART_HEAD;
		case 11:							return BODYPART_LARM1;
		case 4: 							return BODYPART_RARM1;
		case 3:								return BODYPART_LLEG1;
		case 1:								return BODYPART_RLEG1;
		case 2: case 5: case 6: case 7:
			case 8: case 9: 				return BODYPART_TORSO;
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

defaultproperties
{
     SkelMesh=5
     SkelGroupSkins(0)=Texture'LOTFE_CSkins.ZombiePack.LokiGuard3'
     SkelGroupSkins(1)=Texture'LOTFE_CSkins.ZombiePack.LokiGuard3'
     SkelGroupSkins(2)=Texture'LOTFE_CSkins.ZombiePack.LokiGuard1'
     SkelGroupSkins(3)=Texture'LOTFE_CSkins.ZombiePack.LokiGuard3'
     SkelGroupSkins(4)=Texture'LOTFE_CSkins.ZombiePack.LokiGuard4'
     SkelGroupSkins(5)=Texture'LOTFE_CSkins.ZombiePack.LokiGuard4'
     SkelGroupSkins(6)=Texture'LOTFE_CSkins.ZombiePack.LokiGuard3'
     SkelGroupSkins(8)=Texture'LOTFE_CSkins.ZombiePack.LokiGuard4'
     SkelGroupSkins(10)=Texture'LOTFE_CSkins.ZombiePack.LokiGuard2'
     SkelGroupSkins(11)=Texture'LOTFE_CSkins.ZombiePack.LokiGuard4'
     SkelGroupSkins(13)=Texture'LOTFE_CSkins.ZombiePack.LokiGuard3'
}
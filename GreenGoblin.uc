//=============================================================================
// GreenGoblin.
//
// - Skins by MinYS
//
//=============================================================================
class GreenGoblin expands Goblin;


// No paint skins.
function SetupGoblin( )
{
	if( bGoblinMask )
		AttachMask( );
}

function class<Actor> SeveredLimbClass( int BodyPart )
{
	switch( BodyPart )
	{
		case BODYPART_LARM1:
			return class'GreenGoblinLArm';
		case BODYPART_RARM1:
			return class'GreenGoblinRArm';
		case BODYPART_HEAD:
			return class'GreenGoblinHead';
	}
	return none;
}

function Texture PainSkin( int BodyPart )
{
	switch( BodyPart )
	{
		case BODYPART_TORSO:
			SkelGroupSkins[7] = Texture'LOTFE_CSkins.GreenGoblinLotf.greentest';
			break;
		case BODYPART_HEAD:
			SkelGroupSkins[1] = Texture'LOTFE_CSkins.GreenGoblinLotf.greenfej';
			SkelGroupSkins[6] = Texture'LOTFE_CSkins.GreenGoblinLotf.greenfej';
			break;
		case BODYPART_LARM1:
			SkelGroupSkins[2] = Texture'LOTFE_CSkins.GreenGoblinLotf.greenkezeklabak';
			SkelGroupSkins[8] = Texture'LOTFE_CSkins.GreenGoblinLotf.greenkezeklabak';
			break;
		case BODYPART_RARM1:
			SkelGroupSkins[11] = Texture'LOTFE_CSkins.GreenGoblinLotf.greenkezeklabak';
			SkelGroupSkins[12] = Texture'LOTFE_CSkins.GreenGoblinLotf.greenkezeklabak';
			break;
		case BODYPART_LLEG1:
			SkelGroupSkins[3] = Texture'LOTFE_CSkins.GreenGoblinLotf.greenkezeklabak';
			break;
		case BODYPART_RLEG1:
			SkelGroupSkins[4] = Texture'LOTFE_CSkins.GreenGoblinLotf.greenkezeklabak';
			break;
	}
	return none;
}

defaultproperties
{
    Health=400
    MaxHealth=400
    BodyPartHealth(1)=350
    BodyPartHealth(3)=350
    BodyPartHealth(5)=360
    SkelGroupSkins(1)=Texture'LOTFE_CSkins.GreenGoblinLotf.greenfej'
    SkelGroupSkins(2)=Texture'LOTFE_CSkins.GreenGoblinLotf.greenkezeklabak'
    SkelGroupSkins(3)=Texture'LOTFE_CSkins.GreenGoblinLotf.greenkezeklabak'
    SkelGroupSkins(4)=Texture'LOTFE_CSkins.GreenGoblinLotf.greenkezeklabak'
    SkelGroupSkins(5)=Texture'LOTFE_CSkins.GreenGoblinLotf.greenkezeklabak'
    SkelGroupSkins(6)=Texture'LOTFE_CSkins.GreenGoblinLotf.greenfej'
    SkelGroupSkins(7)=Texture'LOTFE_CSkins.GreenGoblinLotf.greentest'
    SkelGroupSkins(8)=Texture'LOTFE_CSkins.GreenGoblinLotf.greenkezeklabak'
    SkelGroupSkins(9)=Texture'LOTFE_CSkins.GreenGoblinLotf.greenkezeklabak'
    SkelGroupSkins(11)=Texture'LOTFE_CSkins.GreenGoblinLotf.greenkezeklabak'
    SkelGroupSkins(12)=Texture'LOTFE_CSkins.GreenGoblinLotf.greenkezeklabak'
}
//=============================================================================
// GreenWarrior.
//=============================================================================
class GreenWarrior expands GoblinWarrior;


// No paint skins.
function SetupGoblin( )
{
	if( bGoblinMask )
		AttachMask( );
}

function bool BodyPartSeverable( int BodyPart )
{
	return false;
}

function Texture PainSkin( int BodyPart )
{
	return None;
}

function EMatterType MatterForJoint( int Joint )
{
	return MATTER_Wood;
}

defaultproperties
{
    Health=400
    MaxHealth=400
    BodyPartHealth(1)=350
    BodyPartHealth(3)=350
    BodyPartHealth(5)=360
    SkelGroupSkins(0)=Texture'Wood.DOR2_d'
    SkelGroupSkins(1)=Texture'Wood.DOR2_d'
    SkelGroupSkins(2)=Texture'Wood.DOR2_d'
    SkelGroupSkins(3)=Texture'Wood.DOR2_d'
    SkelGroupSkins(4)=Texture'Wood.DOR2_d'
    SkelGroupSkins(5)=Texture'Wood.DOR2_d'
    SkelGroupSkins(6)=Texture'Wood.DOR2_d'
    SkelGroupSkins(7)=Texture'Wood.DOR2_d'
    SkelGroupSkins(8)=Texture'Wood.DOR2_d'
    SkelGroupSkins(9)=Texture'Wood.DOR2_d'
    SkelGroupSkins(10)=Texture'Wood.DOR2_d'
    SkelGroupSkins(11)=Texture'Wood.DOR2_d'
    SkelGroupSkins(13)=Texture'Wood.DOR2_d'
    SkelGroupSkins(14)=Texture'Wood.DOR2_d'
    SkelGroupSkins(15)=Texture'Wood.DOR2_d'
}
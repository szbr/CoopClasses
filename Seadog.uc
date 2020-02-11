//=============================================================================
// Seadog:
//		- Voice acting by MinYs, sound edited by Voy.
//		- Textures by MinYs.
//=============================================================================
class Seadog expands ScriptableTownRagnar;


function Texture PainSkin( int BodyPart )
{
	return None;
}

function bool BodyPartSeverable( int BodyPart )
{
	return false;
}

defaultproperties
{
    StartStowWeapon=Class'RuneI.DwarfBattleAxe'
    StartShield=None
    AttitudeToPlayer=ATTITUDE_Ignore
    bSweepable=False
    SkelGroupSkins(0)=Texture'LOTFE_CSkins.Pirate.kalozlabak'
    SkelGroupSkins(1)=Texture'LOTFE_CSkins.Pirate.kalozlabak'
    SkelGroupSkins(2)=Texture'LOTFE_CSkins.Pirate.kalozlabak'
    SkelGroupSkins(3)=Texture'LOTFE_CSkins.Pirate.kalozlabak'
    SkelGroupSkins(4)=Texture'LOTFE_CSkins.Pirate.kalozlabak'
    SkelGroupSkins(5)=Texture'LOTFE_CSkins.Pirate.kalozlabak'
    SkelGroupSkins(6)=Texture'LOTFE_CSkins.Pirate.kalozlabak'
    SkelGroupSkins(7)=Texture'LOTFE_CSkins.Pirate.kalozfej'
    SkelGroupSkins(8)=Texture'LOTFE_CSkins.Pirate.kaloztest'
    SkelGroupSkins(9)=Texture'LOTFE_CSkins.Pirate.kalozlabak'
    SkelGroupSkins(10)=Texture'LOTFE_CSkins.Pirate.kalozlabak'
    SkelGroupSkins(11)=Texture'LOTFE_CSkins.Pirate.kalozlabak'
    SkelGroupSkins(12)=Texture'LOTFE_CSkins.Pirate.kalozlabak'
    SkelGroupSkins(13)=Texture'LOTFE_CSkins.Pirate.kalozlabak'
    SkelGroupSkins(14)=Texture'LOTFE_CSkins.Pirate.kalozlabak'
    SkelGroupSkins(15)=Texture'LOTFE_CSkins.Pirate.kalozlabak'
}
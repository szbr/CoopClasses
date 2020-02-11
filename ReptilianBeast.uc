//=============================================================================
// ReptilianBeast.
//  - Skins by MinYs.
//
//=============================================================================
class ReptilianBeast expands SnowBeast;


function Breath( )
{
	local ZombieBreath B;

	if( HeadRegion.Zone.bWaterZone && ( FRand( ) < 0.33 ) )
    {
		Spawn( class'BubbleSystemOneShot', , , GetJointPos( JointNamed( 'llip' ) ) );
	}
	else
	{
		SoundChance( BreathSound, 1.0, SLOT_Talk );

		B = Spawn( class'LOTFEZombieBreath', self, , GetJointPos( JointNamed( 'llip' ) ) );
		B.ScaleMin = 0.2;
		B.ScaleMax = 1.200000;
	}
}

function Texture PainSkin( int BodyPart )
{
	switch(BodyPart)
	{
		case BODYPART_HEAD:
			SkelGroupSkins[2] = Texture'LOTFE_CSkins.ReptilianBeast.sbtestbloody2';
			SkelGroupSkins[9] = Texture'LOTFE_CSkins.ReptilianBeast.sbtestbloody1';
			SkelGroupSkins[5] = Texture'LOTFE_CSkins.ReptilianBeast.sbtestbloody2';
			SkelGroupSkins[6] = Texture'LOTFE_CSkins.ReptilianBeast.sbtestbloody2';
			break;
		case BODYPART_TORSO:
			SkelGroupSkins[4] = Texture'LOTFE_CSkins.ReptilianBeast.sbtestbloody2';
			SkelGroupSkins[7] = Texture'LOTFE_CSkins.ReptilianBeast.sbtestbloody1';
			break;
		case BODYPART_LARM1:
			SkelGroupSkins[10] = Texture'LOTFE_CSkins.ReptilianBeast.sblabbloody1';
			break;
		case BODYPART_RARM1:
			SkelGroupSkins[1] = Texture'LOTFE_CSkins.ReptilianBeast.sblabbloody2';
			break;
		case BODYPART_LLEG1:
			SkelGroupSkins[8] = Texture'LOTFE_CSkins.ReptilianBeast.sblabbloody1';
			break;
		case BODYPART_RLEG1:
			SkelGroupSkins[3] = Texture'LOTFE_CSkins.ReptilianBeast.sblabbloody2';
			break;
	}
	return None;
}

defaultproperties
{
    SkelGroupSkins(0)=Texture'LOTFE_CSkins.ReptilianBeast.snowbeastlab'
    SkelGroupSkins(1)=Texture'LOTFE_CSkins.ReptilianBeast.snowbeastlab'
    SkelGroupSkins(2)=Texture'LOTFE_CSkins.ReptilianBeast.snowbeasttest'
    SkelGroupSkins(3)=Texture'LOTFE_CSkins.ReptilianBeast.snowbeastlab'
    SkelGroupSkins(4)=Texture'LOTFE_CSkins.ReptilianBeast.snowbeasttest'
    SkelGroupSkins(5)=Texture'LOTFE_CSkins.ReptilianBeast.snowbeasttest'
    SkelGroupSkins(6)=Texture'LOTFE_CSkins.ReptilianBeast.snowbeasttest'
    SkelGroupSkins(7)=Texture'LOTFE_CSkins.ReptilianBeast.snowbeasttest'
    SkelGroupSkins(8)=Texture'LOTFE_CSkins.ReptilianBeast.snowbeastlab'
    SkelGroupSkins(9)=Texture'LOTFE_CSkins.ReptilianBeast.snowbeasttest'
    SkelGroupSkins(10)=Texture'LOTFE_CSkins.ReptilianBeast.snowbeastlab'
    SkelGroupSkins(11)=Texture'LOTFE_CSkins.ReptilianBeast.snowbeastlab'
    SkelGroupSkins(12)=Texture'LOTFE_CSkins.ReptilianBeast.snowbeastlab'
    SkelGroupSkins(13)=Texture'LOTFE_CSkins.ReptilianBeast.snowbeastlab'
    SkelGroupSkins(14)=Texture'LOTFE_CSkins.ReptilianBeast.snowbeastlab'
    SkelGroupSkins(15)=Texture'LOTFE_CSkins.ReptilianBeast.snowbeastlab'
}
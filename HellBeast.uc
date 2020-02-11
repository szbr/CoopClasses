//=============================================================================
// HellBeast.
//=============================================================================
class HellBeast expands SnowBeast;


function Breath( )
{
	local HellBeastBreath B;

	if( HeadRegion.Zone.bWaterZone && ( FRand( ) < 0.33 ) )
    {
		Spawn( class'BubbleSystemOneShot', , , GetJointPos( JointNamed( 'llip' ) ) );
	}
	else
	{
		SoundChance( BreathSound, 1.0, SLOT_Talk );

		B = Spawn( class'HellBeastBreath', , , GetJointPos( JointNamed( 'llip' ) ) );
		B.ScaleMin = 0.2;
		B.ScaleMax = 1.200000;
	}
}

function PostBeginPlay( )
{
    local Fire f;
    
    f = Spawn( class'Fire' );
    if( f == None )
        return;
    
	AttachActorToJoint( f, JointNamed( 'offset' ) );
	
	bUnlit = true;
	
	LightType 		= LT_Steady;
    LightEffect 	= LE_None;
    LightBrightness = 255;
    LightHue 		= 10;
    LightSaturation = 10;
    LightRadius 	= 16;
}

function Texture PainSkin( int BodyPart )
{
	return None;
}

function Died( Pawn Killer, name damageType, vector HitLocation )
{
	local DebrisLava chunk;
    local torchfire tf;
	local Actor A;
	
	Spawn( class'FireRadius', , , Location, rotator( vect( 0, 0, 1 ) ) );
	Spawn( class'SpiderBotExplosion', , , Location );
	PlaySound( Sound'WeaponsSnd.impcrashes.crashmetal04', SLOT_Pain );
    for( i = 0; i < 6; i++ )
    {
        chunk = Spawn( class'DebrisLava', , , Location );
        if( chunk != None )
        {
            tf = Spawn( class'TorchFire' );
            if( tf != None )
                chunk.AttachActorToJoint( tf, JointNamed( 'offset' ) );
        }
    }
    
    if( Event != '' )
		foreach AllActors( class'Actor', A, Event )
			A.Trigger( self, Killer );
	
	Destroy( );
}

function bool JointDamaged( int Damage, Pawn EventInstigator, vector HitLoc, 
							vector Momentum, name DamageType, int Joint )
{
	local int Rnd;
	
	Rnd = Rand( 3 );
	if( Rnd == 0 )
		PlaySound( HitSound1, SLOT_Pain );
	else if( Rnd == 1 )
		PlaySound( HitSound2, SLOT_Pain );
	else
		PlaySound( HitSound3, SLOT_Pain );
		
	Super.JointDamaged( Damage, EventInstigator, HitLoc, Momentum, DamageType, Joint );
}

function EMatterType MatterForJoint( int joint )
{
	return MATTER_NONE;
}

defaultproperties
{
    HitSound1=Sound'CreaturesSnd.SnowBeast.beasthit05'
    HitSound2=Sound'CreaturesSnd.SnowBeast.beastyell12'
    HitSound3=Sound'CreaturesSnd.SnowBeast.beastyell06'
    SkelGroupSkins(0)=WetTexture'CoopTextures.unrLavaAM'
    SkelGroupSkins(1)=WetTexture'CoopTextures.unrLavaAM'
    SkelGroupSkins(2)=WetTexture'CoopTextures.unrLavaAM'
    SkelGroupSkins(3)=WetTexture'CoopTextures.unrLavaAM'
    SkelGroupSkins(4)=WetTexture'CoopTextures.unrLavaAM'
    SkelGroupSkins(5)=WetTexture'CoopTextures.unrLavaAM'
    SkelGroupSkins(6)=WetTexture'CoopTextures.unrLavaAM'
    SkelGroupSkins(7)=WetTexture'CoopTextures.unrLavaAM'
    SkelGroupSkins(8)=WetTexture'CoopTextures.unrLavaAM'
    SkelGroupSkins(9)=WetTexture'CoopTextures.unrLavaAM'
    SkelGroupSkins(10)=WetTexture'CoopTextures.unrLavaAM'
}
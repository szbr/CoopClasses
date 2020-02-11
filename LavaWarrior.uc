//=============================================================================
// LavaWarrior.
//=============================================================================
class LavaWarrior expands Viking;


function PostBeginPlay( )
{
    local Fire f;
    
    f = Spawn( class'Fire' );
    if( f == None )
        return;
    
	AttachActorToJoint( f, JointNamed( 'offset' ) );
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

function bool BodyPartSeverable(int BodyPart)
{
	return false;
}

function EMatterType MatterForJoint(int joint)
{
	return MATTER_NONE;
}

defaultproperties
{
    bUnlit=True
	LightType=LT_Steady
    LightEffect=LE_None
    LightBrightness=255
    LightHue=10
    LightSaturation=10
    LightRadius=16
    StartShield=None
    Health=250
    MaxHealth=250
    HitSound1=Sound'WeaponsSnd.ImpFlesh.impactflesh01'
    HitSound2=Sound'WeaponsSnd.ImpFlesh.impactflesh02'
    HitSound3=Sound'WeaponsSnd.ImpFlesh.impactflesh03'
    Die=None
    Die2=None
    Die3=None
    AmbientWaitSoundDelay=9.000000
    AmbientFightSoundDelay=6.000000
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
    SkelGroupSkins(11)=WetTexture'CoopTextures.unrLavaAM'
    SkelGroupSkins(12)=WetTexture'CoopTextures.unrLavaAM'
    SkelGroupSkins(13)=WetTexture'CoopTextures.unrLavaAM'
    SkelGroupSkins(14)=WetTexture'CoopTextures.unrLavaAM'
    SkelGroupSkins(15)=WetTexture'CoopTextures.unrLavaAM'
}
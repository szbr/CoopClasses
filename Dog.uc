//=============================================================================
// Dog.
//=============================================================================
class Dog expands SnowBeast;


var( ) bool bGuardDog;


function PostBeginPlay( )
{
    Super.PostBeginPlay( );

    if( bGuardDog )
        GotoState( 'Guard' );
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
		
	return Super.JointDamaged( Damage, EventInstigator, HitLoc, Momentum, DamageType, Joint );
}

state Guard
{
	function BeginState( )
	{
		AttitudeToPlayer = ATTITUDE_Ignore;
		PlayWaiting( 0.1 );
	}
	
	function Trigger( Actor Other, Pawn EventInstigator )
	{
        AttitudeToPlayer = ATTITUDE_Hate;
        GotoState( 'Waiting' );
	}

Begin:
	if( FRand( ) > 0.5f )
		PlaySound( Sound'LOTFEmisc.nyoszorog', SLOT_Talk );
	else
		PlaySound( Sound'LOTFEmisc.szimatol', SLOT_Talk );
	Sleep( 4 + Rand( 2 ) );
	Goto( 'Begin' );
}

defaultproperties
{
    bGuardDog=True
    HowlingSound=Sound'LOTFEmisc.Dog.nyoszorog'
    BreathSound=None
    AcquireSound=Sound'LOTFEmisc.Dog.ugatmerges'
    AmbientFightSounds(0)=Sound'LOTFEmisc.Dog.harap2'
    AmbientFightSounds(1)=Sound'LOTFEmisc.Dog.harap3'
    AmbientFightSounds(2)=Sound'LOTFEmisc.Dog.ugatmerges'
    FootStepWood(0)=None
    FootStepWood(1)=None
    FootStepWood(2)=None
    FootStepMetal(0)=None
    FootStepMetal(1)=None
    FootStepMetal(2)=None
    FootStepStone(0)=None
    FootStepStone(1)=None
    FootStepStone(2)=None
    FootStepFlesh(0)=None
    FootStepFlesh(1)=None
    FootStepFlesh(2)=None
    FootStepIce(0)=None
    FootStepIce(1)=None
    FootStepIce(2)=None
    FootStepEarth(0)=None
    FootStepEarth(1)=None
    FootStepEarth(2)=None
    FootStepSnow(0)=None
    FootStepSnow(1)=None
    FootStepSnow(2)=None
    LandSoundWood=None
    LandSoundMetal=None
    LandSoundStone=None
    LandSoundFlesh=None
    LandSoundIce=None
    LandSoundSnow=None
    LandSoundEarth=None
    LandSoundWater=None
    LandSoundMud=None
    LandSoundLava=None
    DrawScale=0.750000
    CollisionRadius=30.000000
    CollisionHeight=35.250000
}
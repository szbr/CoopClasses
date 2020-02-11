//=============================================================================
// MummyBoss.
//=============================================================================
class MummyBoss expands Mummy;


var int HeadHP;

replication
{
    reliable if( Role == ROLE_Authority )
        HeadHP;
}

function PostBeginPlay( )
{
    Super.PostBeginPlay( );
    
    HeadHP = BodyPartHealth[5];
}

function bool DamageBodyPart( int Damage, Pawn EventInstigator, vector HitLocation, vector Momentum, name DamageType, int bodypart )
{
    Super.DamageBodyPart( Damage, EventInstigator, HitLocation, Momentum, DamageType, bodypart );
    
    HeadHP = BodyPartHealth[5];
}


state Pain
{
	function StartGetUpEffect( )
	{
		local vector loc;

		DesiredColorAdjust.X = 0;
		DesiredColorAdjust.Y = 128;
		DesiredColorAdjust.Z = 51;

		loc = Location;
		loc.Z -= CollisionHeight;
		
		Spawn( class'GroundDust', , , loc, );

		LightType = LT_Steady;
		LightEffect = LE_None;
		LightBrightness = 230;
		LightHue = 53;
		LightSaturation = 20;
		LightRadius = 10;

		if( Eyes != None )
		{
			Eyes.bHidden = false;
		}

		PlaySound( Sound'laugh12', SLOT_Talk );
	}
	
Begin:
	bRotateTorso = false;
	bRotateHead = false;

	GlowEyes( false );

	if( PainDelay < 0 )
	{
		FinishAnim( );
	}
	else
	{
		Sleep( PainDelay );
	}
	
	Sleep( 0.2f );

	bRotateTorso = true;
	bRotateHead = true;

	StartGetUpEffect( );

	PlayAnim( 'z_getup', 1.0, 0.1 );
	FinishAnim( );

	GotoState( NextStateAfterPain );
}

function class<Actor> SeveredLimbClass( int BodyPart )
{
	if( BodyPart == BODYPART_HEAD )
		return class'MummyHead2';
	return None;
}

defaultproperties
{
    bIsBoss=True
    DecapitateSound=Sound'VoiceOverSnd.Loki.damnyou'
    Health=2500
    MaxHealth=2500
    BodyPartHealth(1)=2500
    BodyPartHealth(3)=2500
    BodyPartHealth(5)=2500
    Die=Sound'VoiceOverSnd.Loki.damnyou'
    Die2=Sound'VoiceOverSnd.Loki.damnyou'
    Die3=Sound'VoiceOverSnd.Loki.damnyou'
    SkelGroupSkins(0)=Texture'LOTFE_CSkins.Mummy.mummyarm2'
    SkelGroupSkins(1)=Texture'LOTFE_CSkins.Mummy.mummyarm2'
    SkelGroupSkins(2)=Texture'LOTFE_CSkins.Mummy.mummyarm2'
    SkelGroupSkins(3)=Texture'LOTFE_CSkins.Mummy.mummyarm2'
    SkelGroupSkins(4)=Texture'LOTFE_CSkins.Mummy.mummybody2'
    SkelGroupSkins(5)=Texture'LOTFE_CSkins.Mummy.mummyhead2'
    SkelGroupSkins(6)=Texture'LOTFE_CSkins.Mummy.mummyarm2'
    SkelGroupSkins(7)=Texture'LOTFE_CSkins.Mummy.mummyarm2'
    SkelGroupSkins(8)=Texture'LOTFE_CSkins.Mummy.mummyarm2'
    SkelGroupSkins(9)=Texture'LOTFE_CSkins.Mummy.mummyhead2'
    SkelGroupSkins(10)=Texture'LOTFE_CSkins.Mummy.mummybody2'
    SkelGroupSkins(11)=Texture'LOTFE_CSkins.Mummy.mummyarm2'
    SkelGroupSkins(12)=Texture'LOTFE_CSkins.Mummy.mummyarm2'
    SkelGroupSkins(13)=Texture'LOTFE_CSkins.Mummy.mummyarm2'
    SkelGroupSkins(14)=Texture'LOTFE_CSkins.Mummy.mummyarm2'
    SkelGroupSkins(15)=Texture'LOTFE_CSkins.Mummy.mummyarm2'
}
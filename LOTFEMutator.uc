//=============================================================================
// LOTFEMutator.
//=============================================================================
class LOTFEMutator expands Mutator;


const volume = 0.5f;

var bool bRegistered;
var PlayerPawn PlayerOwner;
var int MsgTime;
var bool bHeardSound;
var name BossNames[5];


function Mutate( string MutateString, PlayerPawn Sender )
{
	Super.Mutate( MutateString, Sender );
	
    if( MutateString == "maps" )
	{
		PrintMapList( Sender );
	}
    else if( Left( MutateString, 3 ) == "map" )
	{
		SwitchMap( Sender, int( Mid( MutateString, 4 ) ) );
	}
}

function PreBeginPlay( )
{
	if( !bRegistered )
	{
		self.NextMutator = Level.Game.BaseMutator.NextMutator;
		Level.Game.BaseMutator.NextMutator = self;
		bRegistered = true;
	}
}

simulated function Tick( float DeltaTime )
{
	if( !bHUDMutator )
    {
        RegisterHUDMutator( );
    }
}

simulated function RegisterHUDMutator( )
{
    local PlayerPawn PPawn;
	
	foreach AllActors( class'PlayerPawn', PPawn )
	{
		if( PPawn.MyHUD != None )
		{
			NextHUDMutator = PPawn.MyHUD.HUDMutator;
			PPawn.myHUD.HudMutator = self;
			bHUDMutator = true;
            
            PlayerOwner = PPawn;
            Spawn( class'LOTFEMusic', PlayerOwner );
		}
        return;
	}
}

simulated function PostRender( canvas C )
{
	local float RateX, RateY;

    if( NextHUDMutator != None )
    	NextHUDMutator.PostRender( C );
     
    DrawBossHPBars( C );
        
	if( MsgTime == 0 )
    {
		return;
    }
    
    RateX = C.ClipX / 1280;
	RateY = C.ClipY / 1024;
    
	C.SetPos( 0, 25 * RateY );
	C.DrawTile( Texture'Village.CHZKY1_bd', 25 * RateX, 250 * RateY, 0, 0, 64, 256 );
	C.SetPos( 250 * RateX, 25 * RateY );
	C.DrawTile( Texture'Village.CHZKY1_bd', 25 * RateX, 250 * RateY, 0, 0, 64, 256 );
	C.SetPos( 0, 0 );
	C.DrawPattern( Texture'rock.Rock15_D', 275 * RateX, 25 * RateY, 1 );
	C.SetPos( 0, 275 * RateY );
	C.DrawPattern( Texture'rock.Rock15_D', 275 * RateX, 25 * RateY, 1 );
	
	C.SetPos( 25 * RateX, 25 * RateY );
	if( Level.ScreenShot != None )
		C.DrawTile( Level.ScreenShot, 225 * RateX, 250 * RateY, 0, 0, 256, 256 );
	else
		C.DrawTile( Texture'Engine.DefaultTexture', 225 * RateX, 250 * RateY, 0, 0, 256, 256 );
	
	if( C.ClipX >= 1024 )
		C.Font = C.LargeFont;
	else
		C.Font = C.CredsFont;
	C.SetColor( 255, 128, 0 );
  	C.SetPos( 280 * RateX, 0 );
	C.DrawText( "LOTFE+SI Coop" );
	C.SetColor( 128, 255, 128 );
 	C.SetPos( 280 * RateX, 50 * RateY );
 	C.DrawText( "Map: "$Level.Title );
 	C.SetColor( 0, 128, 192 );
    C.SetPos( 280 * RateX, 100 * RateY );
    C.DrawText( "Author: "$Level.Author$"" );
    
    C.SetPos( 0, 300 * RateY );
    C.SetColor( 0, 128, 128 );
    C.DrawText( "( "$MsgTime$" )" );
    
    if( !bHeardSound )
    {
        CPSVolume( class'LOTFEData'.Default.LOTFEStartSounds[ Rand( 16 ) ], volume );
        
		SetTimer( 1, true );
		bHeardSound = true;
  	}
}

simulated function Timer( )
{
	MsgTime--;
	if( MsgTime == 0 )
		Disable( 'Timer' );
}

simulated function DrawBossHPBars( Canvas C )
{
    local Pawn P;
    local int i;
    
    foreach AllActors( class'Pawn', P )
    {
        for( i = 0; i < ArrayCount( BossNames ); i++ )
        {
            if( P.IsA( BossNames[i] ) )
            {
                DrawHPBar( C, P );
                return;
            }
        }
    }
}

simulated function DrawHPBar( Canvas C, Pawn P )
{
    local Texture TexFull, TexEmpty;
    local float scale, x, y;
    local float hpMod;
    local float yl;
        
    if( P.MaxHealth == 0 )
    {
        return;
    }
    
    if( P.IsA( 'MummyBoss' ) )
    {
        hpMod = float( MummyBoss( P ).HeadHP ) / P.MaxHealth;
    }
    else
    {
        hpMod = float( P.Health ) / P.MaxHealth;
    }
    if( hpMod < 0 )
        hpMod = 0;
       
    TexFull = Texture'BloodFull';
    TexEmpty = Texture'BloodEmpty';
    
    C.Font = C.BigFont;
    C.TextSize( "T", yl, yl );
    
    scale = C.ClipX / 640;
    x = C.ClipX / 2 - TexFull.USize * scale / 2;
    y = yl * 4;

    C.SetPos( x, y );
    C.DrawTile( TexFull, TexFull.USize * hpMod * scale, TexFull.VSize * scale,
                0, 0, TexFull.USize * hpMod, TexFull.VSize);
    C.SetPos( x + hpMod * TexFull.USize * scale, y );
    C.DrawTile( TexEmpty, TexEmpty.USize * scale - TexEmpty.USize  * hpMod * scale, TexEmpty.VSize * scale, 
                hpMod * TexEmpty.USize, 0, TexEmpty.USize * (1.0 - hpMod), TexEmpty.VSize);
}

simulated function CPSVolume( Sound ASound, float Volume )
{	
	PlayerOwner.LastPlaySound = Level.TimeSeconds;
	PlayerOwner.PlaySound( ASound, SLOT_None, Volume, true );
	PlayerOwner.PlaySound( ASound, SLOT_Interface, Volume, true );
	PlayerOwner.PlaySound( ASound, SLOT_Misc, Volume, true );
	PlayerOwner.PlaySound( ASound, SLOT_Talk, Volume, true );
}

function SwitchMap( PlayerPawn Sender, int id )
{
    if( id < 1 || id > 50 )
    {
        Sender.ClientMessage( "map number must be [1..50]" );
        return;
    }
    Sender.ConsoleCommand( "switchlevel " $ class'LOTFEData'.Default.LOTFEMaps[id - 1] );
}

function PrintMapList( PlayerPawn Sender )
{
    local int i;

    Sender.ClientMessage( "=======================" );
	Sender.ClientMessage( "=======[MAPLIST]=======" );
    for( i = 0; i < ArrayCount( class'LOTFEData'.Default.LOTFEMaps ); i++ )
    {
        Sender.ClientMessage( class'LOTFEData'.Default.LOTFEMaps[i] );
    }
	Sender.ClientMessage( "=======================" );
}

defaultproperties
{
    BossNames(0)=LOTFESIBoss
    BossNames(1)=LOTFEBoss
    BossNames(2)=MummyBoss
    BossNames(3)=HellBoss
    BossNames(4)=HellBerserkerBoss
    MsgTime=10
    bAlwaysRelevant=True
    RemoteRole=ROLE_SimulatedProxy
}
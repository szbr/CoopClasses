//=============================================================================
// NoCollisionZone.
// Used to prevent players from blocking others in small areas.
//=============================================================================
class NoCollisionZone expands ZoneInfo;


event ActorEntered( Actor in )
{
    if( PlayerPawn( in ) != None )
        in.bBlockPlayers = false;
}

event ActorLeaving( Actor out )
{
    if( PlayerPawn( out ) != None )
        out.bBlockPlayers = true;
}
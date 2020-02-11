//=============================================================================
// BlueGoblinWeakling.
//=============================================================================
class BlueGoblinWeakling expands GoblinWeakling;


function Died( Pawn Killer, name damageType, vector HitLocation )
{
	local Actor A;
	local float rnd;
	
	Spawn( class'BlastDestroyEffect', , , Location, rotator( vect( 0, 0, 1 ) ) );
    
   	rnd = FRand( );
	if( rnd < 0.33 )
		PlaySound( Die, SLOT_Talk );
	else if( rnd < 0.66 )
		PlaySound( Die2, SLOT_Talk );
	else 
		PlaySound( Die3, SLOT_Talk );
			
    if( Event != '' )
		foreach AllActors( class 'Actor', A, Event )
			A.Trigger( self, Killer );
	
	Destroy( );
}

defaultproperties
{
    Health=200
    MaxHealth=200
    BodyPartHealth(1)=200
    BodyPartHealth(3)=200
    BodyPartHealth(5)=200
    Style=STY_Translucent
    DesiredColorAdjust=(Z=255.000000)
}
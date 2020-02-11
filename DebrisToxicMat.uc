//=============================================================================
// DebrisToxicMat.
//=============================================================================
class DebrisToxicMat expands DebrisIce;


simulated function SpawnDebrisDecal( vector HitNormal )
{
	Spawn( class'DecalTox', self, , Location, rotator( HitNormal ) );
}

defaultproperties
{
    SkelGroupSkins(1)=Texture'LOTFE_Textures.ToxicWarer'
}
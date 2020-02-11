//=============================================================================
// Bread.
//=============================================================================
class Bread expands food;

#exec Texture Import File=Textures\bread.bmp Name=bread Mips=OFF

defaultproperties
{
    DrawScale=0.5
    Nutrition=20
    UseSound=Sound'OtherSnd.Pickups.pickupmeat01'
    PickupMessage="You ate some bread!"
    Skeletal=SkelModel'objects.BurlapSack'
    SkelGroupSkins(1)=Texture'bread'
}
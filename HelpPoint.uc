//=============================================================================
// HelpPoint.
//=============================================================================
class HelpPoint expands Actor;

#exec Texture Import File=Textures\help_point.bmp Name=help_point Mips=OFF Flags=2

defaultproperties
{
    Texture=Texture'help_point'
    bUnlit=True
    VisibilityRadius=500
    DrawScale=0.15
}
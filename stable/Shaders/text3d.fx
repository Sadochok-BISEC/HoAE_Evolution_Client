//*****************************************************************************
//*	File:	text3d.fx
//*	Desc:	Legacy shader
//*	Author:	Ruslan Shestopalyuk
//*	Date:	28.03.2005
//*****************************************************************************

technique RenderScene
{
	pass P0
	{
		AlphaBlendEnable			= True;
		SrcBlend			= SrcAlpha;
		DestBlend			= InvSrcAlpha;
		AlphaTestEnable			= False;
		ZEnable			= False;
		FillMode			= Solid;
		CullMode			= None;

		ColorOp[0]			= SelectArg1;
		ColorArg1[0]			= Diffuse;
		AlphaOp[0]			= Modulate;
		AlphaArg1[0]			= Texture;
		AlphaArg2[0]			= Diffuse;
		MinFilter[0]			= Point;
		MagFilter[0]			= Point;

	}  //pass P0
}  // technique RenderScene

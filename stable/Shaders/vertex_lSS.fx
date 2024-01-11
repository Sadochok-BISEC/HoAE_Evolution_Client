//*****************************************************************************
//*	File:	vertex_lit.fx
//*	Desc:	Legacy shader, used for FFP, smooth-shaded vertex-lit models
//*	Author:	Ruslan Shestopalyuk
//*	Date:	15.11.2004
//***************************************************************************** 

sampler Texture :register(s0) = sampler_state
{
   ADDRESSU         = WRAP;
   ADDRESSV         = WRAP;
   MAGFILTER        = LINEAR;
   MINFILTER        = LINEAR;
   MIPFILTER        = LINEAR;
   MIPMAPLODBIAS    = -0.8;
};
/*
sampler StoneTex = "Q:\textures\chain.dds"
{
   ADDRESSU         = WRAP;
   ADDRESSV         = WRAP;
   MAGFILTER        = LINEAR;
   MINFILTER        = LINEAR;
   MIPFILTER        = LINEAR;
   MIPMAPLODBIAS    = 0;
};
*/


float4 PSMain(  float2 uv:TEXCOORD0,                 
                float4 Diffuse:COLOR0 ) : COLOR 
{ 
   float4 C1 = tex2D(Texture,uv);
   float4 C2 = float4(0.9,0.9,0.9,1);//tex2D(StoneTex,uv);
   return (C1+C2*1)/2.2;  
}
technique RenderScene
{
    pass P0
    {          
		MaterialAmbient 	= {1.0, 1.0, 1.0, 1.0}; 
		MaterialDiffuse 	= {1.0, 1.0, 1.0, 1.0}; 
		MaterialSpecular	= {1.0, 1.0, 1.0, 1.0}; 
		MaterialPower		= 40.0f;
		
		LightType[0]      	= DIRECTIONAL; 
		LightDiffuse[0]   	= {1.3, 1.3, 1.3, 1.0}; 
		LightSpecular[0]  	= {1.0, 1.0, 1.0, 1.0};
		LightAmbient[0]   	= {0.3, 0.3, 0.3, 1.0};
		LightDirection[0] 	= {-0.816, -0.408, -0.408};  
		LightRange[0]     	= 100000.0; 
		
		//LightType[1]      	= DIRECTIONAL; 
		//LightDiffuse[1]   	= {1.0, 1.0, 1.0, 1.0}; 
		//LightSpecular[1]  	= {1.0, 1.0, 1.0, 1.0};
		//LightAmbient[1]   	= {0.2, 0.2, 0.2, 1.0};
		//LightDirection[1] 	= {-0.0, -0.2, -1.0};  
		//LightRange[1]     	= 100000.0; 

		LightEnable[0]		= True;
		LightEnable[1]		= False;
		
		Lighting		    = True; 
		SpecularEnable		= False;
		
		AlphaBlendEnable	= True; 
		SrcBlend            = SrcAlpha;
		DestBlend           = InvSrcAlpha;
		AlphaTestEnable		= True;
		AlphaFunc			= GreaterEqual; 
		AlphaRef			= 0x30; 
		ColorVertex			= True;
		SpecularEnable		= False; 
		NormalizeNormals	= True; 
		CullMode			= CCW;
		Lighting			= True; 
		FillMode			= Solid; 
		ShadeMode			= Gouraud; 
		DitherEnable		= False; 
		ZEnable				= True; 
		ZWriteEnable		= True; 
		ZFunc				= LessEqual; 
		ClipPlaneEnable		= 2; 

		FogEnable			= True;
		
		ColorOp[0]			= Modulate;  
		ColorArg1[0]		= Diffuse; 
		ColorArg2[0]		= Texture; 
		AlphaOp[0]			= Modulate;
		AlphaArg1[0] 		= Texture; 
		AlphaArg2[0] 		= TFactor;
		MipFilter[0] 		= Linear;  
		MinFilter[0] 		= Linear;  
		MagFilter[0] 		= Linear;  
		AddressU[0]			= Wrap;  
		AddressV[0]			= Wrap;  
		TexCoordIndex[0]	= PassThru;   
		
		ColorOp[1]			= Disable;  
		AlphaOp[1]			= Disable;
        	ColorOp[2]			= Disable;  
		AlphaOp[2]			= Disable;	  
		PixelShader			= compile ps_1_1 PSMain();
		
    }
} // technique RenderScene

Shader "Custom/Glass" {
	Properties {
		_EnvMap("EnvMap",Cube) = "white"{}
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200
		
		CGPROGRAM

		#pragma surface surf Lambert

		#pragma target 3.0

		samplerCUBE _EnvMap;

		struct Input {
			float3 worldRefl;
		};

		half _Glossiness;
		half _Metallic;
		fixed4 _Color;

		void surf (Input IN, inout SurfaceOutput o) {

			fixed4 c = texCUBE (_EnvMap, IN.worldRefl);
			o.Albedo = c.rgb;
			o.Alpha = c.a;
		}
		ENDCG
	} 
	FallBack "Diffuse"
}

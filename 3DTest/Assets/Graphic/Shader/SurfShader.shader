// サーフェイスシェーダ
Shader "Custom/SurfShader" {
    Properties {
        _MainTex ("Texture", 2D) = "white" {}
    }
    SubShader {
        Tags { "RenderType" = "Transparent" }
        CGPROGRAM

		// surf宣言　Entry LightMode [Optionalparams]
        #pragma surface surf Lambert

        struct Input {
            float2 uv_MainTex;
        };

        sampler2D _MainTex;

        void surf (Input IN, inout SurfaceOutput o) {
            o.Albedo = tex2D (_MainTex, IN.uv_MainTex).rgb;
		}

        ENDCG
    }
    Fallback "Diffuse"
}
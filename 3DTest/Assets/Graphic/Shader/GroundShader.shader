Shader "Custom/GroundShader" {
    Properties {
		_MainTex ("Base", 2D) = "white" {}
    }

    SubShader {
        Tags {
            "Queue" = "Transparent"
			"IgnoreProjector"="True" 
			"RenderType"="Transparent" 
        }

        // First Pass
        Cull Off
		Blend SrcAlpha OneMinusSrcAlpha
		
		Pass{
		CGPROGRAM

			#pragma vertex vert
			#pragma fragment frag

			sampler2D _MainTex;

			struct appdata_t {
			
				float4 vertex   : POSITION;
				float2 texcoord : TEXCOORD0;
			};
			struct v2f {
			
				float4 vertex   : SV_POSITION;
				half2  texcoord : TEXCOORD0;
			};

			v2f vert(appdata_t IN) {

				v2f OUT;

				// 頂点計算.
				OUT.vertex    = mul(UNITY_MATRIX_MVP, IN.vertex);
				OUT.texcoord =  IN.texcoord;

				return OUT;
			}

			fixed4 frag(v2f IN) : SV_Target {

				return tex2D(_MainTex, IN.texcoord);
			}

		ENDCG
		}
    }
}

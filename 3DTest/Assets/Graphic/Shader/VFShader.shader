// 頂点、フラグメントシェーダ
Shader "Custom/VFShader" {
/*
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
	}
    SubShader {

        Pass {

            CGPROGRAM
			#pragma vertex vert_img
			#pragma fragment frag

			#include "UnityCG.cginc"

			uniform sampler2D _MainTex;

			float4 frag(v2f_img i) : COLOR {
				return tex2D(_MainTex, i.uv);
			}

            ENDCG

        }

    }
*/

    Properties {
        _BendScale("Bend Scale", Range(0.0, 1.0)) = 0.1
        _MainTex ("Base (RGB)", 2D) = "white" {}
    }
    SubShader {
        Pass {
            Blend SrcAlpha One
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define PI 3.14159

            #include "UnityCG.cginc"

            uniform float _BendScale;
            uniform sampler2D _MainTex;

            struct v2f {
                float4 position : SV_POSITION;
                float2 uv       : TEXCOORD0;
            };

            v2f vert(appdata_full v) {
                float bend = sin(PI * _Time.x * 1000 / 45 + v.vertex.y + v.vertex.x);
                float x = sin(v.texcoord.x * PI) - 1.0;
                float y = sin(v.texcoord.y * PI) - 1.0;
                v.vertex.y += _BendScale * bend * (x + y);

                v2f o;
                o.position = mul(UNITY_MATRIX_MVP, v.vertex);
                o.uv       = MultiplyUV(UNITY_MATRIX_TEXTURE0, v.texcoord);
                return o;
            }

            fixed4 frag(v2f i) : COLOR {
                fixed4 tex = tex2D(_MainTex, i.uv);
                return tex;
            }
            ENDCG
        }
    }
}
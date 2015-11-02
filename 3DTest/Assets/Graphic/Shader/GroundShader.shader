Shader "Custom/GroundShader" {
    Properties {
        _HogeTex( "Base", 2D ) = "white" {}
    }

    SubShader {
        Tags {
            "Queue" = "Transparent"
        }

        CGPROGRAM

        #pragma surface surf Lambert alpha

        sampler2D _HogeTex;

        struct Input {
            float2 uv_HogeTex;
            float4 vtxColor : COLOR;
        };

        void surf( Input IN, inout SurfaceOutput o ) {
            half4 color = tex2D( _HogeTex, IN.uv_HogeTex );
            o.Albedo = color.rgb;
            o.Alpha = color.a;
		}

        ENDCG
    }
}

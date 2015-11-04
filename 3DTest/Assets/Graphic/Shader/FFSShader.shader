// 固定関数シェーダー(Fixed Function Shader)
Shader "Custom/FFSShader" {

/*	// 最小単位
    SubShader {
        Pass { Color (1,0,0,0) }
    }
*/
/*
	// ライティング
    Properties {
        _Color ("Main Color", COLOR) = (1,1,1,1)
    }
	SubShader {
        Pass {
			Material{
				Diffuse [_Color]
				Ambient [_Color]
			}
			Lighting On
		}
    }
*/

	// VertexLit相当
    Properties {
        _Color ("Main Color", Color) = (1,1,1,0)
		_SpecColor ("Spec Color", Color) = (1,1,1,1)
        _Emission ("Emmisive Color", Color) = (0,0,0,0)
        _Shininess ("Shininess", Range (0.01, 1)) = 0.7
		_MainTex ("Base (RGB)" , 2D) = "white" {}
    }
	SubShader{
		Pass{
			Material{
				Diffuse [_Color]
				Ambient [_Color]
				Specular [_SpecColor]
				Shininess [_Shininess]
				Emission [_Emission]
			}
			Lighting On
			SeparateSpecular On
			SetTexture [_MainTex]{
				Combine texture * primary DOUBLE , texture * primary
			}
		}
	}


}

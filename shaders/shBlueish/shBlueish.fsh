//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{

    vec4 c = texture2D( gm_BaseTexture, v_vTexcoord );

    float gray = 0.21 * c.r + 0.72 * c.g + 0.07 * c.b;
     
    gl_FragColor = vec4(gray*0.1, gray*0.4, gray, c.a);
}


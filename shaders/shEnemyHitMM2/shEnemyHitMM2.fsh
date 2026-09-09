//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{

    vec4 c = texture2D( gm_BaseTexture, v_vTexcoord );

    float gray = 0.21 * c.r + 0.72 * c.g + 0.07 * c.b;
	float yellow = 0.21 * c.r + 0.72 * c.g;
    
    if (yellow >= 152.0 / 255.0) {
		gl_FragColor = vec4(252.0/255.0, 228.0/255.0, 160.0/255.0, c.a);
	}
	else if (gray >= 0.06) {
        gl_FragColor = vec4(1.0, 1.0, 1.0, c.a);
    }
    else {
        gl_FragColor = vec4(0.0, 0.0, 0.0, c.a);
    }
}


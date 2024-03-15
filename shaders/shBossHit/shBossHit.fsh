//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{

    vec4 c = texture2D( gm_BaseTexture, v_vTexcoord );

    float gray = 0.21 * c.r + 0.72 * c.g + 0.07 * c.b;
    
    if (gray > 0.5) {
        gl_FragColor = vec4(1.0, 1.0, 1.0, c.a);
    }
    else if (gray > 0.2) {
        gl_FragColor = vec4(0.75, 0.75, 0.75, c.a);
    }
    else if (gray > 0.02) {
        gl_FragColor = vec4(0.5, 0.5, 0.5, c.a);
    }
    else {
        gl_FragColor = vec4(0.0, 0.0, 0.0, c.a);
    }
}


//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{

    vec3 colors[4];
    //#0F380F #306230 #8BAC0F #9BBC0F
    colors[0] = vec3(8, 24, 32) / 255.0;
    colors[1] = vec3(48, 104, 80) / 255.0;
    colors[2] = vec3(136, 192, 112) / 255.0;
    colors[3] = vec3(224, 248, 208) / 255.0;

    vec4 c = texture2D( gm_BaseTexture, v_vTexcoord );

    float gray = 0.21 * c.r + 0.72 * c.g + 0.07 * c.b;
    gray = min(0.999, floor(gray * 3.0 + 0.5) / 3.0);
    int i = int(floor(gray * 4.0));    
    vec3 col;
    for (int x = 0; x < 4; x++) {  //workaround for webgl, array index must be constant
        if (i == x) { 
            col = colors[x];
        }
    }
    //vec3 col = colors[i]; 
    gl_FragColor = vec4(col, c.a);
}


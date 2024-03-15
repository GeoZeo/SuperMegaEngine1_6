//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    vec3 color_resolution = vec3(2.0, 2.0, 2.0);
    vec3 color_bands = floor(gl_FragColor.rgb * (color_resolution - 1.0) + 0.5) / (color_resolution - 1.0);
    gl_FragColor = vec4(min(color_bands, 1.0), gl_FragColor.a);
}


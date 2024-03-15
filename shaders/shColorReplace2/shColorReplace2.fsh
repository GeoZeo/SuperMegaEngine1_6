//
//  shColorReplace2
//
//      Replaces two colors with two others. 
//
//      colorIn1             first color to replace (vec4)
//      colorOut1            first replacement color (vec4)
//      colorIn2             second color to replace (vec4)
//      colorOut2            second replacement color (vec4)
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec4  colorIn1;
uniform vec4  colorOut1;
uniform vec4  colorIn2;
uniform vec4  colorOut2;

void main() {
    vec4 colorPixel = texture2D( gm_BaseTexture, v_vTexcoord );
    
    if (all(equal(colorPixel, colorIn1))) {
        gl_FragColor = v_vColour * colorOut1;
    }
    else if (all(equal(colorPixel, colorIn2))) {
        gl_FragColor = v_vColour * colorOut2;
    }
    else {
        gl_FragColor = v_vColour * colorPixel;
    }
    
}

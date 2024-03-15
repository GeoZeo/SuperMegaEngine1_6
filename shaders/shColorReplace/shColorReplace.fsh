//
//  shColorReplace
//
//      Replaces one color with another. 
//
//      colorIn             color to replace (vec4)
//      colorOut            replacement color (vec4)
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec4  colorIn;
uniform vec4  colorOut;

void main() {
    vec4 colorPixel = texture2D( gm_BaseTexture, v_vTexcoord );
    
    if (all(equal(colorPixel, colorIn))) {
        gl_FragColor = v_vColour * colorOut;
    }
    else {
        gl_FragColor = v_vColour * colorPixel;
    }
    
}

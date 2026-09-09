//Changes/alters the background when in view

enum filter_types {BLEND, ALPHA, CHANGE};

current_type = filter_types.ALPHA;

colour = c_black;
targetAlpha = 0;
BGs = [];
BGs[0] = bgBeta;

blendDiv = 3;
transitionTimer = 0;
transitionTime = 18;

var currentBlend = __background_get(e__BG.Blend, 0);
var blendCol = make_color_rgb(color_get_red(currentBlend), color_get_green(currentBlend), color_get_blue(currentBlend));

rInc = (color_get_red(colour) - color_get_red(blendCol)) / blendDiv;
gInc = (color_get_green(colour) - color_get_green(blendCol)) / blendDiv;
bInc = (color_get_blue(colour) - color_get_blue(blendCol)) / blendDiv;

var currentAlpha = __background_get(e__BG.Alpha, 0);

AlphaIncrement = (targetAlpha - currentAlpha) / blendDiv;

BGs_i = 0;

finished = false;
activated = false;


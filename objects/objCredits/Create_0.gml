draw_set_font(global.font);
draw_set_halign(fa_center);
draw_set_colour(c_white);
playMusicLoopPoint(bgmCredits, 0.157, 1);
vspeed = 0;
megamanx = 0;
megamany = room_height;
jetx = 0;
jety = megamany + 19;
megamansprite = global.spriteStand;
jetsprite = global.jetSprite;
megaImg = 0;
scroll_threshold = -430;

var fadein = instance_create(0,0, objFadeIn);
fadein.deactivate = false;

text = @"

SUPER MEGA ENGINE (SME)

github.com / rafaelcp / Super-Mega-Engine


GitHub Maintainer

Rafael C.P.


Programming

Rafael C.P.
Ethervil
WreckingPrograms (Original base engine code)


Music and SFX

Capcom
The Sounds Resource


Playtesting

Methok
Sayan Anderson Pinto
Clauvin Erlan
Carlos 'Goku' Rosa
Rafael C.P.


All GitHub Contributors

github.com / rafaelcp / Super-Mega-Engine / graphs / contributors


Special Thanks

Akira Kitamura
Keiji Inafune
Capcom




And You











Presented by the Mega Man Fandom
";


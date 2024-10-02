draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(global.MM3font);
draw_set_colour(c_white);
option = 0;

objLifeEquip.count = global._lives;

cursorCounter = 0;
cursorSprite = 0;
npcImg = 0;
megaImg = 0;
counterSpeed = 0;
screws = global.screws;

npc = global.spriteShopNPC;

total = 0;
item_index = -1;

surePhase = false;
isSure = false;

var bg = asset_get_index("bg" + global.sprName + "Shop");
if (bg == -1) bg = bgShop;
__background_set( e__BG.Index, 0, bg );

stopAllSFX();
playMusic(global.shopBGM, global.shopVolume, global.shopLoopStart, global.shopLoopEnd);


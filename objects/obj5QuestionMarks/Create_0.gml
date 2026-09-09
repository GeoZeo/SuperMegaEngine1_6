event_inherited();

names[0] = "?????";
defaultSprites[0] = spr5QuestionMarks;
talkSprites[0] = spr5QuestionMarksTalk;
currentSprites[0] = defaultSprites[0];

//Tango
names[1] = "TANGO";
imageIndices[1] = 0;
defaultSprites[1] = sprTangoShop;
defaultSpriteSpeeds[1] = 0.125;
enterSprites[1] = sprNothing;
enterSpriteSpeeds[1] = 0;
enterBools[1] = true;
talkSprites[1] = sprNothing;
talkSpriteSpeeds[1] = 0;
lastLineTalkBools[1] = false;
waitTimes[1] = room_speed * 15;
waitTimers[1] = 0;
waitTransitSprites[1] = sprTangoShopWaitTransition;
waitTransitSpriteSpeeds[1] = 0.5;
waitSprites[1] = sprTangoShopWait;
waitSpriteSpeeds[1] = 0;
currentSprites[1] = defaultSprites[1];
currentSpriteSpeeds[1] = defaultSpriteSpeeds[1];
x_positions[1] = 22;
y_positions[1] = 143;
x_scales[1] = 1;
y_scales[1] = 1;
talkAnimBools[1] = false;
selectSFX = sfxMenuSelect3;

isScroll = true;

welcomeTalkAnim = true;
welcomeIsScroll = true;
welcomeName = true;
welcomeDialogues[0] = "\"HELLO THERE...";
welcomeDialogues[1] = "YOU CAN USE THOSE SCREWS TO BUY STUFF";
welcomeDialogues[2] = "AT THE SHOP.\"";

idleName = false;
idleDialogue = -1;

sureName = false;
sureTalkAnim = false;
sureIsScroll = false;
sureDialogues[0] = "MAKE THIS ITEM?";

thankingName = false;
thankingTalkAnim = false;
thankingIsScroll = false;
thankingDialogues[0] = "GOT\n" + item_name + ".";

cancelName = false;
cancelTalkAnim = false;
cancelIsScroll = false;
cancelDialogues[0] = "CANCELED.";

notEnoughName = false;
notEnoughTalkAnim = false;
notEnoughIsScroll = false;
notEnoughDialogues[0] = "YOU DO NOT HAVE ENOUGH SCREWS.";

noStockName = false;
noStockTalkAnim = false;
noStockIsScroll = false;
noStockDialogues[0] = "THIS ITEM IS OUT OF STOCK.";

tooManyName = false;
tooManyTalkAnim = false;
tooManyIsScroll = false;
tooManyDialogues[0] = "THIS ITEM IS OUT OF STOCK.";

goodbyeName = true;
goodbyeTalkAnim = true;
goodbyeIsScroll = true;
goodbyeDialogues[0] = "\"COME BACK SOON...\"";

x_positions[0] = 34;
y_positions[0] -= 5;


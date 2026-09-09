event_inherited();

//Roll
names[1] = "ROLL";
imageIndices[1] = 0;
defaultSprites[1] = sprRoll;
defaultSpriteSpeeds[1] = 0.125;
enterSprites[1] = sprNothing;
enterSpriteSpeeds[1] = 0;
enterBools[1] = true;
talkSprites[1] = sprNothing;
talkSpriteSpeeds[1] = 0;
lastLineTalkBools[1] = false;
waitTimes[1] = -1;
waitTimers[1] = -1;
waitTransitSprites[1] = sprNothing;
waitTransitSpriteSpeeds[1] = 0;
waitSprites[1] = sprNothing;
waitSpriteSpeeds[1] = 0;
currentSprites[1] = defaultSprites[1];
currentSpriteSpeeds[1] = defaultSpriteSpeeds[1];
x_positions[1] = 30;
y_positions[1] = 139;
x_scales[1] = 1;
y_scales[1] = 1;
talkAnimBools[1] = false;

welcomeTalkAnim = true;
welcomeTalkIndex = 0;
welcomeDialogues[0] = "\"WELCOME BACK, MEGA MAN!\"";
welcomeDialogues[1] = "YOU CAN EXCHANGE YOUR SCREWS FOR ITEMS HERE AT THE LAB.";
welcomeDialogues[2] = "JUST LEMME KNOW WHAT YOU NEED!\"";

idleTalkAnim = true;
idleTalkIndex = 0;
idleDialogue = "\"SO WHAT'LL IT BE, MEGA PAL?\"";

sureTalkAnim = true;
sureTalkIndex = 0;
sureDialogues[0] = "\"THIS'LL COST YOU " + price + " SCREWS!";
sureDialogues[1] = "SURE THIS IS WHAT YOU WANT, BUDDY?\"";

thankingTalkAnim = true;
thankingTalkIndex = 1;
thankingDialogues[0] = "\"TA-DAAA!! ALL READY!";
thankingDialogues[1] = "DO YOU NEED ANYTHING ELSE?\"";

cancelTalkAnim = true;
cancelTalkIndex = 1;
cancelDialogues[0] = "\"WHAT? YOU DON'T WANT IT?\"";

notEnoughTalkAnim = true;
notEnoughTalkIndex = 1;
notEnoughDialogues[0] = "\"YOU DON'T HAVE ENOUGH SCREWS.\"";

noStockTalkAnim = true;
noStockTalkIndex = 0;
noStockDialogues[0] = "\"SORRY BUDDY, WE'RE ALL OUTTA STOCK.\"";

tooManyTalkAnim = true;
tooManyTalkIndex = 1;
tooManyDialogues[0] = "\"UHH.. LOOKS LIKE YOU CAN'T CARRY ANYMORE OF THESE...\"";

goodbyeTalkAnim = true;
goodbyeTalkIndex = 1;
goodbyeDialogues[0] = "\"GOOD LUCK OUT THERE, MEGA!\"";


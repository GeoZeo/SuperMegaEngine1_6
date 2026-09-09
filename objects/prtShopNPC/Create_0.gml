//You can make multiple NPCs with one NPC class if you wish (hence the arrays for everything).
//For now, Auto is the first in the list, so the first item in each array is used for him.
names = [];
names[0] = "AUTO"; //Character name to output

imageIndices = []; //Current animation frame index array
imageIndices[0] = 0; //Current animation frame index of the first character in the list (in this case, Auto)

defaultSprites = []; //Idle sprite array
defaultSprites[0] = sprAuto; //Idle sprite of the first character in the list (in this case, Auto)

defaultSpriteSpeeds = []; //Idle sprite animation speed array
defaultSpriteSpeeds[0] = 0.5;

enterSprites = []; //Entrance/exit sprite
enterSprites[0] = sprNothing;

enterSpriteSpeeds = []; //Entrance/exit sprite animation speed
enterSpriteSpeeds[0] = 0;

enterBools = []; //Booleans that determine whether or not character should currently be in their enter/exit animation. Set them all to true in the Create Events!
enterBools[0] = true;

talkSprites = []; //Talk sprite
talkSprites[0] = sprAutoTalk;

talkSpriteSpeeds = []; //Talk sprite animation speed
talkSpriteSpeeds[0] = 0.1;

lastLineTalkBools = [] //Play talking animation on last line of a dialogue array?
lastLineTalkBools[0] = false;

waitTimes = []; //Timer for triggering the waiting animation
waitTimes[0] = -1;
waitTimers = [];
waitTimers[0] = -1;

waitTransitSprites = []; //Waiting transition sprite
waitTransitSprites[0] = sprNothing;

waitTransitSpriteSpeeds = []; //Wait transition sprite animation speed
waitTransitSpriteSpeeds[0] = 0.125;

waitSprites = []; //Waiting sprite
waitSprites[0] = sprNothing;

waitSpriteSpeeds = []; //Wait sprite animation speed
waitSpriteSpeeds[0] = 0;

currentSprites = []; //Currently set sprite
currentSprites[0] = defaultSprites[0];

currentSpriteSpeeds = []; //Currently set sprite speed
currentSpriteSpeeds[0] = defaultSpriteSpeeds[0];

x_positions = []; //Where each character is in the scene
y_positions = [];

x_positions[0] = 56;
y_positions[0] = 127;

x_scales = []; //Character image scale (i.e: facing left (-1) or right (1))
y_scales = [];

x_scales[0] = 1;
y_scales[0] = 1;

talkAnimBools = [];
talkAnimBools[0] = true; //Is the character's mouth actually supposed to move at all?

selectSFX = cfgShopSelectSFX;

price = ""; //These two are to be re-set each time the player selects an item for purchase (see User Event 0).
item_name = "";

playEnterAnim = true; //Trigger that activates the enter/exit animations

isScroll = true; //Does any of this NPC's dialogue text scroll?
displayName = true; //Display talking character name at any point?

//Dialogue phases
//Entering the shop
welcomePhase = true; //Currently supposed to be in this phase?
welcomeTalkAnim = true; //Is anyone's mouth actually supposed to move during this phase?
welcomeTalkIndex = 0; //Use the talk index to determine which character is actually talking and when. For now, it is set to 0 for everything since Auto is the first (and only) one in the list.
welcomeIsScroll = true; //Does this dialogue phase involve text scrolling?
welcomeName = true;
welcomeDialogues = [];
welcomeDialogues[0] = "\"WELCOME!";
//welcomeDialogues[1] = "YOU CAN EXCHANGE SCREWS FOR ITEMS HERE.";
//welcomeDialogues[2] = "WHAT CAN I DO FOR YOU?";

//Waiting for you to select an item
idlePhase = false;
idleTalkAnim = true;
idleTalkIndex = 0;
idleIsScroll = true;
idleName = true;
idleDialogue = "\"PLEASE SELECT AN ITEM.\""; //If you don't want idle dialogue, set to -1

//Confirming whether or not you actually want to buy the item
//NOTE: You need at least one line of sure phase dialogue in order for everything to work!
surePhase = false;
sureTalkAnim = true;
sureTalkPhase = false;
sureTalkIndex = 0;
sureIsScroll = true;
sureName = true;
sureDialogues = [];
sureDialogues[0] = "\"THIS WILL COST YOU " + price + " SCREWS.";
//sureDialogues[1] = "WILL YOU BUY ONE " + string_upper(item_name) + "?";

//Confirming your successful purchase
thankingPhase = false;
thankingTalkAnim = true;
thankingTalkIndex = 0;
thankingIsScroll = true;
thankingName = true;
thankingDialogues = [];
thankingDialogues[0] = "\"HEH HEH!! THANK YOU!";
//thankingDialogues[1] = "DO YOU NEED ANYTHING ELSE?";

//Response to selecting "NO" instead of "YES"
cancelPhase = false;
cancelTalkAnim = true;
cancelTalkIndex = 0;
cancelIsScroll = true;
cancelName = true;
cancelDialogues = [];
cancelDialogues[0] = "\"OH, NEVER MIND, THEN.\"";

//When you try to buy something that you don't have enough screws for
notEnoughPhase = false;
notEnoughTalkAnim = true;
notEnoughTalkIndex = 0;
notEnoughIsScroll = true;
notEnoughName = true;
notEnoughDialogues = [];
notEnoughDialogues[0] = "\"YOU DON'T HAVE ENOUGH SCREWS.\"";

//When an item is out of stock
noStockPhase = false;
noStockTalkAnim = true;
noStockTalkIndex = 0;
noStockIsScroll = true;
noStockName = true;
noStockDialogues = [];
noStockDialogues[0] = "\"SORRY, OUT OF STOCK.\"";

//When you're trying to buy an item that you've already reached the max storage capacity for
tooManyPhase = false;
tooManyTalkAnim = true;
tooManyTalkIndex = 0;
tooManyIsScroll = true;
tooManyName = true;
tooManyDialogues = [];
tooManyDialogues[0] = "\"YOU CAN'T CARRY ANY MORE.\"";

//Leaving the shop
goodbyePhase = false;
goodbyeTalkAnim = true;
goodbyeTalkIndex = 0;
goodbyeIsScroll = true;
goodbyeName = true;
goodbyeDialogues = [];
goodbyeDialogues[0] = "\"FAREWELL FOR NOW!\"";


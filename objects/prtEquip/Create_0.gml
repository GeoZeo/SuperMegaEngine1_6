/// @description Initialize equipment variables

usable = false;     //Can select and activate the item in the pause menu
maxUnits = 1;       //Maximum number of units that can be held
showZero = false;   //Whether to show the item in the pause menu if you have 0 units
showCount = true;   //Whether to show the item's count in the pause menu.
showPause = true;   //Whether to show the item in the pause menu
buyable = false;    //Can be bought in the shop
count = 0;          //Current amount of this item you have
price = 1;          //Shop price
name = "";          //Item name (for shop)
description = "";   //Item description (for shop)
using = false;      //Whether the item effect is being applied right now

buyok = false;      //Buying transation was ok?
ok = false;         //Last activation was ok?

useOnWeapon = false; // Can this item be used on a weapon? Only used for W-tanks now.
primed = false;      // If the above is true, has the item been selected once already? 
                     // If so, the next press on a weapon or util should apply this item.

persistent = true;
visible = false;

exceptCharacters = ds_list_create();


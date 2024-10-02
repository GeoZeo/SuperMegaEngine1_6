/// @description  Starting the intro pose (and falling down)
if pose > -1 && startIntro == true {
    startIntro = false;
    isIntro = true;
    visible = true;
    y = global.viewY;
}
else if pose == -1 {
    image_speed = 0;
    isIntro = false;    
}


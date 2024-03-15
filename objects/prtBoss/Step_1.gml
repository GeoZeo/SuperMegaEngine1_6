/// @description  Starting the intro pose (and falling down)
if pose > -1 && startIntro == true {
    startIntro = false;
    isIntro = true;
    visible = true;
    y = __view_get( e__VW.YView, 0 );
}
else if pose == -1 {
    image_speed = 0;
    isIntro = false;    
}


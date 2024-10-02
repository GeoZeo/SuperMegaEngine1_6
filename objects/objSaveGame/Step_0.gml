if (instance_exists(objFadeout)) exit;

if global.keyUpPressed or global.keyLeftPressed {
    if !surePhase {
		selected--;
	    if selected < 0 {
	        selected = num_saves;
	    }
		if selected > 0 and saves[selected - 1] > -1 {
			var map = saves[selected - 1];
			if map > - 1 and ds_map_exists(map, "character") {
				setPlayer(map[? "character"]);
			}
		}
		else {
			setPlayer(currentChar);
		}
	}
	else {
		isSure = !isSure;
	}
    playSFX(sfxMenuMove);
}
else if global.keyDownPressed or global.keyRightPressed or global.keySelectPressed {
    if !surePhase {
		selected++;
	    if selected > num_saves {
	        selected = 0;
	    }
		if selected > 0 and saves[selected - 1] > -1 {
			var map = saves[selected - 1];
			if map > - 1 and ds_map_exists(map, "character") {
				setPlayer(map[? "character"]);
			}
		}
		else {
			setPlayer(currentChar);
		}
	}
	else {
		isSure = !isSure;
	}
    playSFX(sfxMenuMove);
}
if global.keyShootPressed {
	if !surePhase {
		if selected != 0 {
			selected = 0;
			playSFX(sfxMenuMove);
		}
		else {
			var ID = instance_create(0, 0, objFadeout);
		    ID.type = "room";
		    ID.myRoom = rmPass;
		}
	}
	else {
		playSFX(sfxMenuSelect);
		surePhase = false;
	}
}
else if global.keyPausePressed || global.keyJumpPressed {

    playSFX(sfxMenuSelect);
    if selected == 0 {  //Back?
        var ID = instance_create(0, 0, objFadeout);
        ID.type = "room";
        ID.myRoom = rmPass;
    }
    else {
		if surePhase && !isSure {
			surePhase = false;
		}
		else {
			if surePhase || saves[selected - 1] == -1 {
				setPlayer(currentChar);
		        saveGame(selected - 1);        
		        global.lastSave = selected;
		        saves[selected - 1] = ds_map_secure_load("save" + string(selected - 1) + ".dat");
				
				surePhase = false;
			}
			else {
				surePhase = true;
				isSure = false;
			}
		}
    }


}


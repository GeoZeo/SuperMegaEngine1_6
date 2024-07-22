/// @description onActivate
event_inherited();
if !ok return false; //Must be on the beginning of every child of prtEquip

var proceed = false;
for(i = 0; i < global.totalWeapons; i++) {
    if ceil(global.weapons[i].ammo) < global.maxAmmo
        proceed = true;
}

if ceil(global._health) < global._maxHealth
    proceed = true;
                        
if proceed {
    show_debug_message("Can use. Starting restoring.");
    timer = 0;
    loopSFX(sfxEnergyRestore);
    using = true;
    ok = true;
}
else {
    var total = 0;
    ok = true;
    using = false;
    for (var i = 0; i < instance_number(prtEnemy); i++) {
        var enemy = instance_find(prtEnemy, i);
        with enemy {
            if !dead && insideView() && object_get_parent(object_index) != prtBoss && object_get_parent(object_index) != prtMiniBoss && !object_is_ancestor(object_index, objDestructibleWall) {
                var l = instance_create(x, y, objLife);
                l.alarm[0] = room_speed * 99999999;
                dead = true;
                visible = false;
                healthpoints = 0;
                total++;
                show_debug_message("Created 1 life.");
            }
        }
    }
    if total == 0 {
        show_debug_message("No enemies on screen. Gain 1 life.");
        if global._lives < 9 {
            global._lives++
        }
        else {
            ok = false;
        }
    }
    if ok {
        playSFX(sfxImportantItem);
    }
    else {
        count++;
        playSFX(sfxError);
    }
}

return ok;


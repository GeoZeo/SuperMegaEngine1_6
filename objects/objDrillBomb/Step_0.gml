event_inherited();

if !global.frozen and global.keyShootPressed and !justCreated {    //Detonate
    event_user(0);
}

justCreated = false;


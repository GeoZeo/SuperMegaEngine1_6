event_inherited();

if !global.frozen and global.keyShootPressed and !justCreated and !reflected {    //Detonate
    event_user(2);
}

justCreated = false;


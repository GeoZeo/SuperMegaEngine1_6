changeGrav = true;
changeGravWater = true;

myGrav = cfgGravityWater;
myGravWater = cfgGravityWater * (cfgGravityWater / cfgGravity);

canChange = true;
destroyOnActivation = true;

if cfgDebug || debug_mode {
    visible = true;
}


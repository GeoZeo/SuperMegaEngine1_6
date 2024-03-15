/// @description Verify if boss is already defeated on boss rush

if boss > -1 && global.bossRushDefeated[boss] {
    instance_destroy();
}


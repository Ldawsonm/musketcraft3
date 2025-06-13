// thank you jared 
for item in game.items {
   if item.maxStackSize > 1 {
        item.maxStackSize = 64;
    } 
}

# Make Honey Stackable to 4
<item:minecraft:honey_bottle>.maxStackSize = 4;
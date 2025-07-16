
val air = <item:minecraft:air>;
val zanite = <item:aether:zanite_gemstone>;
val gravitite = <item:aether_redux:gravitite_ingot>;
val wool = <tag:items:minecraft:wool>;
val obsidian = <item:minecraft:obsidian>;
val stone = <item:minecraft:stone_bricks>;

craftingTable.remove(<item:hangglider:hang_glider>);
craftingTable.addShaped("hangglider", <item:hangglider:hang_glider>, [
    [air, zanite, air],
    [zanite, wool, zanite],
    [wool, wool, wool]
]);

<item:minecraft:elytra>.maxDamage = 2048;
craftingTable.addShaped("elytra", <item:minecraft:elytra>, [
    [gravitite, air, gravitite],
    [wool, gravitite, wool],
    [air, wool, air]
]);

craftingTable.remove(<item:waystones:waystone>);
craftingTable.addShaped("waystone", <item:waystones:waystone>, [
    [air, stone, air],
    [stone, gravitite, stone],
    [obsidian, obsidian, obsidian]
]);

craftingTable.remove(<item:map_atlases:atlas>);
craftingTable.addShapeless("atlas", <item:map_atlases:atlas>,
    [<item:minecraft:book>, <item:minecraft:map>]);

craftingTable.remove(<item:enchantinginfuser:advanced_enchanting_infuser>);
craftingTable.addShaped("adv_enchanting_enfuser", <item:enchantinginfuser:advanced_enchanting_infuser>, [
    [air, gravitite, air],
    [<item:minecraft:diamond>, <item:enchantinginfuser:enchanting_infuser>, <item:minecraft:diamond>]
]);
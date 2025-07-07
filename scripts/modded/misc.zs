
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
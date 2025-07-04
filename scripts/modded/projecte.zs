
val redstone = <item:minecraft:redstone>;
val iron = <item:minecraft:iron_ingot>;
val stone = <tag:items:forge:stone>;
val d_block = <item:minecraft:diamond_block>;

craftingTable.remove(<item:projecte:alchemical_chest>);
craftingTable.addShaped("alchemical_chest", <item:projecte:alchemical_chest>, [
    [redstone, redstone, redstone],
    [stone, <item:minecraft:diamond>, stone],
    [iron, <tag:items:forge:chests/wooden>, iron]
]);

craftingTable.remove(<item:projecte:transmutation_tablet>);
craftingTable.addShaped("trans_tablet", <item:projecte:transmutation_tablet>, [
    [d_block, stone, d_block],
    [stone, <item:projecte:transmutation_table>, stone],
    [d_block, stone, d_block]
]);


craftingTable.removeByName("projecte:conversions/emerald_to_diamond");
craftingTable.removeByName("projecte:conversions/diamond_to_emerald");

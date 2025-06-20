
val redstone = <item:minecraft:redstone>;
val iron = <item:minecraft:iron_ingot>;
val stone = <tag:items:forge:stone>;

craftingTable.remove(<item:projecte:alchemical_chest>);
craftingTable.addShaped("alchemical_chest", <item:projecte:alchemical_chest>, [
    [redstone, redstone, redstone],
    [stone, <item:minecraft:diamond>, stone],
    [iron, <tag:items:forge:chests/wooden>, iron]
]);
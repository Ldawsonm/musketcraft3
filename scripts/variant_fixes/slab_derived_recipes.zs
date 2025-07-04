
val planks = <tag:items:musketcraft:all_planks>;
val air = <item:minecraft:air>;
val blackstone = <item:minecraft:blackstone>;
val glass = <tag:items:forge:glass>;
val bamboo = <item:minecraft:bamboo>;
val quartz = <item:minecraft:quartz>;
val sticks = <tag:items:forge:rods/wooden>;


craftingTable.remove(<item:woodworks:sawmill>);
craftingTable.addShaped("sawmill", <item:woodworks:sawmill>, [
    [planks, <item:minecraft:iron_ingot>, air],
    [planks, air, air],
    [planks, planks, air]
]);

craftingTable.remove(<item:supplementaries:blackboard>);
craftingTable.addShaped("blackboard", <item:supplementaries:blackboard>, [
    [planks, blackstone, air],
    [planks, blackstone, <tag:items:supplementaries:blackboard_white>],
    [planks, blackstone, air],
]);

craftingTable.remove(<item:minecraft:composter>);
craftingTable.addShaped("composter", <item:minecraft:composter> * 2, [
    [planks, air, planks],
    [planks, air, planks],
    [planks, planks, planks],
]);

craftingTable.remove(<item:supplementaries:jar>);
craftingTable.addShaped("jar", <item:supplementaries:jar>, [
    [glass, planks, glass],
    [glass, air, glass],
    [glass, glass, glass]
]);

craftingTable.remove(<item:minecraft:lectern>);
craftingTable.addShaped("lectern", <item:minecraft:lectern>, [
    [planks, planks, planks],
    [air, <tag:items:forge:bookshelves>, air],
    [air, planks, air]
]);

craftingTable.remove(<item:supplementaries:item_shelf>);
craftingTable.addShaped("item_shelf", <item:supplementaries:item_shelf> * 4, [
    [planks, planks, planks]
]);

craftingTable.remove(<item:minecraft:barrel>);
craftingTable.addShaped("barrel", <item:minecraft:barrel>, [
    [planks, air, planks],
    [planks, planks, planks],
    [planks, planks, planks]
]);

craftingTable.remove(<item:supplementaries:bamboo_spikes>);
craftingTable.addShaped("bamboo_spikes", <item:supplementaries:bamboo_spikes>, [
    [bamboo, air, bamboo],
    [bamboo, air, bamboo],
    [planks, planks, planks]
]);

craftingTable.remove(<item:minecraft:daylight_detector>);
craftingTable.addShaped("daylight_detector", <item:minecraft:daylight_detector>, [
    [glass, glass, glass],
    [quartz, quartz, quartz],
    [planks, planks, planks]
]);

craftingTable.remove(<item:another_furniture:furniture_hammer>);
craftingTable.addShaped("furniture_hammer", <item:another_furniture:furniture_hammer>, [
    [air, planks, planks],
    [air, sticks, planks],
    [sticks, air, air]
]);
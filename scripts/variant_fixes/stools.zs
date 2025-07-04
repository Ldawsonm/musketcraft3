import crafttweaker.api.item.IItemStack;
import crafttweaker.api.item.ItemDefinition;

public function makeStool(color as string, wool as IItemStack, result as IItemStack) as void {
    val planks = <tag:items:musketcraft:all_planks>;
    craftingTable.remove(result);
    craftingTable.addShaped(color + "_stool", result * 2, [
        [wool, wool, wool],
        [planks, planks, planks]
    ]);
}

makeStool("white", <item:minecraft:white_wool>, <item:quark:white_stool>);
makeStool("light_gray", <item:minecraft:light_gray_wool>, <item:quark:light_gray_stool>);
makeStool("gray", <item:minecraft:gray_wool>, <item:quark:gray_stool>);
makeStool("black", <item:minecraft:black_wool>, <item:quark:black_stool>);
makeStool("brown", <item:minecraft:brown_wool>, <item:quark:brown_stool>);
makeStool("red", <item:minecraft:red_wool>, <item:quark:red_stool>);
makeStool("orange", <item:minecraft:orange_wool>, <item:quark:orange_stool>);
makeStool("yellow", <item:minecraft:yellow_wool>, <item:quark:yellow_stool>);
makeStool("lime", <item:minecraft:lime_wool>, <item:quark:lime_stool>);
makeStool("green", <item:minecraft:green_wool>, <item:quark:green_stool>);
makeStool("cyan", <item:minecraft:cyan_wool>, <item:quark:cyan_stool>);
makeStool("light_blue", <item:minecraft:light_blue_wool>, <item:quark:light_blue_stool>);
makeStool("blue", <item:minecraft:blue_wool>, <item:quark:blue_stool>);
makeStool("purple", <item:minecraft:purple_wool>, <item:quark:purple_stool>);
makeStool("magenta", <item:minecraft:magenta_wool>, <item:quark:magenta_stool>);
makeStool("pink", <item:minecraft:pink_wool>, <item:quark:pink_stool>);
// makeStool("skyroot", <tag:items:minecraft:wool>.asIItemStack(), <item:ascended_quark:skyroot_stool>);
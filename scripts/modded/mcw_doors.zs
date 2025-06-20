import crafttweaker.api.item.IItemStack;
import crafttweaker.api.tag.type.KnownTag;
import crafttweaker.api.item.ItemDefinition;


val iron = <item:minecraft:iron_ingot>;
val air = <item:minecraft:air>;
val planks = <tag:items:minecraft:planks>;

public function enableVariant(door as IItemStack, tag as KnownTag<ItemDefinition>) as void {
    val wood_type = door.registryName.path;
    for element in tag.elements() {
        val name = element.getRegistryName().path;
        <recipetype:woodworks:sawing>.addJsonRecipe(wood_type + "_" + name, {
            result: element.registryName,
            ingredient: door,
            type: "woodworks:sawmill",
            count: 1
        });
        <recipetype:woodworks:sawing>.addJsonRecipe(name + "_" + wood_type, {
            result: door.registryName,
            ingredient: element.defaultInstance,
            type: "woodworks:sawmill",
            count: 1
        });
    }
}


recipes.removeByModid("mcwdoors");

# Portcullises
craftingTable.remove(<item:mcwdoors:iron_portcullis>);
craftingTable.addShaped("iron_portcullis", <item:mcwdoors:iron_portcullis> * 3, [
    [iron, iron, iron],
    [air, iron, air]
]);

craftingTable.addShaped("wood_portcullis", <item:mcwdoors:wooden_portcullis> * 3, [
    [planks, planks, planks],
    [air, planks, air]
]);

# Wood door variants
enableVariant(<item:minecraft:acacia_door>, <tag:items:musketcraft:mcwdoors/acacia>);
enableVariant(<item:minecraft:bamboo_door>, <tag:items:musketcraft:mcwdoors/bamboo>);
enableVariant(<item:minecraft:cherry_door>, <tag:items:musketcraft:mcwdoors/cherry>);
enableVariant(<item:minecraft:crimson_door>, <tag:items:musketcraft:mcwdoors/crimson>);
enableVariant(<item:minecraft:dark_oak_door>, <tag:items:musketcraft:mcwdoors/dark_oak>);
enableVariant(<item:minecraft:jungle_door>, <tag:items:musketcraft:mcwdoors/jungle>);
enableVariant(<item:minecraft:mangrove_door>, <tag:items:musketcraft:mcwdoors/mangrove>);
enableVariant(<item:minecraft:oak_door>, <tag:items:musketcraft:mcwdoors/oak>);
enableVariant(<item:minecraft:spruce_door>, <tag:items:musketcraft:mcwdoors/spruce>);
enableVariant(<item:minecraft:warped_door>, <tag:items:musketcraft:mcwdoors/warped>);
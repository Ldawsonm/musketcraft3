import crafttweaker.api.text.Component;
import crafttweaker.api.text.MutableComponent;

// var disabled_items = <tag:items:musketeer:hidden_items>;
var variant_items = <tag:items:musketcraft:made_with_variant_selector>;
var disabled_items = <tag:items:musketcraft:disabled_items>;

// var disabled_tooltip = Component.translatable("hidden_tooltip.musketeer") as MutableComponent;
// disabled_tooltip.setStyle(<constant:minecraft:formatting:red>.asStyle());

// var variant_tooltip = Component.translatable("hidden_tooltip.variant") as MutableComponent;
// variant_tooltip.setStyle(<constant:minecraft:formatting:yellow>.asStyle());

for type in game.recipeTypes {
	type.remove(disabled_items);
	type.remove(variant_items);
}

for item in variant_items.elements {
    for type in game.recipeTypes {
        // type.remove(disabled_items);
        type.removeByInput(item);
    }
}

for item in disabled_items.elements {
    for type in game.recipeTypes {
        // type.remove(disabled_items);
        type.removeByInput(item);
    }
}



// disabled_items.asIIngredient().addTooltip(disabled_tooltip);
// variant_items.asIIngredient().addTooltip(variant_tooltip);
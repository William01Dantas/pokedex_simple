enum ApiEndpoint {
  pokemon, // https://pokeapi.co/api/v2/pokemon/
  pokemonSpecies, // https://pokeapi.co/api/v2/pokemon-species/
  pokemonColor, // https://pokeapi.co/api/v2/pokemon-color/
  pokemonForm, // https://pokeapi.co/api/v2/pokemon-form/
  pokemonHabitat, // https://pokeapi.co/api/v2/pokemon-habitat/
  pokemonShape, // https://pokeapi.co/api/v2/pokemon-shape/
  pokemonType, // https://pokeapi.co/api/v2/type/
  pokemonEggGroup, // https://pokeapi.co/api/v2/egg-group/
  pokemonGrowthRate, // https://pokeapi.co/api/v2/growth-rate/
  pokemonNature, // https://pokeapi.co/api/v2/nature/
  pokemonMoveAilment, // https://pokeapi.co/api/v2/move-ailment/
  pokemonMoveBattleStyle, // https://pokeapi.co/api/v2/move-battle-style/
  pokemonMoveCategory, // https://pokeapi.co/api/v2/move-category/
  pokemonMoveDamageClass, // https://pokeapi.co/api/v2/move-damage-class/
  pokemonMoveLearnMethod, // https://pokeapi.co/api/v2/move-learn-method/
  pokemonMoveTarget, // https://pokeapi.co/api/v2/move-target/
  pokemonLocationArea, // https://pokeapi.co/api/v2/location-area/
  pokemonLocation, // https://pokeapi.co/api/v2/location/
  pokemonPalParkArea, // https://pokeapi.co/api/v2/pal-park-area/
  pokemonRegion, // https://pokeapi.co/api/v2/region/
  pokemonGeneration, // https://pokeapi.co/api/v2/generation/
  pokemonVersion, // https://pokeapi.co/api/v2/version/
  pokemonVersionGroup, // https://pokeapi.co/api/v2/version-group/
  pokemonItem, // https://pokeapi.co/api/v2/item/
  pokemonItemAttribute, // https://pokeapi.co/api/v2/item-attribute/
  pokemonItemCategory, // https://pokeapi.co/api/v2/item-category/
  pokemonItemFlingEffect, // https://pokeapi.co/api/v2/item-fling-effect/
  pokemonItemPocket, // https://pokeapi.co/api/v2/item-pocket/
  pokemonMachine, // https://pokeapi.co/api/v2/machine/
  pokemonEncounterMethod, // https://pokeapi.co/api/v2/encounter-method/
  ability, // https://pokeapi.co/api/v2/ability/
}

extension ApiEndpointExtension on ApiEndpoint {
  String get name {
    switch (this) {
      case ApiEndpoint.pokemon:
        return 'pokemon';
      case ApiEndpoint.pokemonSpecies:
        return 'pokemon-species';
      case ApiEndpoint.pokemonColor:
        return 'pokemon-color';
      case ApiEndpoint.pokemonForm:
        return 'pokemon-form';
      case ApiEndpoint.pokemonHabitat:
        return 'pokemon-habitat';
      case ApiEndpoint.pokemonShape:
        return 'pokemon-shape';
      case ApiEndpoint.pokemonType:
        return 'type';
      case ApiEndpoint.pokemonEggGroup:
        return 'egg-group';
      case ApiEndpoint.pokemonGrowthRate:
        return 'growth-rate';
      case ApiEndpoint.pokemonNature:
        return 'nature';
      case ApiEndpoint.pokemonMoveAilment:
        return 'move-ailment';
      case ApiEndpoint.pokemonMoveBattleStyle:
        return 'move-battle-style';
      case ApiEndpoint.pokemonMoveCategory:
        return 'move-category';
      case ApiEndpoint.pokemonMoveDamageClass:
        return 'move-damage-class';
      case ApiEndpoint.pokemonMoveLearnMethod:
        return 'move-learn-method';
      case ApiEndpoint.pokemonMoveTarget:
        return 'move-target';
      case ApiEndpoint.pokemonLocationArea:
        return 'location-area';
      case ApiEndpoint.pokemonLocation:
        return 'location';
      case ApiEndpoint.pokemonPalParkArea:
        return 'pal-park-area';
      case ApiEndpoint.pokemonRegion:
        return 'region';
      case ApiEndpoint.pokemonGeneration:
        return 'generation';
      case ApiEndpoint.pokemonVersion:
        return 'version';
      case ApiEndpoint.pokemonVersionGroup:
        return 'version-group';
      case ApiEndpoint.pokemonItem:
        return 'item';
      case ApiEndpoint.pokemonItemAttribute:
        return 'item-attribute';
      case ApiEndpoint.pokemonItemCategory:
        return 'item-category';
      case ApiEndpoint.pokemonItemFlingEffect:
        return 'item-fling-effect';
      case ApiEndpoint.pokemonItemPocket:
        return 'item-pocket';
      case ApiEndpoint.pokemonMachine:
        return 'machine';
      case ApiEndpoint.pokemonEncounterMethod:
        return 'encounter-method';
      case ApiEndpoint.ability:
        return 'ability';
    }
  }
}

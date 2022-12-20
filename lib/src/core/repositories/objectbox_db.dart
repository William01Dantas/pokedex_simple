import 'package:flutter/material.dart';
import 'package:pokedex/src/core/entities/objectbox.g.dart';
import 'package:pokedex/src/core/entities/pokemon_entity.dart';
import 'package:pokedex/src/core/presenters/shared/snack_bar_messenger.dart';
import 'package:pokedex/src/core/presenters/theme/color_outlet.dart';

class ObjectBoxDB {
  /// The Store of this app.
  late final Store store;

  ObjectBoxDB._create(this.store) {
    // Add any additional setup code, e.g. build queries.
  }

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<ObjectBoxDB> create() async {
    // Future<Store> openStore() {...} is defined in the generated objectbox.g.dart
    final store = await openStore();
    return ObjectBoxDB._create(store);
  }

// adicionar um pokemon no banco de dados
  addPokemon(PokemonEntity pokemon) async {
    final box = store.box<PokemonEntity>();
    box.put(pokemon);
  }

  // remover um pokemon do banco de dados
  removePokemon(PokemonEntity pokemon) async {
    final box = store.box<PokemonEntity>();
    box.remove(pokemon.id);
  }

  favoritePokemon(PokemonEntity pokemon, BuildContext context) async {
    final box = store.box<PokemonEntity>();
    final query = box.query(PokemonEntity_.name.equals(pokemon.name!)).build();
    final pokemonEntity = query.find();
    if (pokemonEntity.isNotEmpty) {
      box.remove(pokemonEntity[0].id);
      snackBarMessenger(context: context, message: 'Pokemon removido dos favoritos', color: ColorOutlet.colorCardRed.withOpacity(0.8));
    } else {
      box.put(pokemon);
      snackBarMessenger(context: context, message: 'Pokemon adicionado aos favoritos', color: ColorOutlet.colorPrimary.withOpacity(0.8));
    }
  }

  checkFavoritePokemon(String name) async {
    final box = store.box<PokemonEntity>();
    final query = box.query(PokemonEntity_.name.equals(name)).build();
    final pokemonEntity = query.find();
    if (pokemonEntity.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  // garregar todos os pokemons favoritados
  Future<List<PokemonEntity>> getAllPokemons() async {
    final box = store.box<PokemonEntity>();
    final query = box.query().build();
    final pokemonEntity = query.find();
    return pokemonEntity;
  }
}

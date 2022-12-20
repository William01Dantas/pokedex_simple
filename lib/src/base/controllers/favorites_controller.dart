import 'package:flutter/cupertino.dart';
import 'package:pokedex/src/base/models/pokemon.dart';
import 'package:pokedex/src/core/entities/pokemon_entity.dart';
import 'package:pokedex/src/core/infra/api.dart';
import 'package:pokedex/src/core/infra/api_endpoints.dart';
import 'package:pokedex/src/core/services/dio_services.dart';

import '../../core/repositories/objectbox_db.dart';


class FavoritesController extends ChangeNotifier {
  final ObjectBoxDB objectBoxDB;

  PageController pageControllerFavorites = PageController(initialPage: 0);
  ValueNotifier<int> basePageIndexFavorites = ValueNotifier<int>(0);
  TextEditingController controllerSearch = TextEditingController();
  ValueNotifier<int> quantidadeDePokemons = ValueNotifier<int>(0);
  ValueNotifier<bool> isLoadList = ValueNotifier<bool>(false);
  ValueNotifier<List> listaPokemon = ValueNotifier<List>([]);
  List listaPokemonAux = [];
  ValueNotifier<List<PokemonEntity>> listaPokemonInicial = ValueNotifier<List<PokemonEntity>>([]);

  FavoritesController({required this.objectBoxDB});
  searchPokemon() {
    if (controllerSearch.text.isNotEmpty) {
      listaPokemon.value =
          listaPokemonAux.where((element) => element.name.toLowerCase().contains(controllerSearch.text.toLowerCase())).toList();
      quantidadeDePokemons.value = listaPokemon.value.length;
      notifyListeners();
    } else {
      listaPokemon.value = listaPokemonAux;
      quantidadeDePokemons.value = listaPokemon.value.length;
      notifyListeners();
    }
  }

  void loadList() {
    objectBoxDB.getAllPokemons().then((value) async {
      isLoadList.value = false;
      listaPokemon.value = [];
      listaPokemonAux = [];
      quantidadeDePokemons.value = 0;
      listaPokemonInicial.value = value;

      for (var pokemon in value) {
        await DioServices.get('${Api.apiUrl}${ApiEndpoint.pokemon.name}/${pokemon.name}').then((valuePokemon) async {
          listaPokemon.value.add(Pokemon(
            id: valuePokemon.data['id'],
            name: valuePokemon.data['name'],
            sprite: valuePokemon.data['sprites']['other']['dream_world']['front_default'],
            stats: valuePokemon.data['stats'],
            types: valuePokemon.data['types'],
            color: pokemon.color!,
          ));
          listaPokemonAux.add(Pokemon(
            id: valuePokemon.data['id'],
            name: valuePokemon.data['name'],
            sprite: valuePokemon.data['sprites']['other']['dream_world']['front_default'],
            stats: valuePokemon.data['stats'],
            types: valuePokemon.data['types'],
            color: pokemon.color!,
          ));

          quantidadeDePokemons.value = listaPokemonInicial.value.length;
        });
      }
      isLoadList.value = true;

      listaPokemon.value.sort((a, b) => a.id!.compareTo(b.id!));
      listaPokemonAux.sort((a, b) => a.id!.compareTo(b.id!));
    });
  }
}

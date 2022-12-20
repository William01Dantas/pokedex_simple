import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/src/core/presenters/shared/card_pokemon.dart';
import 'package:pokedex/src/core/presenters/theme/size_outlet.dart';
import 'package:pokedex/src/core/repositories/objectbox_db.dart';

import '../../controllers/favorites_controller.dart';
import '../../controllers/pokedex_controller.dart';
import '../../models/pokemon.dart';
import '../home_view/widgets/header_home.dart';

class FavoritesView extends StatefulWidget {
  final FavoritesController controller;
  final ObjectBoxDB objectBoxDB;
  final PageController pageController;
  final ValueNotifier<int> basePageIndex;
  final PokedexController pokedexController;
  const FavoritesView(
      {super.key,
      required this.controller,
      required this.objectBoxDB,
      required this.pageController,
      required this.basePageIndex,
      required this.pokedexController});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(
          controllerSearch: widget.controller.controllerSearch,
          title: 'Favorites',
          onChanged: (value) {
            widget.controller.searchPokemon();
          },
        ),
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: widget.controller.isLoadList,
            builder: (context, value, child) => widget.controller.isLoadList.value
                ? ValueListenableBuilder(
                    valueListenable: widget.controller.quantidadeDePokemons,
                    builder: (context, value, child) => ValueListenableBuilder(
                      valueListenable: widget.controller.listaPokemon,
                      builder: (context, value, child) => ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: widget.controller.quantidadeDePokemons.value,
                        itemBuilder: (context, index) {
                          return CardPokemon(
                            pokemon: Pokemon(
                              color: widget.controller.listaPokemon.value[index].color,
                              id: widget.controller.listaPokemon.value[index].id,
                              name: widget.controller.listaPokemon.value[index].name,
                              sprite: widget.controller.listaPokemon.value[index].sprite,
                              types: widget.controller.listaPokemon.value[index].types,
                              stats: widget.controller.listaPokemon.value[index].stats,
                            ),
                            favoritesController: widget.controller,
                            objectBoxDB: widget.objectBoxDB,
                            onTap: () {
                              widget.pageController.animateToPage(1, duration: const Duration(milliseconds: 500), curve: Curves.ease);
                              widget.basePageIndex.value = 1;
                              widget.pokedexController.pokemon = widget.controller.listaPokemon.value[index];
                            },
                          );
                        },
                      ),
                    ),
                  )
                : SizedBox(
                    height: MediaQuery.of(context).size.height * 0.65,
                    child: Center(
                      child: Lottie.asset(
                        'assets/lottie/pokeball_loading.json',
                        width: SizeOutlet.imageSizeLarge,
                        height: SizeOutlet.imageSizeLarge,
                      ),
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}

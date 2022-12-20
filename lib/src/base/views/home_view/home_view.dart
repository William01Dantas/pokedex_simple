import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/src/base/controllers/favorites_controller.dart';
import 'package:pokedex/src/base/controllers/home_controller.dart';
import 'package:pokedex/src/base/controllers/pokedex_controller.dart';
import 'package:pokedex/src/base/views/home_view/widgets/header_home.dart';
import 'package:pokedex/src/core/presenters/shared/card_pokemon.dart';
import 'package:pokedex/src/core/presenters/theme/size_outlet.dart';
import 'package:pokedex/src/core/repositories/objectbox_db.dart';

class HomeView extends StatefulWidget {
  final HomeController controller;
  final PageController pageController;
  final FavoritesController favoritesController;
  final PokedexController pokedexController;
  final ValueNotifier<int> basePageIndex;
  final ObjectBoxDB objectBoxDB;
  const HomeView({
    Key? key,
    required this.controller,
    required this.pageController,
    required this.basePageIndex,
    required this.pokedexController,
    required this.objectBoxDB,
    required this.favoritesController,
  }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(
          controllerSearch: widget.controller.controllerSearch,
          title: 'Pokédex',
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
                            objectBoxDB: widget.objectBoxDB,
                            pokemon: widget.controller.listaPokemon.value[index],
                            onTap: () {
                              widget.pageController.animateToPage(1, duration: const Duration(milliseconds: 500), curve: Curves.ease);
                              widget.basePageIndex.value = 1;
                              widget.pokedexController.pokemon = widget.controller.listaPokemon.value[index];
                            },
                            favoritesController: widget.favoritesController,
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

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/src/base/views/home_view/widgets/pokedex_aba_ability.dart';
import 'package:pokedex/src/base/views/home_view/widgets/pokedex_select_aba.dart';
import 'package:pokedex/src/core/entities/pokemon_entity.dart';
import 'package:pokedex/src/core/presenters/functions/functions.dart';
import 'package:pokedex/src/core/presenters/shared/favorited_button.dart';
import 'package:pokedex/src/core/presenters/theme/color_outlet.dart';
import 'package:pokedex/src/core/presenters/theme/font_family_outlet.dart';
import 'package:pokedex/src/core/presenters/theme/size_outlet.dart';
import 'package:pokedex/src/core/repositories/objectbox_db.dart';

import '../../controllers/pokedex_controller.dart';
import '../home_view/widgets/pokedex_aba_evolution.dart';
import '../home_view/widgets/pokedex_aba_location.dart';
import '../home_view/widgets/pokedex_aba_moves.dart';
import '../home_view/widgets/pokedex_aba_stats.dart';


class PokedexView extends StatefulWidget {
  final PokedexController controller;
  final PageController pageController;
  final ValueNotifier<int> basePageIndex;
  final ObjectBoxDB objectBoxDB;
  const PokedexView({
    super.key,
    required this.controller,
    required this.pageController,
    required this.objectBoxDB,
    required this.basePageIndex,
  });

  @override
  State<PokedexView> createState() => _PokedexViewState();
}

class _PokedexViewState extends State<PokedexView> {
  ValueNotifier<bool> isFavorite = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    widget.objectBoxDB.checkFavoritePokemon(widget.controller.pokemon.name).then((value) {
      isFavorite.value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Functions.colorCard(widget.controller.pokemon.color),
      child: Stack(alignment: Alignment.bottomCenter, children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.58,
          decoration: const BoxDecoration(
            color: ColorOutlet.colorWhite,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(SizeOutlet.borderRadiusizeHuge),
              topRight: Radius.circular(SizeOutlet.borderRadiusizeHuge),
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.11,
          child: Hero(
            transitionOnUserGestures: true,
            tag: widget.controller.pokemon.name,
            child: SvgPicture.network(
              widget.controller.pokemon.sprite,
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.3,
              placeholderBuilder: (context) => Center(
                child: Lottie.asset(
                  'assets/lottie/pokeball_loading.json',
                  width: SizeOutlet.imageSizeLarge,
                  height: SizeOutlet.imageSizeLarge,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.025,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: ColorOutlet.colorWhite,
                    size: SizeOutlet.iconSizeMedium,
                  ),
                  onPressed: () {
                    widget.pageController.animateToPage(0, duration: const Duration(milliseconds: 500), curve: Curves.ease);
                    widget.basePageIndex.value = 0;
                  },
                ),
                Text(
                  Functions.upperCaseFirstLetter(widget.controller.pokemon.name),
                  style: const TextStyle(
                    fontSize: SizeOutlet.textSizeDefault,
                    fontFamily: FontFamilyOutlet.defaultFontFamilyMedium,
                    color: ColorOutlet.colorWhite,
                  ),
                ),
                FavoritedButton(
                  isFavorited: isFavorite,
                  size: SizeOutlet.iconSizeMedium,
                  onTap: () async {
                    await widget.objectBoxDB.favoritePokemon(
                      PokemonEntity(
                        name: widget.controller.pokemon.name,
                        color: widget.controller.pokemon.color,
                      ),
                      context,
                    );
                    isFavorite.value = !isFavorite.value;
                  },
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.43,
          child: Column(
            children: [
              PokedexSelectAba(controller: widget.controller),
              Padding(
                padding: const EdgeInsets.only(top: SizeOutlet.paddingSizeLarge),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.45,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: widget.controller.pageControllerPokedex,
                    children: [
                      PokedexAbaAbility(controller: widget.controller),
                      PokedexAbaStats(controller: widget.controller),
                      PokedexAbaMoves(controller: widget.controller),
                      PokedexAbaEvolution(controller: widget.controller),
                      PokedexAbaLocation(controller: widget.controller),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}

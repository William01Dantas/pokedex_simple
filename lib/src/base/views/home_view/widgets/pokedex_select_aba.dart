import 'package:flutter/material.dart';
import 'package:pokedex/src/core/presenters/functions/functions.dart';
import 'package:pokedex/src/core/presenters/shared/toggle_option_text.dart';
import '../../../controllers/pokedex_controller.dart';

class PokedexSelectAba extends StatefulWidget {
  final PokedexController controller;
  const PokedexSelectAba({super.key, required this.controller});

  @override
  State<PokedexSelectAba> createState() => _PokedexSelectAbaState();
}

class _PokedexSelectAbaState extends State<PokedexSelectAba> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: MediaQuery.of(context).size.width * 0.9,
      child: ValueListenableBuilder(
        valueListenable: widget.controller.basePageIndexPokedex,
        builder: (context, value, child) => ListView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: [
            ToggleOptionText(
              title: 'Ability',
              isSelected: widget.controller.basePageIndexPokedex.value == 0,
              onTap: () {
                widget.controller.basePageIndexPokedex.value = 0;
                widget.controller.pageControllerPokedex.jumpToPage(0);
              },
              color: Functions.colorCard(widget.controller.pokemon.color),
            ),
            ToggleOptionText(
              title: 'Stats',
              isSelected: widget.controller.basePageIndexPokedex.value == 1,
              onTap: () {
                widget.controller.basePageIndexPokedex.value = 1;
                widget.controller.pageControllerPokedex.jumpToPage(1);
              },
              color: Functions.colorCard(widget.controller.pokemon.color),
            ),
            ToggleOptionText(
              title: 'Moves',
              isSelected: widget.controller.basePageIndexPokedex.value == 2,
              onTap: () {
                widget.controller.basePageIndexPokedex.value = 2;
                widget.controller.pageControllerPokedex.jumpToPage(2);
              },
              color: Functions.colorCard(widget.controller.pokemon.color),
            ),
            ToggleOptionText(
              title: 'Evolution',
              isSelected: widget.controller.basePageIndexPokedex.value == 3,
              onTap: () {
                widget.controller.basePageIndexPokedex.value = 3;
                widget.controller.pageControllerPokedex.jumpToPage(3);
              },
              color: Functions.colorCard(widget.controller.pokemon.color),
            ),
            ToggleOptionText(
              title: 'Location',
              isSelected: widget.controller.basePageIndexPokedex.value == 4,
              onTap: () {
                widget.controller.basePageIndexPokedex.value = 4;
                widget.controller.pageControllerPokedex.jumpToPage(4);
              },
              color: Functions.colorCard(widget.controller.pokemon.color),
            ),
          ],
        ),
      ),
    );
  }
}

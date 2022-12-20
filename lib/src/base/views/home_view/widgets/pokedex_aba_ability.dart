import 'package:flutter/material.dart';

import '../../../controllers/pokedex_controller.dart';

class PokedexAbaAbility extends StatefulWidget {
  final PokedexController controller;
  const PokedexAbaAbility({super.key, required this.controller});

  @override
  State<PokedexAbaAbility> createState() => _PokedexAbaAbilityState();
}

class _PokedexAbaAbilityState extends State<PokedexAbaAbility> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [],
    );
  }
}

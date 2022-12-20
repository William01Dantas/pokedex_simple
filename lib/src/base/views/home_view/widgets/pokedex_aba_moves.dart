import 'package:flutter/material.dart';
import 'package:pokedex/src/base/controllers/pokedex_controller.dart';


class PokedexAbaMoves extends StatefulWidget {
  final PokedexController controller;
  const PokedexAbaMoves({super.key, required this.controller});

  @override
  State<PokedexAbaMoves> createState() => _PokedexAbaMovesState();
}

class _PokedexAbaMovesState extends State<PokedexAbaMoves> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

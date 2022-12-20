import 'package:flutter/material.dart';
import '../../../../core/presenters/functions/functions.dart';
import '../../../../core/presenters/shared/stats_linear_progress_Indicator.dart';
import '../../../controllers/pokedex_controller.dart';

class PokedexAbaStats extends StatefulWidget {
  final PokedexController controller;
  const PokedexAbaStats({super.key, required this.controller});

  @override
  State<PokedexAbaStats> createState() => _PokedexAbaStatsState();
}

class _PokedexAbaStatsState extends State<PokedexAbaStats> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StateLinearProgressIndicator(
          color: Functions.colorCard(widget.controller.pokemon.color),
          // primeira letra maiuscula
          value: widget.controller.pokemon.stats[0]['base_stat'].toDouble(),
          title: Functions.getAbreviation(Functions.upperCaseFirstLetter(widget.controller.pokemon.stats[0]['stat']['name'])),
        ),
        StateLinearProgressIndicator(
          color: Functions.colorCard(widget.controller.pokemon.color),
          value: widget.controller.pokemon.stats[1]['base_stat'].toDouble(),
          title: Functions.getAbreviation(Functions.upperCaseFirstLetter(widget.controller.pokemon.stats[1]['stat']['name'])),
        ),
        StateLinearProgressIndicator(
          color: Functions.colorCard(widget.controller.pokemon.color),
          value: widget.controller.pokemon.stats[2]['base_stat'].toDouble(),
          title: Functions.getAbreviation(Functions.upperCaseFirstLetter(widget.controller.pokemon.stats[2]['stat']['name'])),
        ),
        StateLinearProgressIndicator(
          color: Functions.colorCard(widget.controller.pokemon.color),
          value: widget.controller.pokemon.stats[3]['base_stat'].toDouble(),
          title: Functions.getAbreviation(Functions.upperCaseFirstLetter(widget.controller.pokemon.stats[3]['stat']['name'])),
        ),
        StateLinearProgressIndicator(
          color: Functions.colorCard(widget.controller.pokemon.color),
          value: widget.controller.pokemon.stats[4]['base_stat'].toDouble(),
          title: Functions.getAbreviation(Functions.upperCaseFirstLetter(widget.controller.pokemon.stats[4]['stat']['name'])),
        ),
        StateLinearProgressIndicator(
          color: Functions.colorCard(widget.controller.pokemon.color),
          value: widget.controller.pokemon.stats[5]['base_stat'].toDouble(),
          title: Functions.getAbreviation(Functions.upperCaseFirstLetter(widget.controller.pokemon.stats[5]['stat']['name'])),
        ),
      ],
    );
  }
}

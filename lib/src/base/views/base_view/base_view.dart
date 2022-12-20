import 'package:flutter/material.dart';
import 'package:pokedex/src/base/controllers/base_controller.dart';
import 'package:pokedex/src/core/presenters/shared/scaffold_base.dart';

class BaseView extends StatefulWidget {
  final BaseController controller;

  const BaseView({super.key, required this.controller});

  @override
  State<BaseView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<BaseView> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldBase(
      pageController: widget.controller.pageController,
      basePageIndex: widget.controller.basePageIndex,
      favoritesController: widget.controller.favoritesController,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: widget.controller.pageController,
        children: widget.controller.pages,
      ),
    );
  }
}

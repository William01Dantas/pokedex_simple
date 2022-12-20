import 'package:flutter/material.dart';
import 'package:pokedex/src/base/controllers/favorites_controller.dart';
import 'package:pokedex/src/core/presenters/shared/icone_bottom_nav.dart';
import 'package:pokedex/src/core/presenters/theme/color_outlet.dart';
import 'package:pokedex/src/core/presenters/theme/size_outlet.dart';


class ScaffoldBase extends StatefulWidget {
  final ValueNotifier<int> basePageIndex;
  final PageController pageController;
  final FavoritesController favoritesController;
  final Widget body;
  const ScaffoldBase({
    super.key,
    required this.body,
    required this.basePageIndex,
    required this.pageController,
    required this.favoritesController,
  });

  @override
  State<ScaffoldBase> createState() => _ScaffoldBaseState();
}

class _ScaffoldBaseState extends State<ScaffoldBase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            widget.body,
            Positioned(
              top: MediaQuery.of(context).size.height * SizeOutlet.sizeBottomBarTop,
              right: MediaQuery.of(context).size.width * SizeOutlet.sizeBottomBarRight,
              bottom: MediaQuery.of(context).size.height * SizeOutlet.sizeBottomBarBottom,
              left: MediaQuery.of(context).size.width * SizeOutlet.sizeBottomBarLeft,
              child: ValueListenableBuilder(
                valueListenable: widget.basePageIndex,
                builder: (context, value, _) => Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(SizeOutlet.borderRadiusSizeBig),
                    boxShadow: const [
                      BoxShadow(
                        color: ColorOutlet.colorShadow,
                        spreadRadius: SizeOutlet.spreadRadius,
                        blurRadius: SizeOutlet.blurRadius,
                        offset: Offset(1, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: SizeOutlet.scaffoldSymmetricPadding),
                    child: Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      IconebottomNav(
                        icon: Icons.home,
                        isSelected: value == 0,
                        onPressed: () {
                          widget.pageController.animateToPage(0, duration: const Duration(milliseconds: 500), curve: Curves.ease);
                          widget.basePageIndex.value = 0;
                        },
                      ),
                      IconebottomNav(
                        icon: Icons.import_contacts,
                        isSelected: value == 1,
                        onPressed: () {
                          widget.pageController.animateToPage(1, duration: const Duration(milliseconds: 500), curve: Curves.ease);
                          widget.basePageIndex.value = 1;
                        },
                      ),
                      IconebottomNav(
                        icon: Icons.favorite_outline,
                        isSelected: value == 2,
                        onPressed: () {
                          widget.pageController.animateToPage(2, duration: const Duration(milliseconds: 500), curve: Curves.ease);
                          widget.basePageIndex.value = 2;
                          widget.favoritesController.loadList();
                        },
                      ),
                    ]),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

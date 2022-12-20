import 'package:flutter/material.dart';
import 'package:pokedex/src/core/presenters/shared/input_field.dart';
import 'package:pokedex/src/core/presenters/theme/color_outlet.dart';
import 'package:pokedex/src/core/presenters/theme/font_family_outlet.dart';
import 'package:pokedex/src/core/presenters/theme/size_outlet.dart';

class Header extends StatelessWidget {
  final TextEditingController controllerSearch;
  final Function(String) onChanged;
  final String title;
  const Header({
    super.key,
    required this.controllerSearch,
    required this.onChanged,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.20,
      decoration: const BoxDecoration(
        color: ColorOutlet.colorPrimary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(SizeOutlet.borderRadiusSizePattern),
          bottomRight: Radius.circular(SizeOutlet.borderRadiusSizePattern),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: ColorOutlet.colorWhite,
                    fontSize: SizeOutlet.textSizeDefault,
                    fontFamily: FontFamilyOutlet.defaultFontFamilyMedium,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.light_mode,
                    color: ColorOutlet.colorWhite,
                    size: SizeOutlet.textSizeDefault,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: InputField(
                controller: controllerSearch,
                label: 'Search Pokémon',
                prefixIcon: Icons.search,
                onChanged: onChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

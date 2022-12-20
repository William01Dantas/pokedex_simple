import 'package:flutter/material.dart';
import 'package:pokedex/src/core/presenters/theme/color_outlet.dart';
import 'package:pokedex/src/core/presenters/theme/font_family_outlet.dart';
import 'package:pokedex/src/core/presenters/theme/size_outlet.dart';

class Tag extends StatelessWidget {
  final String text;
  const Tag({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: SizeOutlet.paddingSizeSmall, vertical: SizeOutlet.paddingSizeMicro),
      margin: const EdgeInsets.only(right: SizeOutlet.paddingSizeSmall),
      decoration: const BoxDecoration(
        color: ColorOutlet.colorShadow,
        borderRadius: BorderRadius.all(Radius.circular(SizeOutlet.borderRadiusSizePattern)),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: ColorOutlet.colorWhite,
          fontSize: SizeOutlet.textSizeMicro1,
          fontFamily: FontFamilyOutlet.defaultFontFamilyRegular,
        ),
      ),
    );
  }
}

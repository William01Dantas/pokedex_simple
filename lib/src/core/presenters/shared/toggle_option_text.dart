import 'package:flutter/material.dart';
import 'package:pokedex/src/core/presenters/theme/color_outlet.dart';
import 'package:pokedex/src/core/presenters/theme/font_family_outlet.dart';

class ToggleOptionText extends StatelessWidget {
  final String title;
  final bool isSelected;
  final Function()? onTap;
  final Color color;
  const ToggleOptionText({
    super.key,
    required this.title,
    this.onTap,
    required this.color,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isSelected ? color : Colors.transparent,
                width: 4,
              ),
            ),
          ),
          child: Text(
            title,
            style: TextStyle(
                fontSize: 16, color: isSelected ? color : ColorOutlet.colorCardGray, fontFamily: FontFamilyOutlet.defaultFontFamilyMedium),
          ),
        ),
      ),
    );
  }
}

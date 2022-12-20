import 'package:flutter/material.dart';
import 'package:pokedex/src/core/presenters/theme/color_outlet.dart';
import 'package:pokedex/src/core/presenters/theme/size_outlet.dart';

class IconebottomNav extends StatefulWidget {
  final bool isSelected;
  final IconData icon;
  final Function()? onPressed;
  const IconebottomNav({
    super.key,
    required this.isSelected,
    required this.icon,
    this.onPressed,
  });

  @override
  State<IconebottomNav> createState() => _IconebottomNavState();
}

class _IconebottomNavState extends State<IconebottomNav> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorOutlet.colorTransparent,
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(SizeOutlet.borderRadiusSizePattern)),
        onTap: widget.onPressed,
        child: Icon(
          widget.icon,
          color: widget.isSelected ? ColorOutlet.colorPrimary : ColorOutlet.colorGrey,
          size: SizeOutlet.iconSizeMedium,
        ),
      ),
    );
  }
}

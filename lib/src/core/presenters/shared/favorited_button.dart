// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:pokedex/src/core/presenters/theme/color_outlet.dart';

class FavoritedButton extends StatefulWidget {
  ValueNotifier<bool> isFavorited;
  Function()? onTap;
  final double size;
  FavoritedButton({super.key, required this.isFavorited, required this.size, this.onTap});

  @override
  State<FavoritedButton> createState() => _FavoritedButtonState();
}

class _FavoritedButtonState extends State<FavoritedButton> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.isFavorited,
      builder: (context, value, child) => InkWell(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        child: Icon(
          (widget.isFavorited.value) ? Icons.favorite : Icons.favorite_border_sharp,
          color: ColorOutlet.colorWhite,
          size: widget.size,
        ),
        onTap: () {
          widget.onTap?.call();
        },
      ),
    );
  }
}

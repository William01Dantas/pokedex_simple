import 'package:flutter/material.dart';

import '../theme/color_outlet.dart';
import '../theme/font_family_outlet.dart';
import '../theme/size_outlet.dart';

class StateLinearProgressIndicator extends StatelessWidget {
  final Color color;
  final double value;
  final String title;
  const StateLinearProgressIndicator({super.key, required this.color, required this.value, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: SizeOutlet.paddingSizeMedium),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Row(
          children: [
            SizedBox(
              width: 100,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: SizeOutlet.textSizeMicro1,
                  fontFamily: FontFamilyOutlet.defaultFontFamilyMedium,
                  color: ColorOutlet.colorGrey,
                ),
              ),
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(SizeOutlet.borderRadiusSizeMedium)),
                child: LinearProgressIndicator(
                  value: value / 255,
                  backgroundColor: ColorOutlet.colorGreyLight,
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                  minHeight: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

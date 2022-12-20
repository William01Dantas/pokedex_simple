import 'package:flutter/material.dart';

import '../theme/size_outlet.dart';

snackBarMessenger({String message = '', Color color = Colors.transparent, required BuildContext context}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    duration: const Duration(seconds: 1),
    behavior: SnackBarBehavior.floating,
    dismissDirection: DismissDirection.horizontal,
    elevation: 5,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(SizeOutlet.borderRadiusSizeNormal))),
    backgroundColor: color,
  ));
}

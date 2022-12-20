import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/src/modules/app_module.dart';
import 'package:pokedex/app_widget.dart';
import 'package:pokedex/src/core/repositories/objectbox_db.dart';

late ObjectBoxDB objectbox;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  objectbox = await ObjectBoxDB.create();
  Modular.to.addListener(() {
    debugPrint('Modular.to: ${Modular.to}');
  });
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}

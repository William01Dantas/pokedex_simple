import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/src/base/base_module.dart';
import 'package:pokedex/src/base/views/splash_view/splash_view.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const SplashView()),
        ModuleRoute('/base', module: BaseModule()),
      ];
}

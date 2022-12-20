import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/src/core/presenters/theme/size_outlet.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: 1),
            duration: const Duration(milliseconds: 600),
            builder: (context, double value, child) {
              return AnimatedOpacity(
                opacity: value,
                onEnd: () {
                  Future.delayed(
                    const Duration(seconds: 1),
                    () {
                      Modular.to.navigate('/base/');
                    },
                  );
                },
                duration: const Duration(milliseconds: 600),
                child: Transform.scale(scale: value, child: child),
              );
            },
            child: Image.asset(
              'assets/images/logo.png',
              width: SizeOutlet.imageSizeHuge,
            ),
          ),
        ),
      ),
    );
  }
}

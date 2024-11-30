import 'package:flutter/material.dart';

class AppHero extends StatelessWidget {
  final Object tag;
  final Widget child;

  const AppHero({
    Key? key,
    required this.tag,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
        key: key,
        tag: tag,
        transitionOnUserGestures: true,
        flightShuttleBuilder: (_, __, ___, ____, toHeroContext) {
          final Hero toHero = toHeroContext.widget as Hero;
          return Material(
            color: Colors.transparent,
            child: toHero.child,
          );
        },
        child: child);
  }
}

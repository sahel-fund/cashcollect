import 'package:auto_route/auto_route.dart';
import 'package:cashcollect/src/config/palette.dart';
import 'package:cashcollect/src/router/router.gr.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AutoTabsScaffold(
      routes: const [Login(), Signup(), Welcome()],
      builder: (context, child, animation) => ScaleTransition(
        scale: animation,
        child: child,
      ),
      bottomNavigationBuilder: (context, router) {
        return BottomNavigationBar(
          elevation: 12,
          // backgroundColor: Colors.white,
          selectedItemColor: Palette.primary,
          unselectedItemColor: Palette.primary.withOpacity(.55),
          currentIndex: router.activeIndex,
          onTap: (index) => router.setActiveIndex(index),
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                EvaIcons.homeOutline,
                size: 22,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                EvaIcons.pin,
                size: 22,
              ),
              label: "Surveys",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                EvaIcons.settingsOutline,
                size: 22,
              ),
              backgroundColor: Palette.dark,
              label: "Setings",
            ),
          ],
        );
      },
    );
  }
}

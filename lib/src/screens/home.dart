import 'package:auto_route/auto_route.dart';
import 'package:cashcollect/src/config/palette.dart';
import 'package:cashcollect/src/router/router.gr.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iconly/iconly.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: AutoTabsScaffold(
        routes: const [
          Intro(),
          Surveys(),
          History(),
          Settings(),
        ],
        builder: (context, child, animation) => ScaleTransition(
          scale: animation,
          child: child,
        ),
        bottomNavigationBuilder: (context, router) {
          return ValueListenableBuilder(
            valueListenable: Hive.box('settings').listenable(),
            builder: (BuildContext context, Box box, Widget? widget) =>
                BottomNavigationBar(
              elevation: 12,
              backgroundColor:
                  box.get('theme') ? Palette.backgroundDark : Palette.lightGrey,
              selectedItemColor: Palette.primary,
              unselectedItemColor: Palette.primary.withOpacity(.55),
              currentIndex: router.activeIndex,
              onTap: (index) => router.setActiveIndex(index),
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    IconlyBroken.home,
                    size: 18,
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    IconlyBroken.chart,
                    size: 18,
                  ),
                  label: "Surveys",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    IconlyBroken.swap,
                    size: 18,
                  ),
                  backgroundColor: Palette.dark,
                  label: "Historique",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    IconlyBroken.setting,
                    size: 18,
                  ),
                  backgroundColor: Palette.dark,
                  label: "Settings",
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

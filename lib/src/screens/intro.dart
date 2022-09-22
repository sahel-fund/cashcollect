import 'package:cashcollect/src/config/palette.dart';
import 'package:cashcollect/src/config/text_styles.dart';
import 'package:cashcollect/src/widgets/box.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Intro extends ConsumerWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 220,
            ),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: const [
                Box(
                  title: 'SURVEYS',
                  icon: Icon(
                    EvaIcons.barChart,
                    size: 54,
                    color: Palette.lightGrey,
                  ),
                  desc: 'Complete surveys',
                ),
                Box(
                  title: 'HISTORY',
                  icon: Icon(
                    Icons.newspaper,
                    size: 54,
                    color: Palette.lightGrey,
                  ),
                  desc: 'Review answered surveys',
                ),
                Box(
                  title: 'WITHDRAW',
                  icon: Icon(
                    Icons.currency_exchange,
                    size: 54,
                    color: Palette.lightGrey,
                  ),
                  desc: 'Withdraw cash',
                ),
                Box(
                  title: 'SUPPORT',
                  icon: Icon(
                    Icons.support_agent,
                    size: 54,
                    color: Palette.lightGrey,
                  ),
                  desc: 'Ask for help',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

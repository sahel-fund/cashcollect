import 'package:cashcollect/src/config/palette.dart';
import 'package:cashcollect/src/config/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationError extends ConsumerWidget {
  NavigationError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Palette.primary, Palette.secondary, Palette.tertiary],
        ),
      ),
      child: Column(
        children: [
          const Spacer(),
          const Text(
            '404',
            style: TextStyle(
              fontSize: 100,
              fontWeight: FontWeight.bold,
              color: Palette.light,
            ),
          ),
          Text(
            'Page not found',
            style: TextStyles.designText(
              bold: true,
              size: 22,
              color: Palette.light,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

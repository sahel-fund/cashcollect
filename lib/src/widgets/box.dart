import 'package:cashcollect/src/config/palette.dart';
import 'package:cashcollect/src/config/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Box extends ConsumerWidget {
  final String title;
  final Widget icon;
  final String desc;
  const Box(
      {required this.title, required this.icon, required this.desc, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 140,
      width: 140,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Palette.primary,
            Palette.secondary,
          ],
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyles.designText(
                bold: true, size: 16, color: Palette.lightGrey),
          ),
          const SizedBox(height: 2),
          Text(
            desc,
            style: TextStyles.designText(
                bold: false, size: 10, color: Palette.lightGrey),
          )
        ],
      ),
    );
  }
}

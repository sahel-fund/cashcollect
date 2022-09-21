import 'package:cashcollect/src/config/palette.dart';
import 'package:cashcollect/src/config/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Signup extends ConsumerWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Text(
          'Signup',
          style: TextStyles.designText(
            bold: true,
            size: 22,
            color: Palette.secondary,
          ),
        ),
      ),
    );
  }
}

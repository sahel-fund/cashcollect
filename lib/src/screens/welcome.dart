import 'package:cashcollect/src/config/palette.dart';
import 'package:cashcollect/src/config/text_styles.dart';
import 'package:cashcollect/src/extensions/autorouter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Welcome extends ConsumerWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () => context.autorouter.pushNamed('/login'),
            child: Text(
              'Login',
              style: TextStyles.designText(
                bold: true,
                size: 22,
                color: Palette.secondary,
              ),
            ),
          ),
          TextButton(
            onPressed: () => context.autorouter.pushNamed('/signup'),
            child: Text(
              'Signup',
              style: TextStyles.designText(
                bold: true,
                size: 22,
                color: Palette.secondary,
              ),
            ),
          ),
          TextButton(
            onPressed: () => context.autorouter.pushNamed('/home'),
            child: Text(
              'Home',
              style: TextStyles.designText(
                bold: true,
                size: 22,
                color: Palette.secondary,
              ),
            ),
          ),
          Center(
            child: Text(
              'Welcome',
              style: TextStyles.designText(
                bold: true,
                size: 22,
                color: Palette.secondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

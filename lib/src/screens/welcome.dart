import 'package:cashcollect/src/config/palette.dart';
import 'package:cashcollect/src/config/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Welcome extends ConsumerWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          TextButton(
            onPressed: () => context.go('/login'),
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
            onPressed: () => context.go('/signup'),
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
            onPressed: () => context.go('/home'),
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

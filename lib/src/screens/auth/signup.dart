import 'package:cashcollect/src/config/palette.dart';
import 'package:cashcollect/src/config/text_styles.dart';
import 'package:cashcollect/src/widgets/input.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Signup extends ConsumerWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            const SizedBox(height: 34),
            Input(
              icon: EvaIcons.person,
              label: 'Names',
              hint: 'Alpha Casher',
              validator: (value) {
                return null;
              },
              isPassword: false,
              controller: TextEditingController(),
            ),
            Input(
              icon: EvaIcons.person,
              label: 'Email',
              hint: 'alphacasher@cashcollect.com',
              validator: (value) {
                return null;
              },
              isPassword: false,
              controller: TextEditingController(),
            ),
            Input(
              icon: EvaIcons.person,
              label: 'Phone number',
              type: TextInputType.number,
              hint: '+237 690535759',
              validator: (value) {
                return null;
              },
              isPassword: false,
              controller: TextEditingController(),
            ),
            Input(
              icon: EvaIcons.person,
              label: 'Town',
              hint: 'Ngaoundere',
              validator: (value) {
                return null;
              },
              isPassword: false,
              controller: TextEditingController(),
            ),
          ],
        ),
      ),
    );
  }
}

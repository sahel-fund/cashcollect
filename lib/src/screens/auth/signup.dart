import 'package:cashcollect/src/widgets/button.dart';
import 'package:cashcollect/src/widgets/input.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconly/iconly.dart';

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
              icon: IconlyBroken.profile,
              label: 'Names',
              hint: 'Alpha Casher',
              validator: (value) {
                return null;
              },
              isPassword: false,
              controller: TextEditingController(),
            ),
            Input(
              icon: IconlyBroken.message,
              label: 'Email',
              hint: 'alphacasher@cashcollect.com',
              validator: (value) {
                return null;
              },
              isPassword: false,
              controller: TextEditingController(),
            ),
            Input(
              icon: IconlyBroken.calling,
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
              icon: IconlyBroken.location,
              label: 'Town',
              hint: 'Ngaoundere',
              validator: (value) {
                return null;
              },
              isPassword: false,
              controller: TextEditingController(),
            ),
            const SizedBox(
              height: 24,
            ),
            Button(
              callback: () {},
              isLoading: false,
              label: "Continue",
            )
          ],
        ),
      ),
    );
  }
}

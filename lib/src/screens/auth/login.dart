import 'package:cashcollect/src/config/palette.dart';
import 'package:cashcollect/src/config/text_styles.dart';
import 'package:cashcollect/src/extensions/context.dart';
import 'package:cashcollect/src/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconly/iconly.dart';

class Login extends ConsumerWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phoneController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: context.screenHeight * .85,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.elliptical(context.screenWidth, 50),
                  bottomRight: Radius.elliptical(context.screenWidth, 50),
                ),
                gradient: const LinearGradient(
                  colors: [
                    Palette.primary,
                    Palette.tertiary,
                  ],
                ),
              ),
              child: const Icon(
                IconlyBroken.message,
                size: 82,
                color: Palette.light,
              ),
            ),
            Positioned(
              top: context.screenHeight * .60,
              left: context.screenHeight * .10,
              child: Center(
                child: Container(
                  height: context.screenHeight * .50,
                  width: context.screenHeight * .80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Palette.light),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0) +
                        const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 24.0,
                        ),
                        Text("Phone Verification",
                            style: TextStyles.designText(
                                bold: true, size: 22, color: Palette.primary)),
                        Input(
                          controller: phoneController,
                          label: "Your phone number",
                          icon: IconlyBroken.calling,
                          hint: "+237 690535759",
                          type: TextInputType.number,
                          isPassword: false,
                          validator: (data) {
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: context.screenHeight * 1.15,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  "After entering your phone number, \n you wil receive a OTP. You will be required \n to enter that validation token to confirm your \n authentication",
                  softWrap: true,
                  maxLines: 4,
                  style: TextStyles.designText(
                      bold: false, size: 14, color: Palette.primary),
                ),
              ),
            ),
            Positioned(
              top: context.screenHeight * 1.65,
              left: context.screenHeight * .5 - 40,
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  gradient: const LinearGradient(
                    colors: [
                      Palette.primary,
                      Palette.tertiary,
                    ],
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        debugPrint("BOss");
                        return Container(
                          color: Palette.primary,
                          child: Column(
                            children: const [
                              Text("Lorem ipsum"),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: const Center(
                    child: Icon(
                      IconlyBroken.arrow_right,
                      color: Palette.light,
                      size: 42,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

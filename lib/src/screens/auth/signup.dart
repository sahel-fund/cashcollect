import 'package:argon_buttons_flutter_fix/argon_buttons_flutter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cashcollect/src/config/palette.dart';
import 'package:cashcollect/src/config/text_styles.dart';
import 'package:cashcollect/src/widgets/button.dart';
import 'package:cashcollect/src/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconly/iconly.dart';
import 'package:pinput/pinput.dart';

class Signup extends ConsumerWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = TextEditingController();
    final cityController = TextEditingController();
    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Form(
            key: formKey,
            onWillPop: () async {
              return true;
            },
            child: Column(
              children: [
                const SizedBox(height: 34),
                SvgPicture.asset(
                  'assets/svg/intro.svg',
                  height: 180,
                  //width: MediaQuery.of(context).size.width * 0.5,
                ),
                const SizedBox(height: 14),
                Input(
                    icon: IconlyBroken.profile,
                    label: 'Names',
                    hint: 'Alpha Casher',
                    validator: (value) {
                      return null;
                    },
                    isPassword: false,
                    controller: nameController),
                Input(
                    icon: IconlyBroken.message,
                    label: 'Email',
                    hint: 'alphacasher@cashcollect.com',
                    validator: (value) {
                      return null;
                    },
                    isPassword: false,
                    controller: emailController),
                Input(
                    icon: IconlyBroken.calling,
                    label: 'Phone number',
                    type: TextInputType.number,
                    hint: '+237 690535759',
                    validator: (value) {
                      return null;
                    },
                    isPassword: false,
                    controller: phoneController),
                Input(
                    icon: IconlyBroken.location,
                    label: 'Town',
                    hint: 'Ngaoundere',
                    validator: (value) {
                      return null;
                    },
                    isPassword: false,
                    controller: cityController),
                const SizedBox(
                  height: 24,
                ),
                Button(
                  callback: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        TextEditingController otpController =
                            TextEditingController();
                        return Material(
                          child: Container(
                            color: Palette.primary,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text("Phone OTP validation",
                                      style: TextStyles.designText(
                                          bold: true,
                                          size: 28,
                                          color: Palette.lightGrey)),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "Enter the six digit code sent to your phone number to finalize your authentication",
                                    style: TextStyles.designText(
                                      bold: false,
                                      size: 14,
                                      color: Palette.lightGrey.withOpacity(0.5),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  Pinput(
                                    length: 6,
                                    controller: otpController,
                                    keyboardType: TextInputType.number,
                                    onClipboardFound: (data) {
                                      otpController.value =
                                          TextEditingValue(text: data);
                                    },
                                    androidSmsAutofillMethod:
                                        AndroidSmsAutofillMethod
                                            .smsRetrieverApi,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Didn't receive the code?",
                                        style: TextStyles.designText(
                                          bold: false,
                                          size: 14,
                                          color: Palette.lightGrey
                                              .withOpacity(0.5),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          "Resend Code",
                                          style: TextStyles.designText(
                                            bold: false,
                                            size: 14,
                                            color: Palette.lightGrey,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  isLoading: false,
                  label: "Continue",
                ),
                const SizedBox(
                  height: 24,
                ),
                TextButton(
                  onPressed: () {
                    context.router.pushNamed('/login');
                  },
                  child: Text(
                    "Already have an account? Login",
                    style: TextStyles.designText(
                        color: Palette.darkGrey, size: 14, bold: false),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:cashcollect/src/config/palette.dart';
import 'package:cashcollect/src/config/text_styles.dart';
import 'package:cashcollect/src/models/user_model.dart';
import 'package:cashcollect/src/riverpods/auth_riverpods.dart';
import 'package:cashcollect/src/widgets/button.dart';
import 'package:cashcollect/src/widgets/input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconly/iconly.dart';
import 'package:pinput/pinput.dart';

final townRiverpod = StateProvider<String>((ref) => 'Yaounde');
final genderRiverpod = StateProvider<String>((ref) => '');
final professionRiverpod = StateProvider<String>((ref) => '');
final verificationIdRiverpod = StateProvider<String>((ref) => '');
final emailController = TextEditingController();
final nameController = TextEditingController();
final phoneController = TextEditingController();

class Signup extends ConsumerWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final verificationID = ref.watch(verificationIdRiverpod.state);
    final town = ref.watch(townRiverpod.state);
    final profession = ref.watch(professionRiverpod.state);
    final gender = ref.watch(genderRiverpod.state);
    // ignore: prefer_function_declarations_over_variables
    final PhoneCodeSent smsCodeSent = (String verId, int? forceCodeResend) {
      ref.read(verificationIdRiverpod.state).state = verId;
      showDialog(
        context: context,
        builder: (context) {
          TextEditingController otpController = TextEditingController();
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
                            bold: true, size: 28, color: Palette.lightGrey)),
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
                      androidSmsAutofillMethod:
                          AndroidSmsAutofillMethod.smsRetrieverApi,
                      onCompleted: (pin) {
                        final UserModel user = UserModel(
                          uid: '',
                          email: emailController.text,
                          names: nameController.text,
                          phoneNumber: phoneController.text,
                          town: town.state,
                          profession: profession.state,
                          gender: gender.state,
                        );
                        ref
                            .read(AuthRiverpods.authenticationProvider)
                            .signInWithPhoneNumber(
                              context,
                              data: user,
                              verificationID: verificationID.state,
                              smsCode: pin,
                            );
                      },
                    ),
                    Row(
                      children: [
                        Text(
                          "Didn't receive the code?",
                          style: TextStyles.designText(
                            bold: false,
                            size: 14,
                            color: Palette.lightGrey.withOpacity(0.5),
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
    };

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Form(
            key: formKey,
            onChanged: () {
              formKey.currentState!.validate();
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onWillPop: () async {
              return true;
            },
            child: AutofillGroup(
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
                        return !(value!.length > 4)
                            ? "enter a valid name"
                            : null;
                      },
                      isPassword: false,
                      controller: nameController),
                  Input(
                      icon: IconlyBroken.message,
                      label: 'Email',
                      hint: 'alphacasher@cashcollect.com',
                      validator: (value) {
                        return !(value!.contains('@') && value.length > 10)
                            ? "enter a valid email"
                            : null;
                      },
                      isPassword: false,
                      controller: emailController),
                  Input(
                      icon: IconlyBroken.calling,
                      label: 'Phone number',
                      type: TextInputType.number,
                      hint: '+237 690535759',
                      validator: (value) {
                        return !(value!.startsWith('6') ||
                                value.startsWith('237') ||
                                value.startsWith('+237') && value.length > 9)
                            ? "enter a valid phone number"
                            : null;
                      },
                      isPassword: false,
                      controller: phoneController),
                  Container(
                    height: 58.0,
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    decoration: BoxDecoration(
                      color: Palette.grey.withOpacity(.5),
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                    child: DropdownButtonFormField(
                      items: buildItems(),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: const Icon(IconlyBroken.location,
                            color: Palette.primary),
                        hintText: 'Yaounde',
                        hintStyle: TextStyles.designText(
                            bold: false, color: Palette.darkGrey, size: 12),
                      ),
                      value: ref.watch(townRiverpod.state).state.isEmpty
                          ? null
                          : ref.watch(townRiverpod.state).state,
                      onChanged: (value) {
                        ref.read(townRiverpod.state).state = value.toString();
                      },
                      elevation: 0,
                      icon: const Icon(IconlyBroken.arrow_down_2,
                          color: Palette.primary),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 58.0,
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    decoration: BoxDecoration(
                      color: Palette.grey.withOpacity(.5),
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                    child: DropdownButtonFormField(
                      items: ["Man", "Woman"]
                          .map(
                            (String gender) => DropdownMenuItem(
                              value: gender,
                              child: Text(gender,
                                  style: TextStyles.designText(
                                      color: Palette.darkGrey,
                                      size: 14,
                                      bold: false)),
                            ),
                          )
                          .toList(),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: const Icon(IconlyBroken.user_2,
                            color: Palette.primary),
                        hintText: 'Gender',
                        hintStyle: TextStyles.designText(
                            bold: false, color: Palette.darkGrey, size: 12),
                      ),
                      value: ref.watch(genderRiverpod.state).state.isEmpty
                          ? null
                          : ref.watch(genderRiverpod.state).state,
                      onChanged: (value) {
                        ref.read(genderRiverpod.state).state = value.toString();
                      },
                      elevation: 0,
                      icon: const Icon(IconlyBroken.arrow_down_2,
                          color: Palette.primary),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 58.0,
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    decoration: BoxDecoration(
                      color: Palette.grey.withOpacity(.5),
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                    child: DropdownButtonFormField(
                      items: [
                        "Student",
                        "Professional",
                        "College Student",
                        "Taximan",
                        "Other"
                      ]
                          .map(
                            (String profession) => DropdownMenuItem(
                              value: profession,
                              child: Text(
                                profession,
                                style: TextStyles.designText(
                                    color: Palette.darkGrey,
                                    size: 14,
                                    bold: false),
                              ),
                            ),
                          )
                          .toList(),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: const Icon(IconlyBroken.work,
                            color: Palette.primary),
                        hintText: 'Profession',
                        hintStyle: TextStyles.designText(
                            bold: false, color: Palette.darkGrey, size: 12),
                      ),
                      value: ref.watch(professionRiverpod.state).state.isEmpty
                          ? null
                          : ref.watch(professionRiverpod.state).state,
                      onChanged: (value) {
                        ref.read(professionRiverpod.state).state =
                            value.toString();
                      },
                      elevation: 0,
                      icon: const Icon(IconlyBroken.arrow_down_2,
                          color: Palette.primary),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Button(
                    callback: () {
                      if (formKey.currentState!.validate()) {
                        //formKey.currentState!.save();
                        ref
                            .read(AuthRiverpods.authenticationProvider)
                            .verifyPhoneNumber(context,
                                phoneNumber:
                                    "+237${phoneController.value.text}",
                                codeSent: smsCodeSent
                                //pin: pin,
                                );
                      }
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
      ),
    );
  }
}

List<DropdownMenuItem<String>> buildItems() {
  // Towns in Cameroon
  List<String> towns = [
    "Yaounde",
    "Douala",
    "Bafoussam",
    "Garoua",
    "Bamenda",
    "Maroua",
    "Bertoua",
    "Kribi",
    "Ebolowa",
    "Buea",
    "Kumba",
    "Kumbo",
    "Mbouda",
    "Mbalmayo",
    "Mokolo",
    "Mora",
    "Nkongsamba",
    "Sangmelima",
    "Tiko",
    "Wum",
    "Yagoua",
    "Edea",
    "Kaele",
    "Kousseri",
    "Nanga Eboko",
    "Nkoteng",
    "Bafia",
    "Banyo",
    "Bogo",
    "Bafang",
    "Bafoussam",
    "Bafia",
    "Bali",
    "Bangangte",
    "Bangem",
    "Bangou",
    "Bangoura",
    "Limbe",
    "Mamfe",
    "Mundemba",
    "Nkoteng",
  ];
  return towns
      .toSet()
      .map(
        (String city) => DropdownMenuItem(
          value: city,
          child: Text(city,
              style: TextStyles.designText(
                  color: Palette.darkGrey, size: 14, bold: false)),
        ),
      )
      .toList();
}

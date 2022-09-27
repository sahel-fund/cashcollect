import 'package:cashcollect/i18n/translations.gen.dart';
import 'package:cashcollect/src/config/palette.dart';
import 'package:cashcollect/src/config/text_styles.dart';
import 'package:cashcollect/src/riverpods/auth_riverpods.dart';
import 'package:cashcollect/src/widgets/mark.dart';
import 'package:cashcollect/src/widgets/modals/aboutus.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iconly/iconly.dart';

class Settings extends ConsumerWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 34),
            Text(
              'Settings',
              style: TextStyles.designText(
                  color: Palette.secondary, size: 22, bold: true),
            ),
            const SizedBox(height: 20),
            ListTile(
              style: ListTileStyle.drawer,
              dense: false,
              trailing: ValueListenableBuilder(
                valueListenable: Hive.box('settings').listenable(),
                builder: (BuildContext context, Box box, Widget? widget) {
                  return DropdownButton<String>(
                    underline: const SizedBox.shrink(),
                    elevation: 0,
                    items: ["English", "Francais"]
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: TextStyles.designText(
                                    size: 14.0,
                                    bold: false,
                                    color: Palette.primary),
                              ),
                            ))
                        .toList(),
                    onChanged: (value) {
                      switch (value) {
                        case "Francais":
                          LocaleSettings.setLocale(AppLocale.fr);
                          box.put('language', value);

                          break;
                        case "English":
                          LocaleSettings.setLocale(AppLocale.en);
                          box.put('language', value);

                          break;
                        default:
                          LocaleSettings.setLocale(AppLocale.en);
                      }
                    },
                    value: box.get('language') ?? "English",
                  );
                },
              ),
              leading: const Icon(
                EvaIcons.globe,
                color: Palette.primary,
                size: 22,
              ),
              subtitle: Text("Change language",
                  style: TextStyles.designText(
                      bold: false, color: Palette.secondary, size: 11)),
              title: Text("Language",
                  style: TextStyles.designText(
                      bold: false, color: Palette.primary, size: 16)),
            ),
            ListTile(
              style: ListTileStyle.drawer,
              dense: false,
              trailing: ValueListenableBuilder(
                valueListenable: Hive.box('settings').listenable(),
                builder: (BuildContext context, Box box, Widget? widget) {
                  return CupertinoSwitch(
                    activeColor: Palette.primary,
                    value: box.get('notifications') ?? true,
                    onChanged: (value) {
                      box.put('notifications', value);
                    },
                  );
                },
              ),
              leading: const Icon(
                IconlyBroken.notification,
                color: Palette.primary,
                size: 22,
              ),
              subtitle: Text("Receive notifications",
                  style: TextStyles.designText(
                      bold: false, color: Palette.secondary, size: 11)),
              title: Text("Notifications",
                  style: TextStyles.designText(
                      bold: false, color: Palette.primary, size: 16)),
            ),
            ListTile(
              leading: const Icon(
                Icons.light_mode,
                color: Palette.primary,
                size: 22,
              ),
              trailing: ValueListenableBuilder(
                valueListenable: Hive.box('settings').listenable(),
                builder: (BuildContext context, Box box, Widget? widget) {
                  return CupertinoSwitch(
                    activeColor: Palette.primary,
                    value: box.get('theme'),
                    onChanged: (value) {
                      box.put('theme', value);
                    },
                  );
                },
              ),
              subtitle: Text("Change theme",
                  style: TextStyles.designText(
                      bold: false, color: Palette.secondary, size: 11)),
              title: Text("Dark Mode",
                  style: TextStyles.designText(
                      bold: false, color: Palette.primary, size: 16)),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Palette.primary, width: .85),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: const CircleAvatar(
                          radius: 16,
                          backgroundColor: Palette.primary,
                          child: Icon(
                            IconlyBroken.star,
                            color: Colors.white,
                            size: 22,
                          ),
                        ),
                        trailing: const Icon(
                          IconlyBroken.arrow_right_2,
                          color: Palette.primary,
                          size: 22,
                        ),
                        title: Text("Rate us",
                            style: TextStyles.designText(
                                bold: false, color: Palette.primary, size: 16)),
                      ),
                      ListTile(
                        leading: const CircleAvatar(
                          radius: 16,
                          backgroundColor: Palette.secondary,
                          child: Icon(
                            IconlyBroken.user_2,
                            color: Colors.white,
                            size: 22,
                          ),
                        ),
                        trailing: const Icon(
                          IconlyBroken.arrow_right_2,
                          color: Palette.primary,
                          size: 22,
                        ),
                        title: Text("User terms & Conditions",
                            style: TextStyles.designText(
                                bold: false, color: Palette.primary, size: 16)),
                      ),
                      ListTile(
                        leading: const CircleAvatar(
                          radius: 16,
                          backgroundColor: Palette.tertiary,
                          child: Icon(
                            IconlyBroken.lock,
                            color: Palette.lightGrey,
                            size: 22,
                          ),
                        ),
                        trailing: const Icon(
                          IconlyBroken.arrow_right_2,
                          color: Palette.primary,
                          size: 22,
                        ),
                        title: Text("Confidentiality",
                            style: TextStyles.designText(
                                bold: false, color: Palette.primary, size: 16)),
                      ),
                      ListTile(
                        onTap: () => ModalSheet.show(
                            Column(
                              children: [
                                Text("ABOUT US",
                                    style: TextStyles.designText(
                                        bold: true,
                                        color: Palette.primary,
                                        size: 16)),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  """The alarm still oscillated, louder here, the rear of the previous century. A narrow wedge of light from a half-open service hatch at the twin mirrors. Still it was a long strange way home over the black water and the chassis of a gutted game console. Why bother with the movement of the train, their high heels like polished hooves against the gray metal of the spherical chamber. 
                                  
                                  Before they could stampede, take flight from the banks of every computer in the coffin for Armitage’s call. Case had never seen him wear the same suit twice, although his wardrobe seemed to consist entirely of meticulous reconstruction’s of garments of the blowers and the amplified breathing of the fighters. 
                                  
                                  The Sprawl was a long strange way home over the black water and the dripping chassis of a skyscraper canyon. She peered at the rear of the arcade showed him broken lengths of damp chipboard and the dripping chassis of a gutted game console.""",
                                  style: TextStyles.designText(
                                      bold: false,
                                      color: Palette.primary,
                                      size: 14),
                                ),
                              ],
                            ),
                            context),
                        leading: const CircleAvatar(
                          radius: 16,
                          backgroundColor: Palette.primary,
                          child: Icon(
                            IconlyBroken.info_circle,
                            color: Colors.white,
                            size: 22,
                          ),
                        ),
                        trailing: const Icon(
                          IconlyBroken.arrow_right_2,
                          color: Palette.primary,
                          size: 22,
                        ),
                        title: Text("About us",
                            style: TextStyles.designText(
                                bold: false, color: Palette.primary, size: 16)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            ListTile(
              onTap: () async {
                final auth = ref.read(AuthRiverpods.firebaseAuthProvider);
                await auth.signOut();
                auth.currentUser?.reload();
              },
              leading: const CircleAvatar(
                radius: 16,
                backgroundColor: Palette.danger,
                child: Icon(
                  IconlyBroken.logout,
                  color: Palette.lightGrey,
                  size: 22,
                ),
              ),
              title: Text(
                "Logout",
                style: TextStyles.designText(
                    bold: false, color: Palette.primary, size: 16),
              ),
            ),
            const TradeMark()
          ],
        ),
      ),
    );
  }
}

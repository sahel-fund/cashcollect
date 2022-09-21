import 'package:cashcollect/i18n/translations.gen.dart';
import 'package:cashcollect/src/config/palette.dart';
import 'package:cashcollect/src/config/text_styles.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Settings extends ConsumerWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
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
                size: 32,
              ),
              subtitle: Text("Change language",
                  style: TextStyles.designText(
                      bold: false, color: Palette.secondary, size: 11)),
              title: Text("Language",
                  style: TextStyles.designText(
                      bold: false, color: Palette.primary, size: 16)),
            ),
            ListTile(
              leading: const Icon(
                Icons.light_mode,
                color: Palette.primary,
                size: 32,
              ),
              trailing: ValueListenableBuilder(
                valueListenable: Hive.box('settings').listenable(),
                builder: (BuildContext context, Box box, Widget? widget) {
                  return CupertinoSwitch(
                    activeColor: Palette.primary,
                    value: box.get('theme') ?? false,
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
          ],
        ),
      ),
    );
  }
}

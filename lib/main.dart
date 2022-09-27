import 'package:cashcollect/firebase_options.dart';
import 'package:cashcollect/src/config/palette.dart';
import 'package:cashcollect/src/router/router.gr.dart';
import 'package:cashcollect/src/utils/adapters/user_adapter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemChrome, DeviceOrientation;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_listener/hive_listener.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp(
    name: 'cashcollect',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox('settings');
  await Hive.openBox('userBox');
  Hive.box('settings').isEmpty
      ? {
          Hive.box('settings').put('language', 'English'),
          Hive.box('settings').put('theme', false),
          Hive.box('notifications').put('theme', true),
        }
      : null;
  runApp(
    ProviderScope(
      child: CashCollect(),
    ),
  );
}

class CashCollect extends ConsumerWidget {
  CashCollect({Key? key}) : super(key: key);
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return HiveListener(
      box: Hive.box('settings'),
      builder: (box) => MaterialApp.router(
        restorationScopeId: 'cashcollect',
        title: 'CashCollect',
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: _appRouter.delegate(),
        color: Palette.primary,
        themeMode: box.get('theme') ? ThemeMode.dark : ThemeMode.light,
        darkTheme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Palette.backgroundDark,
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme.apply(
                  bodyColor: Colors.white,
                  displayColor: Colors.white,
                ),
          ),
        ),
        theme: ThemeData(
          useMaterial3: true,
          primaryColor: Palette.primary,
          buttonTheme: const ButtonThemeData(
            buttonColor: Palette.tertiary,
          ),
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: MaterialColor(
              Palette.primary.value,
              const <int, Color>{
                50: Palette.primary,
                100: Palette.primary,
                200: Palette.primary,
                300: Palette.primary,
                400: Palette.primary,
                500: Palette.primary,
                600: Palette.primary,
                700: Palette.primary,
                800: Palette.primary,
                900: Palette.primary,
              },
            ),
          ).copyWith(
            secondary: Palette.secondary,
          ),
          scaffoldBackgroundColor: Palette.lightGrey,
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
      ),
    );
  }
}

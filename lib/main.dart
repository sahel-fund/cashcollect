import 'package:cashcollect/src/config/palette.dart';
import 'package:cashcollect/src/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: CashCollect(),
    ),
  );
}

class CashCollect extends ConsumerWidget {
  const CashCollect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      restorationScopeId: 'cashcollect',
      title: 'CashCollect',
      routerConfig: router,
      color: Palette.primary,
      theme: ThemeData(
        primaryColor: Palette.primary,
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
    );
  }
}

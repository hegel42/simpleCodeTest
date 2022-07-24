import 'package:simplecode_test1/widgets/init_widget.dart';
import 'package:simplecode_test1/screens/splash_screen.dart';

import 'constants/app_colors.dart';
import 'generated/l10n.dart';

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      // statusBarColor: AppColors.splashBackground,
      // statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      systemStatusBarContrastEnforced: true,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InitWidget(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorSchemeSeed: AppColors.primary,
        ),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: const SplashScreen(),
      ),
    );
  }
}

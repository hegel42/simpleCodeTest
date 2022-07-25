import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:simplecode_test1/constants/app_assets.dart';
import 'package:simplecode_test1/screens/login_screen/login_screen.dart';
import 'package:simplecode_test1/repo/repo_settings.dart';

import '../constants/app_colors.dart';
import '../generated/l10n.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.grey[50],
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    super.dispose();
  }

  @override
  void initState() {
    final repoSettings = Provider.of<RepoSettings>(
      context,
      listen: false,
    );
    repoSettings.init().whenComplete(
      () async {
        var defaultLocale = const Locale('ru', 'RU');
        final locale = await repoSettings.readLocale();
        if (locale == 'en') {
          defaultLocale = const Locale('en');
        }

        S.load(defaultLocale).whenComplete(
          () {
            // new code
            Future.delayed(
              const Duration(seconds: 2),
            ).whenComplete(
              () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
            );
          },
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: AppColors.kShrinePink300,
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                Expanded(
                  child: Image.asset(
                    AppAssets.images.logoImage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

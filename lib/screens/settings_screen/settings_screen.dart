import 'package:flutter/material.dart';

import 'package:simplecode_test1/screens/settings_screen/widgets/change_language.dart';
import 'package:simplecode_test1/screens/settings_screen/widgets/logout_butt.dart';
import 'package:simplecode_test1/screens/settings_screen/widgets/theme_change.dart';
import 'package:simplecode_test1/widgets/bottom_nav_bar.dart';

import '../../generated/l10n.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(
        selectedIndex: 1,
      ),
      appBar: AppBar(
        title: Text(S.of(context).AppTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            ChangeLanguage(),
            ThemeChange(),
            LogoutButton(),
          ],
        ),
      ),
    );
  }
}

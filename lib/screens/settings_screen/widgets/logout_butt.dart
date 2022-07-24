import 'package:flutter/material.dart';
import 'package:simplecode_test1/constants/app_fonts.dart';

import '../../../generated/l10n.dart';
import '../../login_screen/login_screen.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: ((context) => const LoginScreen()),
              ),
            );
          },
          child: Row(
            children: [
              const Icon(Icons.logout),
              Text(
                S.of(context).logout,
                style: AppTextStyle.s16w400.copyWith(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

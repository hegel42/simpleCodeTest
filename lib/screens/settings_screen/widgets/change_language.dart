import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../constants/app_fonts.dart';
import '../../../generated/l10n.dart';
import '../../../repo/repo_settings.dart';
import 'package:provider/provider.dart';

class ChangeLanguage extends StatefulWidget {
  const ChangeLanguage({Key? key}) : super(key: key);

  @override
  State<ChangeLanguage> createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${S.of(context).language}: ',
          style: AppTextStyle.s16w400,
        ),
        DropdownButton2<String>(
          isDense: true,
          buttonWidth: 130,
          alignment: AlignmentDirectional.center,
          value: Intl.getCurrentLocale(),
          items: [
            DropdownMenuItem(
              value: 'en',
              child: Text(
                S.of(context).english,
                style: AppTextStyle.s16w400,
              ),
            ),
            DropdownMenuItem(
              value: 'ru_RU',
              child: Text(
                S.of(context).russian,
              ),
            ),
          ],
          onChanged: (value) async {
            if (value == null) return;
            if (value == 'ru_RU') {
              await S.load(
                const Locale('ru', 'RU'),
              );
              setState(() {});
            } else if (value == 'en') {
              await S.load(
                const Locale('en'),
              );
              setState(() {});
            }
            if (!mounted) return;

            final repoSettings =
                Provider.of<RepoSettings>(context, listen: false);
            repoSettings.saveLocale(value);
          },
        ),
      ],
    );
  }
}

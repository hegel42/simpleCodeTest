import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'package:simplecode_test1/constants/app_fonts.dart';

import '../../../generated/l10n.dart';

class ThemeChange extends StatefulWidget {
  const ThemeChange({Key? key}) : super(key: key);

  @override
  State<ThemeChange> createState() => _ThemeChangeState();
}

class _ThemeChangeState extends State<ThemeChange> {
  final List<String> items = [
    S.current.light,
    S.current.dark,
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          S.of(context).appTheme,
          style: AppTextStyle.s16w400,
        ),
        const SizedBox(
          width: 5,
        ),
        DropdownButton2(
          alignment: Alignment.center,
          dropdownWidth: 110,
          items: items
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item, style: AppTextStyle.s16w400),
                  ))
              .toList(),
          value: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value as String;
            });
          },
        ),
      ],
    );
  }
}

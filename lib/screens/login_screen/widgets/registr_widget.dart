import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_fonts.dart';
import '../../../generated/l10n.dart';

class RegistrWidget extends StatelessWidget {
  const RegistrWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(S.of(context).haveAccount,
            style: AppTextStyle.s14w400.copyWith(
              color: AppColors.designGrey,
            )),
        TextButton(
          onPressed: () {},
          child: Text(
            S.of(context).createAccount,
            style: AppTextStyle.s14w400.copyWith(color: AppColors.primary),
          ),
        ),
      ],
    );
  }
}

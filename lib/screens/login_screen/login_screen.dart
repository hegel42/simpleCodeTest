import 'package:flutter/material.dart';

import 'package:simplecode_test1/constants/app_assets.dart';
import 'package:simplecode_test1/constants/app_colors.dart';
import 'package:simplecode_test1/constants/app_fonts.dart';

import '../../generated/l10n.dart';

import '../products_screen/products_screen.dart';
import 'widgets/login_field.dart';
import 'widgets/password_field.dart';
import 'widgets/registr_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final login = 'qwerty';
  final password = '123456ab';

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          S.of(context).tryAgain,
          style: AppTextStyle.s24w500,
        ),
        content: Text(
          S.of(context).wrongPasswordOrLogin,
          style: AppTextStyle.s14w400.copyWith(
            color: AppColors.mainText,
          ),
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Text(S.of(context).close),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kShrinePink100,
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Image.asset(AppAssets.images.logoImage),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 28,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).inputLoginAndPassword,
                    style: AppTextStyle.s16w400.copyWith(
                      color: AppColors.loginScreenColor,
                    ),
                  ),
                  LoginTextFormField(
                    usernameController: _usernameController,
                    login: login,
                  ),
                  PasswordTextFormField(
                    passwordController: _passwordController,
                    password: password,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          FocusScope.of(context).unfocus();
                          _formKey.currentState?.save();
                          if (_usernameController.text == login &&
                              _passwordController.text == password) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProductsScreen(),
                              ),
                            );
                          } else {
                            _showErrorDialog();
                          }
                        }
                      },
                      child: Text(
                        S.of(context).signIn,
                        style: AppTextStyle.s16w400,
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProductsScreen(),
                          ),
                        );
                      },
                      child: Text(
                        S.of(context).asGuest,
                        style: AppTextStyle.s16w400,
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                  const RegistrWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:teammate/core/constants/widget/ProgressIndicator/circular_progress_indicator.dart';

import '../../../../../core/constants/shared/shared_prefs_constant.dart';
import '../../../../../core/extensions/locale_extensions.dart';
import '../../../../../core/lang/locale_key.g.dart';
import '../../../../../core/widgets/AlertDialog/alert_dialog_widget.dart';
import '../../../../../core/widgets/LocaleText/locale_text.dart';
import '../../../SignUpView/view/sign_up_view.dart';
import '../../viewmodel/register_user_viewmodel.dart';

class RegisterUserButton extends StatefulWidget {
  RegisterUserButton({
    Key? key,
    required this.viewModel,
  }) : super(key: key);
  final RegisterUserViewModel viewModel;

  @override
  _RegisterUserButtonState createState() => _RegisterUserButtonState();
}

class _RegisterUserButtonState extends State<RegisterUserButton> {
  final prefs = SharedPreferencesConstant.instance;
  bool isRegistered = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        buildShowDialog(context, LocaleKeys.sign_up_please_wait.locale, '',
            [CircularProgressIndicatorWidget()]);
        await onPressed(context);
      },
      child: buildButtonText(context),
    );
  }

  Container buildButtonText(BuildContext context) {
    return Container(
      margin: context.paddingLow,
      child: LocaleText(
        text: LocaleKeys.sign_up_sign_up.locale,
        style: context.textTheme.headline6!
            .copyWith(color: context.colorScheme.background),
      ),
    );
  }

  void buildShowDialog(BuildContext context, String title, String warningText,
      List<Widget>? actions) {
    showDialog(
      context: context,
      useSafeArea: true,
      builder: (context) => AlertDialogAtomic(
          title: Text(title), actions: actions, children: [Text(warningText)]),
    );
  }

  Future<void> saveUserInfo(dynamic value) async {
    setState(() {
      prefs.setStringValue('id', value['id'].toString());
      prefs.setStringValue('username', value['username']);
      prefs.setStringValue('email', value['email']);
    });
  }

  Future<void> onPressed(BuildContext context) async {
    if (widget.viewModel.passwordController.text ==
        widget.viewModel.password2Controller.text) {
      if (widget.viewModel.formKey.currentState!.validate()) {
        await widget.viewModel.onPressedRegisterUser().then(
              (value) => value == false
                  ? buildShowDialog(
                      context,
                      LocaleKeys.sign_up_exists_user.locale,
                      LocaleKeys.sign_up_exists_user_login.locale,
                      [
                        TextButton(
                          onPressed: () {
                            context.navigation.pop();
                            context.navigation.pop();
                          },
                          child: Text(LocaleKeys.login_button_ok.locale),
                        )
                      ],
                    )
                  : saveUserInfo(value).whenComplete(
                      () => context.navigation.push(
                        MaterialPageRoute(
                          builder: (context) => SignUpView(
                            userId: value['id'] ??
                                int.parse(prefs.getStringValue('id')!),
                          ),
                        ),
                      ),
                    ),
            );
      }
    } else {
      return buildShowDialog(context, LocaleKeys.sign_up_password2.locale,
          LocaleKeys.sign_up_valid_password.locale, null);
    }
  }
}

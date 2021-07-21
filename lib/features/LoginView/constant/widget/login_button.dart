import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../../core/constants/shared/shared_prefs_constant.dart';
import '../../../../core/constants/widget/ProgressIndicator/circular_progress_indicator.dart';
import '../../../../core/extensions/locale_extensions.dart';
import '../../../../core/lang/locale_key.g.dart';
import '../../../../core/widgets/AlertDialog/alert_dialog_widget.dart';
import '../../../../core/widgets/LocaleText/locale_text.dart';
import '../../../HomeView/view/home_view.dart';
import '../../viewmodel/login_viewmodel.dart';

class LoginButton extends StatefulWidget {
  LoginButton({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  final LoginViewModel viewModel;

  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  final prefs = SharedPreferencesConstant.instance;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        buildShowLoaderDialog(context, LocaleKeys.sign_up_please_wait.locale,
            '', [CircularProgressIndicatorWidget()]);
        if (widget.viewModel.formKey.currentState!.validate()) {
          await widget.viewModel.onPressedLogin().then(
                (value) => value == false
                    ? buildShowDialog(value, context)
                    : saveLoginInfo(value).whenComplete(
                        () => context.navigation.pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => HomeView(),
                          ),
                          (route) => false,
                        ),
                      ),
              );

          print(prefs.getStringValue('token'));
        }
      },
      child: LocaleText(
        text: LocaleKeys.login_button_login,
        style: context.textTheme.headline6!
            .copyWith(color: context.colorScheme.background),
      ),
    );
  }

  Future<void> saveLoginInfo(dynamic value) async {
    setState(() {
      prefs.setStringValue('id', value['id'].toString());
      prefs.setStringValue('email', value['email']);
      prefs.setStringValue('token', value['token']);
      prefs.setStringValue('account_type', value['account_type']);
    });
    print(prefs.getStringValue('email'));
    print(prefs.getStringValue('token'));
    print(prefs.getStringValue('account_type'));
  }

  void buildShowDialog(dynamic value, BuildContext context) {
    showDialog(
      context: context,
      useSafeArea: true,
      builder: (context) {
        return AlertDialogAtomic(
          title: Text(LocaleKeys.login_button_wrong_email_pass.locale),
          actions: [
            ElevatedButton(
              onPressed: () {
                context.navigation.pop();
                context.navigation.pop();
              },
              child: Text(
                LocaleKeys.login_button_ok.locale,
                style: context.textTheme.bodyText1!
                    .copyWith(color: context.colorScheme.background),
              ),
            ),
          ],
          children: [Text(LocaleKeys.login_button_try_again.locale)],
        );
      },
    );
  }

  void buildShowLoaderDialog(BuildContext context, String title,
      String warningText, List<Widget>? actions) {
    showDialog(
      context: context,
      useSafeArea: true,
      builder: (context) => AlertDialogAtomic(
          title: Text(title), actions: actions, children: [Text(warningText)]),
    );
  }
}

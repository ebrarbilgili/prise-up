import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:teammate/core/constants/widget/ProgressIndicator/circular_progress_indicator.dart';

import '../../../../../core/constants/shared/shared_prefs_constant.dart';
import '../../../../../core/extensions/locale_extensions.dart';
import '../../../../../core/lang/locale_key.g.dart';
import '../../../../../core/widgets/AlertDialog/alert_dialog_widget.dart';
import '../../../../../core/widgets/LocaleText/locale_text.dart';
import '../../../../LoginView/view/login_view.dart';
import '../../viewmodel/sign_up_viewmodel.dart';

class SignUpButtonWidget extends StatefulWidget {
  SignUpButtonWidget({
    Key? key,
    required this.viewModel,
    required this.userId,
  }) : super(key: key);
  final SignUpViewModel viewModel;
  final int userId;

  @override
  _SignUpButtonWidgetState createState() => _SignUpButtonWidgetState();
}

class _SignUpButtonWidgetState extends State<SignUpButtonWidget> {
  final prefs = SharedPreferencesConstant.instance;

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

  Future<void> onPressed(BuildContext context) async {
    if (widget.viewModel.formKey.currentState!.validate()) {
      await widget.viewModel.onPressedSignUp(widget.userId).then(
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
                : saveUserInfo(value),
          );
    }
  }

  Future<void> saveUserInfo(dynamic value) async {
    setState(() {
      prefs.setStringValue('first_name', value['first_name']);
      prefs.setStringValue('last_name', value['last_name']);
      prefs.setStringValue('university', value['university']);
      prefs.setStringValue('faculty', value['faculty']);
    });

    await context.navigation.push(
      MaterialPageRoute(
        builder: (context) => LoginView(),
      ),
    );
  }

  void buildShowDialog(BuildContext context, String title, String warningText,
      List<Widget>? actions) {
    showDialog(
      context: context,
      useSafeArea: true,
      builder: (context) => AlertDialogAtomic(
          title: Text(title), actions: null, children: [Text(warningText)]),
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
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/constants/app.dart';
import '../../../../../../core/constants/provider/cache_provider.dart';
import '../../../../../../core/constants/widget/ProgressIndicator/circular_progress_indicator.dart';
import '../../../../../../core/extensions/locale_extensions.dart';
import '../../../../../../core/lang/locale_key.g.dart';
import '../../../../../../core/widgets/AlertDialog/alert_dialog_widget.dart';
import '../../../../../../core/widgets/LocaleText/locale_text.dart';
import '../../../../../UserProfileView/view/user_profile_view.dart';
import '../service/details_service.dart';
import '../viewmodel/details_viewmodel.dart';

class DetailsView extends StatelessWidget {
  DetailsView({
    Key? key,
    required this.model,
  }) : super(key: key);

  final dynamic model;

  final viewModel = DetailsViewModel(
    service: PostApplyService(
      service: Dio(BaseOptions(baseUrl: AppConstants.BASE_URL)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(context),
    );
  }

  Padding buildBody(BuildContext context) {
    return Padding(
      padding: context.horizontalPaddingLow,
      child: ListView(
        children: [
          buildTitle(context),
          buildSubtitle(context),
          buildDivider,
          buildDescription,
          buildDivider,
          buildCard(context)
        ],
      ),
    );
  }

  AutoSizeText get buildDescription => AutoSizeText('${model.desc!}');

  AutoSizeText buildSubtitle(BuildContext context) {
    return AutoSizeText(
      '${model.subtitle}',
      style: context.textTheme.headline6,
    );
  }

  Card buildCard(BuildContext context) {
    return Card(
      shape: buildRoundedRectangleBorder(context),
      elevation: 2,
      child: Padding(
        padding: context.paddingLow,
        child: ListTile(
          title: AutoSizeText(
              '${model.userProfile!.first_name} ${model.userProfile!.last_name}'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildDivider,
              // AutoSizeText('@${model.userProfile!.user!.username}'),
              AutoSizeText('${model.userProfile!.email}'),
              AutoSizeText(
                  '${model.userProfile!.university} - ${model.userProfile!.city}'),
            ],
          ),
          trailing: TextButton(
            onPressed: () {
              context.navigation.push(MaterialPageRoute(
                builder: (context) => UserProfileView(model: model.userProfile),
              ));
            },
            child: LocaleText(text: LocaleKeys.home_home_detail),
          ),
        ),
      ),
    );
  }

  RoundedRectangleBorder buildRoundedRectangleBorder(BuildContext context) {
    return RoundedRectangleBorder(
      borderRadius: context.lowBorderRadius * 1.4,
      side: BorderSide(
        color: context.colorScheme.secondary,
        width: 1.6,
      ),
    );
  }

  AutoSizeText buildTitle(BuildContext context) {
    return AutoSizeText(
      '${model.title}',
      style: context.textTheme.headline4!.copyWith(
          fontWeight: FontWeight.bold, color: context.colorScheme.onPrimary),
    );
  }

  Divider get buildDivider => Divider();

  AppBar buildAppBar(BuildContext context) {
    final accountType =
        context.read<CacheProvider>().getStringCache('account_type');
    return AppBar(
      title: AutoSizeText(
        '${model.title} ${LocaleKeys.home_home_detail_page_project_detail.locale}',
        style: context.textTheme.headline6!
            .copyWith(color: context.colorScheme.onPrimary),
      ),
      centerTitle: false,
      actions: [
        accountType == '1'
            ? SizedBox()
            : TextButton(
                onPressed: () {
                  buildShowDialog(
                    context,
                    LocaleKeys.home_home_detail_page_apply.locale,
                    LocaleKeys.home_home_detail_page_sure_to_apply.locale,
                    [
                      buildCancelButton(context),
                      buildApplyButton(context),
                    ],
                  );
                },
                child: LocaleText(text: LocaleKeys.home_home_detail_page_apply),
              )
      ],
    );
  }

  TextButton buildCancelButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.navigation.pop();
      },
      child: Text(
        LocaleKeys.home_home_detail_page_cancel.locale,
      ),
    );
  }

  Widget buildApplyButton(BuildContext context) {
    final userID = context.read<CacheProvider>().getStringCache('id');

    return TextButton(
      onPressed: () async {
        buildShowDialog(
          context,
          LocaleKeys.home_home_detail_page_applying.locale,
          '',
          [CircularProgressIndicatorWidget()],
        );
        if (userID != null) {
          await viewModel
              .onPressedApply(model.id!, int.parse(userID))
              .whenComplete(() async {
            context.navigation.pop();
            buildShowDialog(
              context,
              LocaleKeys.home_home_detail_page_applied.locale,
              '',
              [
                Lottie.asset(AppConstants.LOTTIE_CONFRIM,
                    height: context.dynamicHeight(0.1))
              ],
            );
            await Future.delayed(Duration(milliseconds: 1470));
            context.navigation.pop();
            context.navigation.pop();
          });
        }
      },
      child: Text(LocaleKeys.home_home_detail_page_apply.locale),
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
}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../../../../core/constants/app.dart';
import '../../../../../../core/constants/widget/TextField/text_field_decoration.dart';
import '../../../../../../core/extensions/locale_extensions.dart';
import '../../../../../../core/lang/locale_key.g.dart';
import '../../../../../../core/widgets/LocaleText/locale_text.dart';
import '../constants/widget/create_project_button.dart';
import '../service/create_project_service.dart';
import '../viewmodel/create_project_viewmodel.dart';

class CreateProjectView extends StatelessWidget {
  CreateProjectView({Key? key}) : super(key: key);

  final viewModel = CreateProjectViewModel(
    service: CreateProjectForInvestorService(
      service: Dio(BaseOptions(baseUrl: AppConstants.BASE_URL)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Form(
        key: viewModel.formKey,
        child: ListView(
          children: [
            buildTextFieldWidget(
              viewModel.titleController,
              LocaleKeys.find_investor_create_project_title,
            ),
            buildTextFieldWidget(
              viewModel.subtitleController,
              LocaleKeys.find_investor_create_project_subtitle,
            ),
            buildTextFieldWidget(
              viewModel.descController,
              LocaleKeys.find_investor_create_project_desc,
            ),
            buildTextFieldWidget(
              viewModel.universityController,
              LocaleKeys.find_investor_create_project_university,
            ),
            buildTextFieldWidget(
              viewModel.cityController,
              LocaleKeys.find_investor_create_project_city,
            ),
            CreateProjectButton(viewModel: viewModel)
          ],
        ),
      ),
    );
  }

  TextFieldWidget buildTextFieldWidget(
      TextEditingController controller, String hintText) {
    return TextFieldWidget(controller: controller, hintText: hintText.locale);
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: false,
      title: LocaleText(
        text: LocaleKeys.find_investor_create_project_create_project,
        style: context.textTheme.headline6!
            .copyWith(color: context.colorScheme.secondaryVariant),
      ),
    );
  }
}

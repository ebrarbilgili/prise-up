import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../../../core/constants/app.dart';
import '../../../../../core/constants/widget/TextField/text_field_decoration.dart';
import '../../../../../core/extensions/locale_extensions.dart';
import '../../../../../core/lang/locale_key.g.dart';
import '../../../../../core/widgets/LocaleText/locale_text.dart';
import '../constants/widget/create_button.dart';
import '../service/create_project_service.dart';
import '../viewmodel/create_project_viewmodel.dart';

class CreateProjectView extends StatelessWidget {
  CreateProjectView({Key? key}) : super(key: key);

  final viewModel = CreateProjectViewModel(
    service: CreateProjectService(
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
            buildTitleField(context),
            buildSubtitleField(context),
            buildDescField(context),
            buildUniversityField(context),
            buildCityField(context),
            CreateProjectButton(viewModel: viewModel)
          ],
        ),
      ),
    );
  }

  TextFieldWidget buildCityField(BuildContext context) {
    return TextFieldWidget(
      controller: viewModel.cityController,
      hintText: LocaleKeys.home_profile_project_city.locale,
    );
  }

  TextFieldWidget buildUniversityField(BuildContext context) {
    return TextFieldWidget(
      controller: viewModel.universityController,
      hintText: LocaleKeys.home_profile_project_university.locale,
    );
  }

  TextFieldWidget buildDescField(BuildContext context) {
    return TextFieldWidget(
      controller: viewModel.descController,
      hintText: LocaleKeys.home_profile_project_desc.locale,
      maxLines: 11,
      maxLength: 1500,
    );
  }

  TextFieldWidget buildSubtitleField(BuildContext context) {
    return TextFieldWidget(
      controller: viewModel.subtitleController,
      hintText: LocaleKeys.home_profile_project_subtitle.locale,
    );
  }

  TextFieldWidget buildTitleField(BuildContext context) {
    return TextFieldWidget(
      controller: viewModel.titleController,
      hintText: LocaleKeys.home_profile_project_title.locale,
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: LocaleText(
        text: LocaleKeys.home_profile_project_create_project,
        style: context.textTheme.headline6!
            .copyWith(color: context.colorScheme.onBackground),
      ),
      centerTitle: false,
    );
  }
}

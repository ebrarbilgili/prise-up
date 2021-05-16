import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../../../../../../core/constants/shared/shared_prefs_constant.dart';
import '../../service/my_projects_details_service.dart';
import '../../../model/my_projects_model.dart';
part 'edit_project_viewmodel.g.dart';

class EditProjectViewModel = _EditProjectViewModelBase
    with _$EditProjectViewModel;

abstract class _EditProjectViewModelBase with Store {
  MyProjectsDetailsService service;

  _EditProjectViewModelBase({required this.service});

  final formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final subtitleController = TextEditingController();
  final descController = TextEditingController();
  final universityController = TextEditingController();
  final cityController = TextEditingController();

  @action
  Future editProject(int projectID) async {
    return await service.editProject(
      MyProjectsModel(
          id: projectID,
          title: titleController.text,
          subtitle: subtitleController.text,
          desc: descController.text,
          university: universityController.text,
          city: cityController.text,
          userProfile: int.parse(
              SharedPreferencesConstant.instance.getStringValue('id')!)),
      projectID,
    );
  }
}

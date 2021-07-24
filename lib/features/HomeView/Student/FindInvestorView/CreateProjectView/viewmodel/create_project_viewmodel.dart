import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../model/create_project_model.dart';
import '../service/create_project_service.dart';

part 'create_project_viewmodel.g.dart';

class CreateProjectViewModel = _CreateProjectViewModelBase
    with _$CreateProjectViewModel;

abstract class _CreateProjectViewModelBase with Store {
  CreateProjectForInvestorService service;

  _CreateProjectViewModelBase({required this.service});

  final formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final subtitleController = TextEditingController();
  final descController = TextEditingController();
  final universityController = TextEditingController();
  final cityController = TextEditingController();

  @action
  Future createProject(int userID) async {
    await service.createProjectForInvestor(
      CreateProjectModel(
        title: titleController.text,
        subtitle: subtitleController.text,
        desc: descController.text,
        university: universityController.text,
        city: cityController.text,
      ),
      userID,
    );
  }
}

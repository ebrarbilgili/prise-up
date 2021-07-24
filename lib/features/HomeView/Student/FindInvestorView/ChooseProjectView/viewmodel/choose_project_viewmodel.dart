import 'package:mobx/mobx.dart';

import '../../../ProfilePageView/MyProjectsView/model/my_projects_model.dart';
import '../../../ProfilePageView/MyProjectsView/service/my_projects_service.dart';
import '../service/choose_project_service.dart';

part 'choose_project_viewmodel.g.dart';

class ChooseProjectViewModel = _ChooseProjectViewModelBase
    with _$ChooseProjectViewModel;

abstract class _ChooseProjectViewModelBase with Store {
  MyProjectsService myProjectsService;
  ChooseProjectService chooseProjectService;

  _ChooseProjectViewModelBase(
      {required this.myProjectsService, required this.chooseProjectService}) {
    onPressedFetchMyPoject();
  }

  @observable
  List<MyProjectsModel> myProjectsModel = [];
  @observable
  bool isLoading = true;

  @action
  Future<void> isLoaded() async {
    isLoading = !isLoading;
  }

  @action
  Future<void> onPressedFetchMyPoject() async {
    await isLoaded();
    myProjectsModel = await myProjectsService.fetchMyProjects();
    await isLoaded();
  }

  @action
  Future chooseProject(MyProjectsModel model, int userID) async {
    await chooseProjectService.chooseProject(
      MyProjectsModel(
        title: model.title,
        subtitle: model.subtitle,
        desc: model.desc,
        university: model.university,
        city: model.city,
      ),
      userID,
    );
  }

  @action
  Future isChoosedProject(MyProjectsModel model, int userID) async {
    await chooseProjectService.isChoosedProject(
      MyProjectsModel(
        id: model.id,
        title: model.title,
        subtitle: model.subtitle,
        desc: model.desc,
        university: model.university,
        city: model.city,
      ),
      userID,
      true,
    );
  }
}

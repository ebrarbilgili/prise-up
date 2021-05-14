import 'package:mobx/mobx.dart';
import 'package:teammate/features/HomeView/HomePageView/DetailsView/model/details_model.dart';
import 'package:teammate/features/HomeView/HomePageView/DetailsView/service/details_service.dart';

part 'details_viewmodel.g.dart';

class DetailsViewModel = _DetailsViewModelBase with _$DetailsViewModel;

abstract class _DetailsViewModelBase with Store {
  PostApplyService service;

  _DetailsViewModelBase({required this.service});

  @action
  Future onPressedApply(int projectID, int userProfileID) async {
    await service.postApply(
      PostApplyModel(project: projectID, userProfile: userProfileID),
    );
  }
}

import 'package:base_flutter_provider_project/config/locator.dart';
import 'package:base_flutter_provider_project/constants/strings.dart';
import 'package:base_flutter_provider_project/data/models/home_model/home_response_model.dart';
import 'package:base_flutter_provider_project/data/repositories/home_repo.dart';
import 'package:base_flutter_provider_project/utils/common_functions.dart';
import 'package:base_flutter_provider_project/utils/generic_exception.dart';
import 'package:base_flutter_provider_project/utils/logger.dart';
import 'package:base_flutter_provider_project/viewModel/base_view_model/base_view_model.dart';

class HomeViewModel extends BaseViewModel {
  //Repository
  final HomeRepository _homeRepository = locator<HomeRepository>();

  //Model
  HomeResponseModel? _homeResponseModel;

  HomeResponseModel? get homeResponseModel => _homeResponseModel;

  Future<HomeResponseModel?> fetchHome({required Function(String) onFailureRes}) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _homeRepository.fetchHome();
      if (data != null) {
        _homeResponseModel = data;
      //  print('_homeResponseModel::: ${_homeResponseModel?.data?[0].firstName ?? Strings.homePage}');
        //Success State
        setState(ViewState.success);
      }else{
        //Failed
        onFailureRes(Strings.somethingWentWrong);
        //Failure State
        setState(ViewState.idle);
      }
    } on AppException catch (appException) {
      Logger.appLogs('errorType:: ${appException.type}');
      Logger.appLogs('onFailure:: $appException');
      //Common Error Handler
      errorMsg = errorHandler(appException);
      //Failed
      onFailureRes(errorMsg);
      //Idle / Failure State
      setState(ViewState.idle);
    }
    return null;
  }
}



import 'package:base_flutter_provider_project/data/models/home_model/test_model.dart';
import 'package:base_flutter_provider_project/viewModel/base_view_model/base_view_model.dart';

import '../config/locator.dart';
import '../constants/strings.dart';
import '../data/repositories/test_repo.dart';
import '../utils/common_functions.dart';
import '../utils/generic_exception.dart';
import '../utils/logger.dart';

class TestViewModel extends BaseViewModel{



  final TestRepository _testRepository = locator<TestRepository>();

   TestResponseModel?   _testreponsemodel;


  TestResponseModel? get  testResponsemodel => _testreponsemodel;

  Future<TestResponseModel?> fetchTestUser({required Function(String) onFailureRes}) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _testRepository.fetchUser();
      if (data != null) {
        _testreponsemodel = data;
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
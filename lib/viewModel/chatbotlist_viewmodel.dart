

import 'package:base_flutter_provider_project/data/models/home_model/chatbot_model.dart';
import 'package:base_flutter_provider_project/data/repositories/chatbotlist_repo.dart';
import 'package:base_flutter_provider_project/viewModel/base_view_model/base_view_model.dart';

import '../config/locator.dart';
import '../constants/strings.dart';
import '../utils/common_functions.dart';
import '../utils/generic_exception.dart';
import '../utils/logger.dart';

class ChatBotlistViewModel extends BaseViewModel{

  final ChatBotlistRepository _chatBotlistRepository = locator<ChatBotlistRepository>();

  ChatBotListResponseModel? _chatBotListResponseModel;

  ChatBotListResponseModel? get chatBotResponsemodel => _chatBotListResponseModel;


  Future<ChatBotListResponseModel?> fetchChatbotList({required Function(String) onFailureRes}) async {
    //Loader State
    setState(ViewState.busy);

    try {
      var data = await _chatBotlistRepository.fetchchatbotlist();
      if (data != null) {
        _chatBotListResponseModel = data;
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
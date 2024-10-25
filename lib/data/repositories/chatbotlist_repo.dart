

import 'package:base_flutter_provider_project/data/models/home_model/chatbot_model.dart';

import '../../constants/end_points_constants.dart';
import '../../services/dio_client.dart';
import '../../utils/logger.dart';

class ChatBotlistRepository{
  final ApiClient _client = ApiClient();

  Future<ChatBotListResponseModel?> fetchchatbotlist() async {
    final response = await _client.get(EndPointConstants.chatbotlist);

    Logger.appLogs('callBackResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');
      return ChatBotListResponseModel.fromJson(response as Map<String, dynamic>);
    } else {
      //Failed returning null
      Logger.appLogs('errorNull:: $response');
      return null;
    }
  }

}

class HomeScreenException implements Exception {
  HomeScreenException(this.message);

  final String message;
}

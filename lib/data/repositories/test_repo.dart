
import '../../constants/end_points_constants.dart';
import '../../services/dio_client.dart';
import '../../utils/logger.dart';
import '../models/home_model/test_model.dart';

class TestRepository{
  final ApiClient _client = ApiClient();

  Future<TestResponseModel?> fetchUser() async {
    final response = await _client.get(EndPointConstants.testurl);

    Logger.appLogs('callBackResponse:: $response');
    if (response != null) {
      //Success returning data back
      Logger.appLogs('responseRepo:: $response');
      return TestResponseModel.fromJson(response as Map<String, dynamic>);
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

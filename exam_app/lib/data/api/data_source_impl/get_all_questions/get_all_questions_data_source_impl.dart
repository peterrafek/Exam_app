import 'package:injectable/injectable.dart';

import '../../data/data_source/get_all_question_data_source.dart';
import '../client/api_client.dart';
import '../client/api_result.dart';
import '../model/response/get_all_question_response.dart';
@Injectable(as:GetAllQuestionDataSource )
class GetAllQuestionDataSourceImpl extends GetAllQuestionDataSource{

  final ApiClient _apiClient;
  GetAllQuestionDataSourceImpl(this._apiClient);

  @override
  Future<Result<GetAllQuestionResponse>> getAllQuestion(String id) {
    return executeApi(()=>_apiClient.getAllQuestion(id));
  }

}

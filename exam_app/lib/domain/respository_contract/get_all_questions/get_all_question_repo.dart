import '../../api/client/api_result.dart';
import '../../api/model/response/get_all_question_response.dart';

abstract class GetAllQuestionRepo{

  Future<Result<GetAllQuestionResponse>> getAllQuestion(String id);
}
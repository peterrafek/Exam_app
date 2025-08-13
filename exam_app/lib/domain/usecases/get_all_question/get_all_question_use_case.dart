import 'package:injectable/injectable.dart';

import '../../api/client/api_result.dart';
import '../../api/model/response/get_all_question_response.dart';
import '../repos/get_all_question_repo.dart';
@injectable
class GetAllQuestionUseCase {
  final GetAllQuestionRepo _getAllQuestionRepo;
  GetAllQuestionUseCase(this._getAllQuestionRepo);
  Future<Result<GetAllQuestionResponse>> call(String id){
    return _getAllQuestionRepo.getAllQuestion(id);
  }

}
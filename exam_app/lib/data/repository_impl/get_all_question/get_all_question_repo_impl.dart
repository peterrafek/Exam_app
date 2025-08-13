import 'package:injectable/injectable.dart';

import '../../api/client/api_result.dart';
import '../../api/model/response/get_all_question_response.dart';
import '../../domain/repos/get_all_question_repo.dart';
import '../data_source/get_all_question_data_source.dart';
@Injectable(as: GetAllQuestionRepo)
class GetAllQuestionRepoImpl extends GetAllQuestionRepo{
  final GetAllQuestionDataSource _getAllQuestionDataSource;
  GetAllQuestionRepoImpl(this._getAllQuestionDataSource);
  @override
  Future<Result<GetAllQuestionResponse>> getAllQuestion(String id) {
    return _getAllQuestionDataSource.getAllQuestion(id);
  }
}
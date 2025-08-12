import 'package:exam_app/core/result.dart';
import 'package:exam_app/domain/entities/exams/response/exams_response.dart';
import 'package:injectable/injectable.dart';

import '../../respository_contract/exams/get_exams_repository.dart';

@injectable
class GetExamsUsecase {
  GetExamsRepository getExamsRepository;

  @factoryMethod
  GetExamsUsecase(this.getExamsRepository);

  Future<Result<ExamsResponseEntity>> execute(String id) {
    return getExamsRepository.getExams(id);
  }
}

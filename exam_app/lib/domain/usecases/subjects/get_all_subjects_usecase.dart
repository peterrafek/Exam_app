import 'package:exam_app/core/result.dart';
import 'package:exam_app/domain/entities/subjects/subjects_response.dart';
import 'package:injectable/injectable.dart';

import '../../respository_contract/subjects/get_all_subjects_repository.dart';

@injectable
class GetAllSubjectsUsecase {
  GetAllSubjectsRepository getAllSubjectsRepository;

  @factoryMethod
  GetAllSubjectsUsecase(this.getAllSubjectsRepository);

  Future<Result<SubjectResponseEntity>> execute() {
    return getAllSubjectsRepository.getAllSubjects();
  }
}

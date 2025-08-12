import 'package:exam_app/domain/entities/subjects/subjects_response.dart';

import '../../../core/result.dart';

abstract interface class GetAllSubjectsRepository {
  Future<Result<SubjectResponseEntity>> getAllSubjects();
}

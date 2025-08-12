import 'package:exam_app/domain/entities/subjects/subjects_response.dart';

import '../../../../core/result.dart';

abstract interface class GetAllSubjectsDataSource {
  Future<Result<SubjectResponseEntity>> getAllSubjects();
}

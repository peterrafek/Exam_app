import 'package:exam_app/domain/entities/exams/response/exams_response.dart';

import '../../../core/result.dart';

abstract interface class GetExamsRepository {
  Future<Result<ExamsResponseEntity>> getExams(String id);
}

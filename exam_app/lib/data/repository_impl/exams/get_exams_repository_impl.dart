import 'package:exam_app/core/result.dart';
import 'package:exam_app/domain/entities/exams/response/exams_response.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/respository_contract/exams/get_exams_repository.dart';
import '../../api/data_source_contract/exams/get_exams_data_source.dart';

@Injectable(as: GetExamsRepository)
class GetExamsRepositoryImpl implements GetExamsRepository {
  GetExamsDataSource getExamsDataSource;

  GetExamsRepositoryImpl(this.getExamsDataSource);

  @override
  Future<Result<ExamsResponseEntity>> getExams(String id) {
    return getExamsDataSource.getExams(id);
  }
}

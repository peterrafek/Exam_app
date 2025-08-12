import 'package:exam_app/core/result.dart';
import 'package:exam_app/domain/entities/subjects/subjects_response.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/respository_contract/subjects/get_all_subjects_repository.dart';
import '../../api/data_source_contract/subjects/get_all_subjects_data_source.dart';

@Injectable(as: GetAllSubjectsRepository)
class GetAllSubjectsRepositoryImpl implements GetAllSubjectsRepository {
  @override
  GetAllSubjectsDataSource getAllSubjectsDataSource;

  GetAllSubjectsRepositoryImpl(this.getAllSubjectsDataSource);

  Future<Result<SubjectResponseEntity>> getAllSubjects() {
    return getAllSubjectsDataSource.getAllSubjects();
  }
}

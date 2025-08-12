import 'package:exam_app/core/api_executer.dart';
import 'package:exam_app/core/result.dart';
import 'package:exam_app/data/api/api_client.dart';
import 'package:exam_app/data/api/dto/subjects/response/subject_response_dto.dart';
import 'package:exam_app/domain/entities/subjects/subjects_response.dart';
import 'package:injectable/injectable.dart';

import '../../data_source_contract/subjects/get_all_subjects_data_source.dart';

@Injectable(as: GetAllSubjectsDataSource)
class GetAllSubjectsDataSourceImpl implements GetAllSubjectsDataSource {
  ApiClient apiClient;

  GetAllSubjectsDataSourceImpl(this.apiClient);

  @override
  Future<Result<SubjectResponseEntity>> getAllSubjects() async {
    var res = await ApiExecutor.executeApi(
      () => apiClient.getAllSubjects(),
    );
    switch (res) {
      case Success<SubjectResponseDto>():
        return Success(
          data: SubjectResponseDto.toEntity(res.data),
        );
      case Error<SubjectResponseDto>():
        return Error(exception: res.exception);
    }
  }
}

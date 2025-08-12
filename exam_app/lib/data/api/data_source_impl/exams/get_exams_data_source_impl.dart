import 'package:exam_app/core/api_executer.dart';
import 'package:exam_app/core/result.dart';
import 'package:exam_app/data/api/api_client.dart';
import 'package:exam_app/data/api/dto/exams/response/exams_response_dto.dart';
import 'package:exam_app/domain/entities/exams/response/exams_response.dart';
import 'package:injectable/injectable.dart';

import '../../data_source_contract/exams/get_exams_data_source.dart';

@Injectable(as: GetExamsDataSource)
class GetExamsDataSourceImpl implements GetExamsDataSource {
  ApiClient apiClient;

  GetExamsDataSourceImpl(this.apiClient);

  @override
  Future<Result<ExamsResponseEntity>> getExams(String id) async {
    var res = await ApiExecutor.executeApi(
      () => apiClient.getExam(id),
    );
    switch (res) {
      case Success<ExamsResponseDto>():
        return Success(data: ExamsResponseDto.toEntity(res.data));
      case Error<ExamsResponseDto>():
        return Error(exception: res.exception);
    }
  }
}

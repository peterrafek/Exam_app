import 'dart:convert';

import 'package:exam_app/data/api/dto/login/responses/login_response_dto.dart';
import 'package:injectable/injectable.dart';


import '../../../../core/shared_layers/storage/constants/storage_constants.dart';
import '../../../../core/shared_layers/storage/contract/flutter_secure_storage_service.dart';
import '../../data_source_contract/login/log_in_local_data_source.dart';
import '../../dio_servies.dart';

@Injectable(as: StoreLogInLocalDataSource)
class StoreLoginLocalDataSourceImpl implements StoreLogInLocalDataSource {
  final SecureStorageService _secureStorageService;

  StoreLoginLocalDataSourceImpl(this._secureStorageService);

  @override
  Future<void> saveLoginData(LoginResponseDto response) async {
    final jsonString = jsonEncode(response.toJson());
    _secureStorageService.setStringValue(
      StorageConstants.loginModelKey,
      jsonString,
    );
  }

  @override
  Future<LoginResponseDto?> getLoginData() async {
    final jsonString = await _secureStorageService.getStringValue(
      StorageConstants.loginModelKey,
    );

    if (jsonString != null) {
      final jsonMap = jsonDecode(jsonString);
      final loginModel = LoginResponseDto.fromJson(jsonMap);
      DioServiceExtension.updateDioWithToken(loginModel.token ?? "");
      return loginModel;
    }

    return null;
  }

  @override
  Future<void> deleteLoginData() async {
    await _secureStorageService.deleteValue(StorageConstants.loginModelKey);
  }
}

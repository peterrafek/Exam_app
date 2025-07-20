import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';


import '../../../result.dart';
import '../constants/storage_constants.dart';
import '../contract/flutter_secure_storage_service.dart';
import '../handler/storage_execution_handler.dart';


@Singleton(as: SecureStorageService)
class SecureStorageServiceImp implements SecureStorageService {
  final FlutterSecureStorage storageInstance;

  SecureStorageServiceImp(this.storageInstance);

  @override
  void setStringValue(String key, String value) async {
    var storageResult = await StorageExecutionHandler.execute<void>(
      () => storageInstance.write(key: key, value: value),
    );
    if (storageResult is Error) {
      debugPrint(
        StorageConstants.errorStoringMessage(storageResult.toString()),
      );
    }
  }

  @override
  Future<String?> getStringValue(String key) async {
    var storageResult = await StorageExecutionHandler.execute(
      () => storageInstance.read(key: key),
    );
    switch (storageResult) {
      case Success<String?>():
        return storageResult.data;
      case Error<String?>():
        debugPrint(
          StorageConstants.errorReadingMessage(storageResult.toString()),
        );
    }
    return null;
  }

  @override
  Future<void> deleteValue(String key) async {
    var storageResult = await StorageExecutionHandler.execute(
      () => storageInstance.delete(key: key),
    );
    if (storageResult is Error) {
      debugPrint(
        StorageConstants.errorDeletingMessage(storageResult.toString()),
      );
    }
  }
}

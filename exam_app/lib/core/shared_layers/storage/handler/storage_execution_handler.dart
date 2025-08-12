import '../../../result.dart';

abstract class StorageExecutionHandler {
  static Future<Result<T>> execute<T>(
    Future<T> Function() storageFunction,
  ) async {
    try {
      var result = await storageFunction();
      return Success(data: result);
    } catch (e) {
      return Error(exception: e as Exception, errorMessage: e.toString());
    }
  }
}

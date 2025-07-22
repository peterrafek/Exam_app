sealed class ApiResult<T>{}

class OnSuccess<T> extends ApiResult<T>{

  final T? data;
    OnSuccess({this.data,});
}
 class OnFailure<T>  extends ApiResult<T>{

  final Exception? exception;
  OnFailure({this.exception,} );
 }
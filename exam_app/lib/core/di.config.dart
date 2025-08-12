// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../data/api/api_client.dart' as _i217;
import '../data/api/data_source_contract/forget_password/forget_password_data_source.dart'
    as _i81;
import '../data/api/data_source_contract/login/log_in_data_source.dart'
    as _i1034;
import '../data/api/data_source_contract/login/log_in_local_data_source.dart'
    as _i322;
import '../data/api/data_source_contract/sign_up/sign_up_data_source.dart'
    as _i647;
import '../data/api/data_source_impl/forget_password/forget_password_data_source_impl.dart'
    as _i934;
import '../data/api/data_source_impl/login/log_in_data_source_impl.dart'
    as _i897;
import '../data/api/data_source_impl/login/login_local_data_source_impl.dart'
    as _i765;
import '../data/api/data_source_impl/sign_up/sign_up_data_source_impl.dart'
    as _i786;
import '../data/api/dio_servies.dart' as _i968;
import '../data/repository_impl/forget_password/forget_password_repository_impl.dart'
    as _i357;
import '../data/repository_impl/login/log_in_repository_impl.dart' as _i413;
import '../data/repository_impl/login/login_local_repository_impl.dart'
    as _i405;
import '../data/repository_impl/sign_up/sign_up_repo_impl.dart' as _i479;
import '../domain/respository_contract/forget_password/forget_password_repository.dart'
    as _i467;
import '../domain/respository_contract/login/log_in_repository.dart' as _i424;
import '../domain/respository_contract/login/login_local_repository.dart'
    as _i255;
import '../domain/respository_contract/sign_up/sign_up_repo.dart' as _i798;
import '../domain/usecases/forget_password/forget_password_usecase.dart'
    as _i519;
import '../domain/usecases/login/log_in_usecase.dart' as _i61;
import '../domain/usecases/login/login_local_use_case.dart' as _i518;
import '../domain/usecases/sign_up/sign_up_use_case.dart' as _i469;
import '../presentation/viewmodel/cubits/sign_up/sign_up_view_model.dart' as _i667;
import '../presentation/viewmodel/cubits/forget_password/forget_password_cubit.dart' as _i954;
import '../presentation/viewmodel/cubits/login/log_in_cubit.dart' as _i841;
import 'shared_layers/storage/contract/flutter_secure_storage_service.dart'
    as _i383;
import 'shared_layers/storage/implementation/flutter_secure_storage_services_impl.dart'
    as _i651;
import 'shared_layers/storage/initializer/storage_initializer.dart' as _i316;
import 'user_provider.dart' as _i113;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final storagesInitializer = _$StoragesInitializer();
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i558.FlutterSecureStorage>(
      () => storagesInitializer.initFlutterSecureStorage(),
      preResolve: true,
    );
    await gh.factoryAsync<_i361.Dio>(
      () => registerModule.provideDio(),
      preResolve: true,
    );
    gh.singleton<_i113.UserProvider>(() => _i113.UserProvider());
    gh.factory<_i217.ApiClient>(() => _i217.ApiClient(gh<_i361.Dio>()));
    gh.factory<_i383.SecureStorageService<dynamic>>(
        () => _i651.SecureStorageServiceImp(gh<_i558.FlutterSecureStorage>()));
    gh.factory<_i1034.LogInRemoteDataSource>(
        () => _i897.LogInDataSourceImpl(gh<_i217.ApiClient>()));
    gh.factory<_i647.SignUpDataSource>(
        () => _i786.SignUpDataSourceImpl(gh<_i217.ApiClient>()));
    gh.factory<_i424.LogInRepository>(
        () => _i413.LogInRepositoryImpl(gh<_i1034.LogInRemoteDataSource>()));
    gh.factory<_i61.GetLogInUsecase>(
        () => _i61.GetLogInUsecase(gh<_i424.LogInRepository>()));
    gh.factory<_i81.ForgetPasswordDataSource>(
        () => _i934.ForgetPasswordDataSourceImpl(gh<_i217.ApiClient>()));
    gh.factory<_i322.StoreLogInLocalDataSource>(() =>
        _i765.StoreLoginLocalDataSourceImpl(
            gh<_i383.SecureStorageService<dynamic>>()));
    gh.factory<_i798.SignUpRepo>(
        () => _i479.SignUpRepoImpl(gh<_i647.SignUpDataSource>()));
    gh.factory<_i841.LogInCubit>(
        () => _i841.LogInCubit(gh<_i61.GetLogInUsecase>()));
    gh.factory<_i255.StoreLogInLocalRepository>(() =>
        _i405.StoreLoginLocalRepositoryImpl(
            gh<_i322.StoreLogInLocalDataSource>()));
    gh.factory<_i467.ForgetPasswordRepository>(() =>
        _i357.ForgetPasswordRepositoryImpl(
            gh<_i81.ForgetPasswordDataSource>()));
    gh.factory<_i469.SignUpUseCase>(
        () => _i469.SignUpUseCase(gh<_i798.SignUpRepo>()));
    gh.factory<_i518.StoreLoginLocalUseCase>(() =>
        _i518.StoreLoginLocalUseCase(gh<_i255.StoreLogInLocalRepository>()));
    gh.factory<_i519.GetForgetPasswordUsecase>(() =>
        _i519.GetForgetPasswordUsecase(gh<_i467.ForgetPasswordRepository>()));
    gh.factory<_i667.SignUpViewModel>(
        () => _i667.SignUpViewModel(gh<_i469.SignUpUseCase>()));
    gh.factory<_i954.ForgetPasswordCubit>(
        () => _i954.ForgetPasswordCubit(gh<_i519.GetForgetPasswordUsecase>()));
    return this;
  }
}

class _$StoragesInitializer extends _i316.StoragesInitializer {}

class _$RegisterModule extends _i968.RegisterModule {}

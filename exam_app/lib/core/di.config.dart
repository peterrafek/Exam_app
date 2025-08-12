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
import '../data/api/data_source_contract/reset_password/reset_password_data_source.dart'
    as _i597;
import '../data/api/data_source_contract/sign_up/sign_up_data_source.dart'
    as _i647;
import '../data/api/data_source_contract/verification/verification_data_source.dart'
    as _i552;
import '../data/api/data_source_impl/forget_password/forget_password_data_source_impl.dart'
    as _i934;
import '../data/api/data_source_impl/login/log_in_data_source_impl.dart'
    as _i897;
import '../data/api/data_source_impl/login/login_local_data_source_impl.dart'
    as _i765;
import '../data/api/data_source_impl/reset_password/reset_password_data_source_impl.dart'
    as _i84;
import '../data/api/data_source_impl/sign_up/sign_up_data_source_impl.dart'
    as _i786;
import '../data/api/data_source_impl/verification/verification_data_source_impl.dart'
    as _i329;
import '../data/api/dio_servies.dart' as _i968;
import '../data/repository_impl/forget_password/forget_password_repository_impl.dart'
    as _i357;
import '../data/repository_impl/login/log_in_repository_impl.dart' as _i413;
import '../data/repository_impl/login/login_local_repository_impl.dart'
    as _i405;
import '../data/repository_impl/reset_password/reset_password_repository_impl.dart'
    as _i159;
import '../data/repository_impl/sign_up/sign_up_repo_impl.dart' as _i479;
import '../data/repository_impl/verification/verification_repository_impl.dart'
    as _i783;
import '../domain/respository_contract/forget_password/forget_password_repository.dart'
    as _i467;
import '../domain/respository_contract/login/log_in_repository.dart' as _i424;
import '../domain/respository_contract/login/login_local_repository.dart'
    as _i255;
import '../domain/respository_contract/reset_password/reset_password_repository.dart'
    as _i465;
import '../domain/respository_contract/sign_up/sign_up_repo.dart' as _i798;
import '../domain/respository_contract/verification/verification_repository.dart'
    as _i489;
import '../domain/usecases/forget_password/forget_password_usecase.dart'
    as _i519;
import '../domain/usecases/login/log_in_usecase.dart' as _i61;
import '../domain/usecases/login/login_local_use_case.dart' as _i518;
import '../domain/usecases/reset_password/reset_password_usecase.dart' as _i245;
import '../domain/usecases/sign_up/sign_up_use_case.dart' as _i469;
import '../domain/usecases/verification/verification_usecase.dart' as _i552;
import '../presentation/viewmodel/cubits/forget_password/forget_password_cubit.dart'
    as _i659;
import '../presentation/viewmodel/cubits/login/log_in_cubit.dart' as _i311;
import '../presentation/viewmodel/cubits/reset_password/reset_password_cubit.dart'
    as _i1016;
import '../presentation/viewmodel/cubits/sign_up/sign_up_view_model.dart'
    as _i638;
import '../presentation/viewmodel/cubits/verification/verification_cubit.dart'
    as _i1012;
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
    gh.factory<_i552.VerificationDataSource>(
        () => _i329.VreificationDataSourceImpl(gh<_i217.ApiClient>()));
    gh.factory<_i597.ResetPasswordDataSource>(
        () => _i84.ResetPasswordDataSourceImpl(gh<_i217.ApiClient>()));
    gh.factory<_i383.SecureStorageService<dynamic>>(
        () => _i651.SecureStorageServiceImp(gh<_i558.FlutterSecureStorage>()));
    gh.factory<_i465.ResetPasswordRepository>(() =>
        _i159.ResetPasswordRepositoryImpl(gh<_i597.ResetPasswordDataSource>()));
    gh.factory<_i1034.LogInRemoteDataSource>(
        () => _i897.LogInDataSourceImpl(gh<_i217.ApiClient>()));
    gh.factory<_i647.SignUpDataSource>(
        () => _i786.SignUpDataSourceImpl(gh<_i217.ApiClient>()));
    gh.factory<_i489.VerificationRepository>(() =>
        _i783.VreificationRepositoryImpl(gh<_i552.VerificationDataSource>()));
    gh.factory<_i424.LogInRepository>(
        () => _i413.LogInRepositoryImpl(gh<_i1034.LogInRemoteDataSource>()));
    gh.factory<_i552.GetVerificationUsecase>(
        () => _i552.GetVerificationUsecase(gh<_i489.VerificationRepository>()));
    gh.factory<_i245.GetResetPasswordUsecase>(() =>
        _i245.GetResetPasswordUsecase(gh<_i465.ResetPasswordRepository>()));
    gh.factory<_i61.GetLogInUsecase>(
        () => _i61.GetLogInUsecase(gh<_i424.LogInRepository>()));
    gh.factory<_i81.ForgetPasswordDataSource>(
        () => _i934.ForgetPasswordDataSourceImpl(gh<_i217.ApiClient>()));
    gh.factory<_i322.StoreLogInLocalDataSource>(() =>
        _i765.StoreLoginLocalDataSourceImpl(
            gh<_i383.SecureStorageService<dynamic>>()));
    gh.factory<_i798.SignUpRepo>(
        () => _i479.SignUpRepoImpl(gh<_i647.SignUpDataSource>()));
    gh.factory<_i311.LogInCubit>(
        () => _i311.LogInCubit(gh<_i61.GetLogInUsecase>()));
    gh.factory<_i255.StoreLogInLocalRepository>(() =>
        _i405.StoreLoginLocalRepositoryImpl(
            gh<_i322.StoreLogInLocalDataSource>()));
    gh.factory<_i1012.VerificationCubit>(
        () => _i1012.VerificationCubit(gh<_i552.GetVerificationUsecase>()));
    gh.factory<_i467.ForgetPasswordRepository>(() =>
        _i357.ForgetPasswordRepositoryImpl(
            gh<_i81.ForgetPasswordDataSource>()));
    gh.factory<_i469.SignUpUseCase>(
        () => _i469.SignUpUseCase(gh<_i798.SignUpRepo>()));
    gh.factory<_i1016.ResetPasswordCubit>(
        () => _i1016.ResetPasswordCubit(gh<_i245.GetResetPasswordUsecase>()));
    gh.factory<_i518.StoreLoginLocalUseCase>(() =>
        _i518.StoreLoginLocalUseCase(gh<_i255.StoreLogInLocalRepository>()));
    gh.factory<_i519.GetForgetPasswordUsecase>(() =>
        _i519.GetForgetPasswordUsecase(gh<_i467.ForgetPasswordRepository>()));
    gh.factory<_i638.SignUpViewModel>(
        () => _i638.SignUpViewModel(gh<_i469.SignUpUseCase>()));
    gh.factory<_i659.ForgetPasswordCubit>(
        () => _i659.ForgetPasswordCubit(gh<_i519.GetForgetPasswordUsecase>()));
    return this;
  }
}

class _$StoragesInitializer extends _i316.StoragesInitializer {}

class _$RegisterModule extends _i968.RegisterModule {}

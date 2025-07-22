// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

 import '../api/client/api_client.dart' as _i277;
import '../api/client/api_module.dart' as _i960;
import '../api/data_source_impl/sign_up_data_source_impl.dart' as _i539;
 import '../data/data_source/sign_up_data_source.dart' as _i105;
import '../data/repos_impl/sign_up_repo_impl.dart' as _i775;
import '../domain/repos/sign_up_repo.dart' as _i427;
import '../domain/use_case/sign_up_use_case.dart' as _i695;
import '../presentaion/features/auth/sign_up/sign_up_view_model.dart' as _i667;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i361.Dio>(
      () => registerModule.provideDio(),
      preResolve: true,
    );
    gh.factory<_i277.ApiClient>(() => _i277.ApiClient(gh<_i361.Dio>()));
    gh.factory<_i105.SignUpDataSource>(
      () => _i539.SignUpDataSourceImpl(gh<_i277.ApiClient>()),
    );
    gh.factory<_i427.SignUpRepo>(
      () => _i775.SignUpRepoImpl(gh<_i105.SignUpDataSource>()),
    );
    gh.factory<_i695.SignUpUseCase>(
      () => _i695.SignUpUseCase(gh<_i427.SignUpRepo>()),
    );
    gh.factory<_i667.SignUpViewModel>(
      () => _i667.SignUpViewModel(gh<_i695.SignUpUseCase>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i960.ApiModule {}

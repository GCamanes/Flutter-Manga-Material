// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'features/login/data/datasources/login.remote_datasource.dart' as _i3;
import 'features/login/data/datasources/login.remote_datasource.impl.dart'
    as _i4;
import 'features/login/data/repositories/login.repository.impl.dart' as _i6;
import 'features/login/domain/repositories/login.repository.dart' as _i5;
import 'features/login/domain/use_cases/get_current_user.use_case.dart' as _i9;
import 'features/login/domain/use_cases/login.use_case.dart' as _i7;
import 'features/login/domain/use_cases/logout.use_case.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.LoginRemoteDataSource>(_i4.LoginRemoteDataSourceImpl());
  gh.singleton<_i5.LoginRepository>(
      _i6.LoginRepositoryImpl(get<_i3.LoginRemoteDataSource>()));
  gh.singleton<_i7.LoginUseCase>(_i7.LoginUseCase(get<_i5.LoginRepository>()));
  gh.singleton<_i8.LogoutUseCase>(
      _i8.LogoutUseCase(get<_i5.LoginRepository>()));
  gh.singleton<_i9.GetCurrentUserUseCase>(
      _i9.GetCurrentUserUseCase(get<_i5.LoginRepository>()));
  return get;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:indrive_clone/src/data/dataSource/local/shared_pref.dart'
    as _i210;
import 'package:indrive_clone/src/data/dataSource/remote/services/auth_service.dart'
    as _i1060;
import 'package:indrive_clone/src/data/dataSource/remote/services/users_service.dart'
    as _i1039;
import 'package:indrive_clone/src/di/AppModule.dart' as _i479;
import 'package:indrive_clone/src/domain/repository/auth_repository.dart'
    as _i397;
import 'package:indrive_clone/src/domain/repository/geolocator_repository.dart'
    as _i298;
import 'package:indrive_clone/src/domain/repository/users_repository.dart'
    as _i377;
import 'package:indrive_clone/src/domain/useCases/auth/auth_use_cases.dart'
    as _i74;
import 'package:indrive_clone/src/domain/useCases/geolocator/geolocator_use_cases.dart'
    as _i237;
import 'package:indrive_clone/src/domain/useCases/users/users_use_cases.dart'
    as _i233;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i210.SharedPref>(() => appModule.sharedPref);
    gh.factoryAsync<String>(() => appModule.token);
    gh.factory<_i1060.AuthService>(() => appModule.authService);
    gh.factory<_i1039.UsersService>(() => appModule.usersService);
    gh.factory<_i397.AuthRepository>(() => appModule.authRepository);
    gh.factory<_i377.UsersRepository>(() => appModule.usersRepository);
    gh.factory<_i298.GeolocatorRepository>(
        () => appModule.geolocatorRepository);
    gh.factory<_i74.AuthUseCases>(() => appModule.authUseCases);
    gh.factory<_i233.UsersUseCases>(() => appModule.usersUseCases);
    gh.factory<_i237.GeolocatorUseCases>(() => appModule.geolocatorUseCases);
    return this;
  }
}

class _$AppModule extends _i479.AppModule {}

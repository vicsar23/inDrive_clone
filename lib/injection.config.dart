// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:indrive_clone/src/data/dataSource/remote/services/auth_service.dart'
    as _i1060;
import 'package:indrive_clone/src/di/AppModule.dart' as _i479;
import 'package:indrive_clone/src/domain/repository/auth_repository.dart'
    as _i397;
import 'package:indrive_clone/src/domain/useCases/auth/auth_use_cases.dart'
    as _i74;
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
    gh.factory<_i1060.AuthService>(() => appModule.authService);
    gh.factory<_i397.AuthRepository>(() => appModule.authRepository);
    gh.factory<_i74.AuthUseCases>(() => appModule.authUseCases);
    return this;
  }
}

class _$AppModule extends _i479.AppModule {}

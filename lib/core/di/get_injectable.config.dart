// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:contact/core/di/modules.dart' as _i7;
import 'package:contact/core/services/data/sources/remote_source.dart' as _i4;
import 'package:contact/core/services/data/sources/sources_impl/remote_source_impl.dart'
    as _i5;
import 'package:contact/features/user_profile/repo/get_user_profile.dart'
    as _i6;
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final diModules = _$DiModules();
    gh.lazySingleton<_i3.Dio>(() => diModules.dio);
    gh.lazySingleton<_i4.RemoteSource>(
        () => _i5.RemoteSourceImpl(dio: gh<_i3.Dio>()));
    gh.lazySingleton<_i6.UserProfileModelRepository>(() =>
        _i6.UserProfileModelRepositoryImpl(
            remoteSource: gh<_i4.RemoteSource>()));
    return this;
  }
}

class _$DiModules extends _i7.DiModules {}

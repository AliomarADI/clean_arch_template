// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/datasource/local/client_local_datasource.dart' as _i5;
import '../../data/datasource/remote/client_remote_datasource.dart' as _i12;
import '../../data/repository/client_repository_impl.dart' as _i14;
import '../../domain/repository/client_repository.dart' as _i13;
import '../../domain/usecase/shared_preferences/if_token_exists_usecase.dart'
    as _i8;
import '../../domain/usecase/shared_preferences/remove_token_usecase.dart'
    as _i10;
import '../../domain/usecase/shared_preferences/save_token_usecase.dart'
    as _i11;
import '../shared/cache.dart' as _i3;
import '../shared/cache_impl.dart' as _i4;
import '../shared/http.dart' as _i6;
import '../shared/http_client_impl.dart' as _i7;
import '../utils/navigation_service.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.Cache>(() => _i4.CacheImpl());
  gh.lazySingleton<_i5.ClientLocalDataSource>(
      () => _i5.ClientLocalDataSourceImpl());
  gh.factory<_i6.Http>(() => _i7.HttpImpl(cache: get<_i3.Cache>()));
  gh.lazySingleton<_i8.IfTokenExistsUseCase>(
      () => _i8.IfTokenExistsUseCase(cache: get<_i3.Cache>()));
  gh.lazySingleton<_i9.NavigationService>(() => _i9.NavigationService());
  gh.lazySingleton<_i10.RemoveTokenUseCase>(
      () => _i10.RemoveTokenUseCase(cache: get<_i3.Cache>()));
  gh.lazySingleton<_i11.SaveTokenUseCase>(
      () => _i11.SaveTokenUseCase(cache: get<_i3.Cache>()));
  gh.lazySingleton<_i12.ClientRemoteDataSource>(
      () => _i12.ClientRemoteDataSourceImpl(http: get<_i6.Http>()));
  gh.lazySingleton<_i13.ClientRepository>(() => _i14.ClientRepositoryImpl(
        clientRemoteDataSource: get<_i12.ClientRemoteDataSource>(),
        clientLocalDataSource: get<_i5.ClientLocalDataSource>(),
        cache: get<_i3.Cache>(),
      ));
  return get;
}

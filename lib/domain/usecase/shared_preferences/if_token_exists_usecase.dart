import 'package:clean_arch_template/core/shared/cache.dart';
import 'package:clean_arch_template/core/utils/cache_keys.dart';
import 'package:clean_arch_template/domain/usecase/base_usecase.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class IfTokenExistsUseCase implements UseCase<bool, NoParams> {
  final Cache cache;

  const IfTokenExistsUseCase({
    required this.cache,
  });

  @override
  Future<bool> call(NoParams params) async {
    return await cache.getString(CacheKeys.token) == null ? false : true;
  }
}

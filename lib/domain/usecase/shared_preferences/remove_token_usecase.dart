import 'package:clean_arch_template/core/shared/cache.dart';
import 'package:clean_arch_template/core/utils/cache_keys.dart';
import 'package:clean_arch_template/domain/usecase/base_usecase.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RemoveTokenUseCase implements UseCase<void, NoParams> {
  final Cache cache;

  const RemoveTokenUseCase({
    required this.cache,
  });

  @override
  Future<void> call(NoParams params) async {
    return await cache.remove(CacheKeys.token);
  }
}

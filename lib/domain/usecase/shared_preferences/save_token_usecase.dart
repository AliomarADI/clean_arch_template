import 'package:clean_arch_template/core/shared/cache.dart';
import 'package:clean_arch_template/core/utils/cache_keys.dart';
import 'package:clean_arch_template/domain/usecase/base_usecase.dart';
import 'package:injectable/injectable.dart';

class SaveTokenUseCaseParams {
  final String token;

  const SaveTokenUseCaseParams({
    required this.token,
  });
}

@lazySingleton
class SaveTokenUseCase implements UseCase<void, SaveTokenUseCaseParams> {
  final Cache cache;

  const SaveTokenUseCase({
    required this.cache,
  });

  @override
  Future<void> call(SaveTokenUseCaseParams params) async {
    return await cache.setString(CacheKeys.token, params.token);
  }
}

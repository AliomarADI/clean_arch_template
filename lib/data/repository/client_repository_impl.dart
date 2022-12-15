import 'package:clean_arch_template/core/shared/cache.dart';
import 'package:clean_arch_template/data/datasource/local/client_local_datasource.dart';
import 'package:clean_arch_template/data/datasource/remote/client_remote_datasource.dart';
import 'package:clean_arch_template/domain/repository/client_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ClientRepository)
class ClientRepositoryImpl implements ClientRepository {
  final ClientRemoteDataSource clientRemoteDataSource;
  final ClientLocalDataSource clientLocalDataSource;
  final Cache cache;

  const ClientRepositoryImpl({
    required this.clientRemoteDataSource,
    required this.clientLocalDataSource,
    required this.cache,
  });

  @override
  Future<void> auth() async => await clientRemoteDataSource.auth();
}

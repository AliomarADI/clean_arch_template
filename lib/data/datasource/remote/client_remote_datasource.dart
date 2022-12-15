import 'package:clean_arch_template/core/shared/http.dart';
import 'package:injectable/injectable.dart';

abstract class ClientRemoteDataSource {
  Future<void> auth();
}

@LazySingleton(as: ClientRemoteDataSource)
class ClientRemoteDataSourceImpl implements ClientRemoteDataSource {
  final Http http;
  const ClientRemoteDataSourceImpl({
    required this.http,
  });

  @override
  Future<void> auth() async {}
}

import 'package:injectable/injectable.dart';

abstract class ClientLocalDataSource {
  // Future<UserModel?> getUser();

}

@LazySingleton(as: ClientLocalDataSource)
class ClientLocalDataSourceImpl implements ClientLocalDataSource {
  // @override
  // Future<UserModel?> getUser() async {
  //  // get profile if was saved
  // }
}

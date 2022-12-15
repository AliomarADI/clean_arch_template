import 'package:connectivity_plus/connectivity_plus.dart';

class TTConnetivity {
  // Проверка интернет соединения
  Future<bool> isInternetHas() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    }

    return false;
  }
}

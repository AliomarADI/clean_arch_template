import 'package:http/http.dart';

abstract class Http {
  Future<dynamic> get(String url, {anotherToken, String query = ''});

  Future<dynamic> post(String url, {dynamic body, anotherToken});

  Future<Map<String, dynamic>?> put(String url, {dynamic body, anotherToken});

  Future<Map<String, dynamic>?> delete(String url,
      {dynamic body, anotherToken});

  Future<Map<String, dynamic>> postMultipartRequest(String url,
      {required List<dynamic> multipartFiles, dynamic body, anotherToken});
}

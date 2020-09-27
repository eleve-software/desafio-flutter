import 'package:dio/dio.dart';

class ClientService {
  Dio getClient() {
    BaseOptions options = BaseOptions(
      baseUrl: "https://api.github.com",
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );

    return Dio(options);
  }
}

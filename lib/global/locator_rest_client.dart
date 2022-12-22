import 'package:dio/dio.dart';

import '../core/api/rest_client.dart';
import 'locator.dart';

void registerRestClient({String? bearerAuthToken}) {
  var dio = Dio();
  dio.options = BaseOptions(
    headers: <String, dynamic>{
      'ApiKey': '',
    },
    connectTimeout: 30000,
  );

  if ([null, ''].contains(bearerAuthToken) == false) {
    dio.options.headers["Authorization"] = "Bearer $bearerAuthToken";
  }

  // if (locator.isRegistered(instanceName: "RestClient")) {
  //   locator.unregister(instanceName: "RestClient");
  // }

  locator.registerLazySingleton(
    () => RestClient(dio,
        baseUrl: 'https://633a986c471b8c3955704ee7.mockapi.io/'),
    instanceName: "RestClient",
  );
}

RestClient getRestClient() {
  return locator.get<RestClient>(instanceName: 'RestClient');
}

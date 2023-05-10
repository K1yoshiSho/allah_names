import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.I;

initGetIt() async {
  // getIt.registerLazySingleton<Dio>(
  //   () {
  //     PrettyDioLogger logger = PrettyDioLogger(
  //       requestHeader: true,
  //       requestBody: true,
  //       responseBody: false,
  //       responseHeader: true,
  //       error: true,
  //       compact: true,
  //       maxWidth: 100,
  //     );
  //     Dio dio = Dio(BaseOptions(baseUrl: '${sharedPreference.chosenServer}/api/'));
  //     dio.interceptors.add(ErrorInterceptor());
  //     dio.interceptors.add(
  //         // TalkerDioLogger(
  //         //   settings: const TalkerDioLoggerSettings(
  //         //     printRequestHeaders: true,
  //         //     printRequestData: true,
  //         //     printResponseData: false,
  //         //     printResponseHeaders: true,
  //         //     printResponseMessage: true,
  //         //   ),
  //         // ),
  //         logger);
  //     return dio;
  //   },
  // );
}

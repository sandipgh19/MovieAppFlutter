// import 'package:inject/inject.dart';

// @module
// class NetworkModule extends PreferenceModule {
//   // ignore: non_constant_identifier_names
//   final String TAG = "NetworkModule";

//   // DI Providers:--------------------------------------------------------------
//   /// A singleton dio provider.
//   ///
//   /// Calling it multiple times will return the same instance.
//   @provide
//   @singleton
//   Dio provideDio(SharedPreferenceHelper sharedPrefHelper) {
//     final dio = Dio();

//     dio
//       ..options.baseUrl = Endpoints.baseUrl
//       ..options.connectTimeout = Endpoints.connectionTimeout
//       ..options.receiveTimeout = Endpoints.receiveTimeout
//       ..options.headers = {'Content-Type': 'application/json; charset=utf-8'}
//       ..interceptors.add(LogInterceptor(
//         request: true,
//         responseBody: true,
//         requestBody: true,
//         requestHeader: true,
//       ))
//       ..interceptors.add(
//         InterceptorsWrapper(
//           onRequest: (Options options) async {
//             // getting shared pref instance
//             var prefs = await SharedPreferences.getInstance();

//             // getting token
//             var token = prefs.getString(Preferences.auth_token);

//             if (token != null) {
//               options.headers.putIfAbsent('Authorization', () => token);
//             } else {
//               print('Auth token is null');
//             }
//           },
//         ),
//       );

//     return dio;
//   }

//   /// A singleton dio_client provider.
//   ///
//   /// Calling it multiple times will return the same instance.
//   @provide
//   @singleton
//   DioClient provideDioClient(Dio dio) => DioClient(dio);

//   /// A singleton dio_client provider.
//   ///
//   /// Calling it multiple times will return the same instance.
//   @provide
//   @singleton
//   RestClient provideRestClient() => RestClient();

//   // Api Providers:-------------------------------------------------------------
//   // Define all your api providers here
//   /// A singleton post_api provider.
//   ///
//   /// Calling it multiple times will return the same instance.
//   @provide
//   @singleton
//   PostApi providePostApi(DioClient dioClient, RestClient restClient) =>
//       PostApi(dioClient, restClient);
// // Api Providers End:---------------------------------------------------------

// }
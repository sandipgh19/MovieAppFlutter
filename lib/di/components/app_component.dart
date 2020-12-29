// import 'package:inject/inject.dart';
// import 'package:movie_app_flutter/main.dart';
// import 'package:movie_app_flutter/repository/app_repository.dart';

// import '../modules/local_module.dart';
// import '../modules/netwok_module.dart';
// import '../modules/preference_module.dart';

// /// The top level injector that stitches together multiple app features into
// /// a complete app.
// @Injector(const [NetworkModule, LocalModule, PreferenceModule])
// abstract class AppComponent {
//   @provide
//   MyApp get app;

//   static Future<AppComponent> create(
//       NetworkModule networkModule,
//       LocalModule localModule,
//       PreferenceModule preferenceModule,
//       ) async {
//     return await g.AppComponent$Injector.create(
//       networkModule,
//       localModule,
//       preferenceModule,
//     );
//   }

//   /// An accessor to RestClient object that an application may use.
//   @provide
//   AppRepository getRepository();
// }
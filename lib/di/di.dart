import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.iconfig.dart';

final GetIt getIt = GetIt.instance;
bool _diInitialized = false;

@injectableInit
void configureInjection() {
  WidgetsFlutterBinding.ensureInitialized();
  if(!_diInitialized){
    $initGetIt(getIt);
    _diInitialized = true;
  }
}
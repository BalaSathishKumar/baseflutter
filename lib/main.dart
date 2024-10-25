import 'package:base_flutter_provider_project/app.dart';
import 'package:base_flutter_provider_project/config/locator.dart';
import 'package:base_flutter_provider_project/constants/constant.dart';
import 'package:base_flutter_provider_project/utils/common_functions.dart';
import 'package:base_flutter_provider_project/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //To setup the singleton initialization
  setupLocator();
  //To remove (#) from the navigation url
  setPathUrlStrategy();

  //Check for onBoarding
  Constant.isBoarding = await checkOnBoarding();
  //Check for onLogin
  Constant.isLoggedIn = await checkIsLoggedIn();
  //Check for permission
  Constant.isPermissionGranted = await validatePermission();

  Logger.appLogs('runApp ${Constant.isBoarding}:: ${Constant.isLoggedIn}');

  runApp(const MyApp());
}

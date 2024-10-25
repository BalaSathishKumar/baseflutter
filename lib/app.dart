import 'package:base_flutter_provider_project/constants/strings.dart';
import 'package:base_flutter_provider_project/constants/theme_color.dart';
import 'package:base_flutter_provider_project/routes/router_pages.gr.dart';
import 'package:base_flutter_provider_project/utils/app_bar_theme.dart';
import 'package:base_flutter_provider_project/viewModel/chatbotlist_viewmodel.dart';
import 'package:base_flutter_provider_project/viewModel/home_viewmodel.dart';
import 'package:base_flutter_provider_project/viewModel/test_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();
  late BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    ctx = context;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeViewModel>(
          create: (BuildContext ctx) => HomeViewModel(),
        ),
        ChangeNotifierProvider<TestViewModel>(
          create: (BuildContext ctx) => TestViewModel(),
        ),
        ChangeNotifierProvider<ChatBotlistViewModel>(
          create: (BuildContext ctx) => ChatBotlistViewModel(),
        ),
      ],
      child: MaterialApp.router(
        title: Strings.appName,
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: _appRouter.delegate(
          initialRoutes: [const SplashRoute()],
        ),
        theme: ThemeData(
          primaryColor: ThemeColor.Blue,
          appBarTheme: appBarThemeData(),
        ),
        // builder: (context, router){
        //   return router;
        // },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

//TODO add firebase analytics
// navigatorObservers: <NavigatorObserver>cons[
// FirebaseAnalyticsObserver(analytics: analytics),
// ],

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanimation_playground/modules/trending/blocs/trending_bloc.dart';

import 'global/locator.dart';
import 'global/router_config.dart';
import 'modules/settings/blocs/setting_bloc.dart';
import 'utils/my_custom_scroll_behavior.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyARc8y--XsvZevcf9iTq_jglQODFwg1Uc0",
      appId: "1:1053757662020:web:267127d1cffec92fcfad11",
      messagingSenderId: "1053757662020",
      projectId: "ilibrary-flutterwebapp",
    ),
  );
  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SettingBloc()..add(ThemeStarted())),
        BlocProvider(create: (_) => TrendingBloc())
,      ],
      child: BlocBuilder<SettingBloc, SettingState>(
        builder: (context, state) {
          var _themeData = ThemeData(
            primarySwatch: Colors.blue,
          );
          if (state is ThemeLoaded || state is ThemeLoadedWithAccount) {
            _themeData = state.themeData;
          }
          return MaterialApp.router(
            title: 'kAnimation',
            theme: _themeData,
            scrollBehavior: MyCustomScrollBehavior(),
            routerConfig: Routerconfiguration().router,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}

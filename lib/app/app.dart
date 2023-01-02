import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:instrive_invoice_ninja/presentation/home/home_view.dart';

import '../presentation/resources/theme_manager.dart';
import 'app_routes.dart';
import 'cubits/themes_cubit.dart';

class App extends StatelessWidget {

  const App._internal();
  static const _instance = App._internal();
  factory App() => _instance;

  @override
  Widget build(BuildContext context) {
    return getMaterialApp(widget: const HomeView(), title: 'TODO', buildContext: context);
  }

  Widget getMaterialApp({required Widget widget, required String title, required BuildContext buildContext}){
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_)=>ThemesCubit()..getTheme())
        ],
        child: BlocBuilder<ThemesCubit, String>(
                builder: (_, theme){
                  return MaterialApp(
                      title: title,
                      debugShowCheckedModeBanner: false,
                      home: widget,
                      // localizationsDelegates: buildContext.localizationDelegates,
                      // supportedLocales: buildContext.supportedLocales,
                      // locale: buildContext.locale,
                      onGenerateRoute: RouteGenerator.getRoute,
                      theme: getApplicationTheme(theme)
                  );
                }
        )
    );
  }

  void closeApp() {
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else {
      exit(0);
    }
  }

}

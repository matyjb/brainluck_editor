import 'package:brainluck_editor/logic/settings_cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:brainluck_editor/constants.dart';
import 'package:brainluck_editor/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(),
      child: ThemeModeBuilder(
        builder: (context, settings) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: appName,
          theme: ThemeData.light(useMaterial3: true),
          darkTheme: ThemeData.dark(useMaterial3: true),
          themeMode: settings.themeMode,
          onGenerateRoute: _appRouter.onGenerateRoute,
          initialRoute: RouteNames.home,
        ),
      ),
    );
  }
}

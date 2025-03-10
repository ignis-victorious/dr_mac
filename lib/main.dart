//  ________________________
//  Import LIBRARIES
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//  Import FILES
import 'pages/dr_map.dart';
import 'providers/map_providers.dart';
import 'styles/themes.dart';
//  PARTS
//  PROVIDERS
//  COMMANDS
// flutter run -d chrome
// dart run build_runner watch -d
//  ________________________

void main() {
  runApp(ProviderScope(child: const DRMainApp()));
}

class DRMainApp extends ConsumerWidget {
  const DRMainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(appThemeProvider);

    return MaterialApp(
      title: 'Interactive map of Dominican Republic',
      debugShowCheckedModeBanner: false,
      themeMode: appTheme,
      // themeMode: ThemeMode.system,
      theme: MapAppTheme.lightTheme,
      darkTheme: MapAppTheme.darkTheme,
      // ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),),
      home: const DRMapApp(),
    );
  }
}



//  ________________________
//  Import LIBRARIES
//  Import FILES
//  PARTS
//  PROVIDERS
//  ________________________



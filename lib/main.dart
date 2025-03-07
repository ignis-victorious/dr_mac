//  ________________________
//  Import LIBRARIES
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//  Import FILES
import 'pages/dr_map.dart';
//  PARTS
//  PROVIDERS
//  COMMANDS
// flutter run -d chrome
// dart run build_runner watch -d
//  ________________________

void main() {
  runApp(ProviderScope(child: const DRMainApp()));
}

class DRMainApp extends StatelessWidget {
  const DRMainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Interactive map of Dominican Republic',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
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
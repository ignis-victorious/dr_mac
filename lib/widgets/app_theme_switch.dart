//  ________________________
//  Import LIBRARIES
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//  Import FILES
import '../providers/map_providers.dart';
//  PARTS
//  PROVIDERS
//  ________________________

class AppThemeSwitch extends ConsumerWidget {
  const AppThemeSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(appThemeProvider);

    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: <Widget>[
          Icon(Icons.light_mode),
          Switch(
            value: appTheme == ThemeMode.dark,
            onChanged: (val) {
              ref
                  .read(appThemeProvider.notifier)
                  .update(val ? ThemeMode.dark : ThemeMode.light);
            },
          ),
          Icon(Icons.dark_mode),
        ],
      ),
    );
  }
}

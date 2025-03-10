//  ________________________
//  Import LIBRARIES
import 'package:dr_mac/providers/map_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/all_provinces_list.dart';
import '../widgets/app_theme_switch.dart';
import '../widgets/drmap.dart';
import '../widgets/map_assets_list.dart';
import '../widgets/map_regions_list.dart';
//  PARTS
//  PROVIDERS
//  ________________________

class DRMapApp extends ConsumerStatefulWidget {
  const DRMapApp({super.key});

  @override
  ConsumerState<DRMapApp> createState() => _DRMapAppState();
}

class _DRMapAppState extends ConsumerState<DRMapApp>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      updateAppTheme();
      super.initState();
    });
  }

  void updateAppTheme() {
    var brightness = View.of(context).platformDispatcher.platformBrightness;
    ref
        .read(appThemeProvider.notifier)
        .update(
          brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light,
        );
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    updateAppTheme();
  }
  // @override
  // void dispose() {
  //   WidgetsBinding.instance.removeObserver(this);
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surfaceContainer,
      // backgroundColor: Color(0xFFC6ecff),
      appBar: AppBar(title: const Text('~~ DRMapApp --')),
      body: Stack(
        children: <Widget>[
          Center(
            child: InteractiveViewer(clipBehavior: Clip.none, child: DRMap()),
          ),
          Align(alignment: Alignment.topLeft, child: MapAssetsList()),
          Align(alignment: Alignment.topRight, child: AllProvincesList()),
          Align(alignment: Alignment.bottomCenter, child: MapRegionsList()),
          Row(
            children: <Widget>[
              Align(alignment: Alignment.bottomLeft, child: AppThemeSwitch()),
              Align(alignment: Alignment.bottomLeft, child: AppThemeSwitch()),
            ],
          ),
        ],
      ),
    );
  }
}

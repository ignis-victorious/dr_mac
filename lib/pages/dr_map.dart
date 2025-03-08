//  ________________________
//  Import LIBRARIES
import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
//  Import FILES
import '../widgets/drmap.dart';
import '../widgets/map_assets_list.dart';
//  PARTS
//  PROVIDERS
//  ________________________

class DRMapApp extends StatelessWidget {
  const DRMapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC6ecff),
      appBar: AppBar(title: const Text('~~ DRMapApp --')),
      body: Stack(
        children: <Widget>[
          Center(
            child: InteractiveViewer(clipBehavior: Clip.none, child: DRMap()),
          ),
          Align(alignment: Alignment.topLeft, child: MapAssetsList()),
        ],
      ),
      // body: SvgPicture.asset('./assets/svgs/rd.svg'),
    );
  }
}

//  ________________________
//  Import LIBRARIES
import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
//  Import FILES
import '../widgets/drmap.dart';
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
        ],
      ),
      // body: SvgPicture.asset('./assets/svgs/rd.svg'),
    );
  }
}

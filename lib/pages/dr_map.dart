//  ________________________
//  Import LIBRARIES
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
//  Import FILES
//  PARTS
//  PROVIDERS
//  ________________________

class DRMapApp extends StatelessWidget {
  const DRMapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC6ecff),
      appBar: AppBar(title: const Text('-- DRMapApp --')),
      body: Stack(
        children: <Widget>[
          SvgPicture.asset('assets/svgs/map_assets/baserd.svg'),
        ],
      ),
      // body: SvgPicture.asset('./assets/svgs/rd.svg'),
    );
  }
}

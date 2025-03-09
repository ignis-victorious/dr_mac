//  ________________________
//  Import LIBRARIES
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//  Import FILES
import '../models/enums.dart';
import '../providers/map_providers.dart';
//  PARTS
//  PROVIDERS
//  ________________________

class DRMap extends ConsumerWidget {
  const DRMap({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMapAssets = ref.watch(selectedMapAssetsProvider);
    final allProvinces = ref.watch(provincesListProvider);
    final selectedProvinces = ref.watch(selectedProvincesProvider);
    final selectedRegion = ref.watch(selectedRegionProvider);

    return Stack(
      children: <Widget>[
        SvgPicture.asset('assets/svgs/map_assets/baserd.svg'),
        SvgPicture.asset(
          'assets/svgs/provinces/islabeata.svg',
          color: Colors.red,
        ),
        SvgPicture.asset(
          'assets/svgs/provinces/islacatalina.svg',
          color: Colors.red,
        ),
        SvgPicture.asset(
          'assets/svgs/provinces/islasaona.svg',
          color: Colors.red,
        ),

        //  Generates the list of provinces
        ...List.generate(allProvinces.length, (index) {
          final province = allProvinces[index];
          Color provinceColor = Color(0xFFFEFEE9);

          if (selectedProvinces.contains(province)) {
            provinceColor = Color.fromARGB(
              200,
              (index + 1) * 20,
              (index + 2) * 30,
              (index + 3) * 40,
            );
          } else if (selectedRegion.provinces.contains(province.regionCode)) {
            provinceColor = Colors.green;
          }

          return SvgPicture.asset(
            'assets/svgs/provinces/${province.code}.svg',
            colorFilter: ColorFilter.mode(
              provinceColor,
              // index == 20 ? Colors.red : Colors.white,
              BlendMode.srcIn,
            ),
          );
        }),

        //  Generates all the assets of the map seas, names, rivers, etc.
        ...List.generate(selectedMapAssets.length, (index) {
          final asset = selectedMapAssets[index];
          final assetName =
              asset == MapAssets.seas || asset == MapAssets.names
                  ? '${asset.name}_en'
                  : asset.name;
          return SvgPicture.asset('assets/svgs/map_assets/$assetName.svg');
        }),
      ],
    );
  }
}

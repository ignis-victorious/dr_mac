//  ________________________
//  Import LIBRARIES
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//  Import FILES
import '../models/enums.dart';
import '../models/province.dart';
import '../providers/map_providers.dart';
//  PARTS
//  PROVIDERS
//  ________________________

class DRMap extends ConsumerWidget {
  const DRMap({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<MapAssets> selectedMapAssets = ref.watch(
      selectedMapAssetsProvider,
    );
    final List<Province> allProvinces = ref.watch(provincesListProvider);
    final List<Province> selectedProvinces = ref.watch(
      selectedProvincesProvider,
    );
    final MapRegions selectedRegion = ref.watch(selectedRegionProvider);
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Stack(
      children: <Widget>[
        SvgPicture.asset('assets/svgs/map_assets/baserd.svg'),
        SvgPicture.asset(
          'assets/svgs/provinces/islabeata.svg',
          colorFilter: ColorFilter.mode(colorScheme.onSurface, BlendMode.srcIn),
        ),
        SvgPicture.asset(
          'assets/svgs/provinces/islacatalina.svg',
          colorFilter: ColorFilter.mode(colorScheme.onSurface, BlendMode.srcIn),
        ),
        SvgPicture.asset(
          'assets/svgs/provinces/islasaona.svg',
          colorFilter: ColorFilter.mode(colorScheme.onSurface, BlendMode.srcIn),
        ),

        //  Generates the list of provinces
        ...List.generate(allProvinces.length, (index) {
          final province = allProvinces[index];
          Color provinceColor = colorScheme.onSurface;
          // Color provinceColor = Color(0xFFFEFEE9);

          if (selectedProvinces.contains(province)) {
            provinceColor =
                Theme.of(context).brightness == Brightness.light
                    ? Color.fromARGB(
                      200,
                      (index + 1) * 20,
                      (index + 2) * 30,
                      (index + 3) * 40,
                    )
                    : colorScheme.tertiaryContainer;
          } else if (selectedRegion.provinces.contains(province.regionCode)) {
            provinceColor = Colors.green;
          }
          // if (selectedProvinces.contains(province)) {
          //   provinceColor = Color.fromARGB(
          //     200,
          //     (index + 1) * 20,
          //     (index + 2) * 30,
          //     (index + 3) * 40,
          //   );
          // } else if (selectedRegion.provinces.contains(province.regionCode)) {
          //   provinceColor = Colors.green;
          // }

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
          final seaOrNames =
              asset == MapAssets.seas || asset == MapAssets.names;
          final assetName = seaOrNames ? '${asset.name}_en' : asset.name;
          // final assetName = asset == MapAssets.seas || asset == MapAssets.names? '${asset.name}_en': asset.name;
          final assetColor =
              seaOrNames
                  ? ColorFilter.mode(colorScheme.surfaceTint, BlendMode.srcIn)
                  : null;

          return SvgPicture.asset(
            'assets/svgs/map_assets/$assetName.svg',
            colorFilter: assetColor,
          );
        }),
      ],
    );
  }
}

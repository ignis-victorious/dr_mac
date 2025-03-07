//  ________________________
//  Import LIBRARIES
import 'package:riverpod_annotation/riverpod_annotation.dart';
//  Import FILES
import '../models/enums.dart';
//  PARTS
part 'map_providers.g.dart';
//  PROVIDERS
//  ________________________

//   SelectedMapAssetsProvider
@riverpod
class SelectedMapAssets extends _$SelectedMapAssets {
  @override
  List<MapAssets> build() {
    return <MapAssets>[
      MapAssets.seas,
      MapAssets.coastalLine,
      MapAssets.rivers,
      MapAssets.lakes,
      MapAssets.borders,
      MapAssets.names,
    ];
  }
}

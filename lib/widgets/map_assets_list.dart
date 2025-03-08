//  ________________________
//  Import LIBRARIES
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//  Import FILES
import '../models/enums.dart';
import '../providers/map_providers.dart';
//  PARTS
//  PROVIDERS
//  ________________________

class MapAssetsList extends StatelessWidget {
  const MapAssetsList({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(16),
      width: 300,
      height: 420,
      decoration: BoxDecoration(
        color: Colors.white,
        // color: colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: <Widget>[
          Text(
            'Show',
            style: textTheme.headlineSmall!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Consumer(
              builder: (context, ref, child) {
                final selectedMapAssets = ref.watch(selectedMapAssetsProvider);

                return ListView.builder(
                  itemCount:
                      // selectedMapAssets.length,
                      MapAssets.values.length,
                  itemBuilder: (context, index) {
                    final mapAsset = MapAssets.values[index];
                    // final mapAsset = selectedMapAssets[index];
                    final assetValue = selectedMapAssets.contains(mapAsset);

                    return CheckboxListTile(
                      value: assetValue,
                      title: Text(mapAsset.name),
                      onChanged: (value) {
                        if (value!) {
                          selectedMapAssets.add(mapAsset);
                        } else {
                          selectedMapAssets.remove(mapAsset);
                        }
                        ref
                            .read(selectedMapAssetsProvider.notifier)
                            .update(selectedMapAssets);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),

      // color: Colors.red, child: Text('Map Assets List')
    );
  }
}

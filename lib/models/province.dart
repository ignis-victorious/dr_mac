//  ________________________
//  Import LIBRARIES
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
//  Import FILES
//  PARTS

part 'province.freezed.dart';
part 'province.g.dart';
//  PROVIDERS
//  ________________________

@freezed
abstract class Province with _$Province {
  const factory Province({
    required String name,
    required String code,
    required String identifier,
    required String regionCode,
  }) = _Province;

  factory Province.fromJson(Map<String, Object?> json) =>
      _$ProvinceFromJson(json);
}

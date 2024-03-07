library domain_model;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'test_info.freezed.dart';
part 'test_info.g.dart';

@freezed
class TestInfo with _$TestInfo {
  const factory TestInfo({
    required String testId,
  }) = _TestInfo;

  factory TestInfo.fromJson(Map<String, dynamic> json) =>
      _$TestInfoFromJson(json);
}

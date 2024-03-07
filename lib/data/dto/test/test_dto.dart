library data_dto;

import 'package:one_spoon/domain/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'test_dto.freezed.dart';
part 'test_dto.g.dart';

@freezed
class TestDto with _$TestDto {
  const factory TestDto({
    @JsonKey(name: 'test') required String testId,
  }) = _TestDto;

  factory TestDto.fromJson(Map<String, dynamic> json) =>
      _$TestDtoFromJson(json);
}

extension TestDtoExtension on TestDto {
  TestInfo toDomain() => TestInfo(testId: testId);
}

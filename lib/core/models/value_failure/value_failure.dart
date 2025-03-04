import 'package:freezed_annotation/freezed_annotation.dart';

part 'value_failure.freezed.dart';

@freezed
abstract class ValueFailure with _$ValueFailure {
  const factory ValueFailure.invalidInput(String message) = _InvalidInput;

  // Özel getter örneği

  // String get message => throw UnimplementedError();
}

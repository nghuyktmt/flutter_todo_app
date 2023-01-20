import 'package:freezed_annotation/freezed_annotation.dart';

part 'todoid.freezed.dart';

@freezed
class TodoId with _$TodoId {
  factory TodoId({required int value}) = _TodoId;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todoid.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TodoId {
  int get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoIdCopyWith<TodoId> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoIdCopyWith<$Res> {
  factory $TodoIdCopyWith(TodoId value, $Res Function(TodoId) then) =
      _$TodoIdCopyWithImpl<$Res, TodoId>;
  @useResult
  $Res call({int value});
}

/// @nodoc
class _$TodoIdCopyWithImpl<$Res, $Val extends TodoId>
    implements $TodoIdCopyWith<$Res> {
  _$TodoIdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TodoIdCopyWith<$Res> implements $TodoIdCopyWith<$Res> {
  factory _$$_TodoIdCopyWith(_$_TodoId value, $Res Function(_$_TodoId) then) =
      __$$_TodoIdCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int value});
}

/// @nodoc
class __$$_TodoIdCopyWithImpl<$Res>
    extends _$TodoIdCopyWithImpl<$Res, _$_TodoId>
    implements _$$_TodoIdCopyWith<$Res> {
  __$$_TodoIdCopyWithImpl(_$_TodoId _value, $Res Function(_$_TodoId) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$_TodoId(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_TodoId implements _TodoId {
  _$_TodoId({required this.value});

  @override
  final int value;

  @override
  String toString() {
    return 'TodoId(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TodoId &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TodoIdCopyWith<_$_TodoId> get copyWith =>
      __$$_TodoIdCopyWithImpl<_$_TodoId>(this, _$identity);
}

abstract class _TodoId implements TodoId {
  factory _TodoId({required final int value}) = _$_TodoId;

  @override
  int get value;
  @override
  @JsonKey(ignore: true)
  _$$_TodoIdCopyWith<_$_TodoId> get copyWith =>
      throw _privateConstructorUsedError;
}

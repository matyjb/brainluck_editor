// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bf_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BfState {
  dynamic get locked =>
      throw _privateConstructorUsedError; // -1 means the program halted
  int get ipointer => throw _privateConstructorUsedError;
  String get instructions => throw _privateConstructorUsedError;
  int get dpointer => throw _privateConstructorUsedError;
  List<int> get data => throw _privateConstructorUsedError;
  int get inputPointer => throw _privateConstructorUsedError;
  String get input => throw _privateConstructorUsedError;
  String get output => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BfStateCopyWith<BfState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BfStateCopyWith<$Res> {
  factory $BfStateCopyWith(BfState value, $Res Function(BfState) then) =
      _$BfStateCopyWithImpl<$Res, BfState>;
  @useResult
  $Res call(
      {dynamic locked,
      int ipointer,
      String instructions,
      int dpointer,
      List<int> data,
      int inputPointer,
      String input,
      String output});
}

/// @nodoc
class _$BfStateCopyWithImpl<$Res, $Val extends BfState>
    implements $BfStateCopyWith<$Res> {
  _$BfStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locked = freezed,
    Object? ipointer = null,
    Object? instructions = null,
    Object? dpointer = null,
    Object? data = null,
    Object? inputPointer = null,
    Object? input = null,
    Object? output = null,
  }) {
    return _then(_value.copyWith(
      locked: freezed == locked
          ? _value.locked
          : locked // ignore: cast_nullable_to_non_nullable
              as dynamic,
      ipointer: null == ipointer
          ? _value.ipointer
          : ipointer // ignore: cast_nullable_to_non_nullable
              as int,
      instructions: null == instructions
          ? _value.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as String,
      dpointer: null == dpointer
          ? _value.dpointer
          : dpointer // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<int>,
      inputPointer: null == inputPointer
          ? _value.inputPointer
          : inputPointer // ignore: cast_nullable_to_non_nullable
              as int,
      input: null == input
          ? _value.input
          : input // ignore: cast_nullable_to_non_nullable
              as String,
      output: null == output
          ? _value.output
          : output // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BfStateImplCopyWith<$Res> implements $BfStateCopyWith<$Res> {
  factory _$$BfStateImplCopyWith(
          _$BfStateImpl value, $Res Function(_$BfStateImpl) then) =
      __$$BfStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic locked,
      int ipointer,
      String instructions,
      int dpointer,
      List<int> data,
      int inputPointer,
      String input,
      String output});
}

/// @nodoc
class __$$BfStateImplCopyWithImpl<$Res>
    extends _$BfStateCopyWithImpl<$Res, _$BfStateImpl>
    implements _$$BfStateImplCopyWith<$Res> {
  __$$BfStateImplCopyWithImpl(
      _$BfStateImpl _value, $Res Function(_$BfStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locked = freezed,
    Object? ipointer = null,
    Object? instructions = null,
    Object? dpointer = null,
    Object? data = null,
    Object? inputPointer = null,
    Object? input = null,
    Object? output = null,
  }) {
    return _then(_$BfStateImpl(
      locked: freezed == locked ? _value.locked! : locked,
      ipointer: null == ipointer
          ? _value.ipointer
          : ipointer // ignore: cast_nullable_to_non_nullable
              as int,
      instructions: null == instructions
          ? _value.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as String,
      dpointer: null == dpointer
          ? _value.dpointer
          : dpointer // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<int>,
      inputPointer: null == inputPointer
          ? _value.inputPointer
          : inputPointer // ignore: cast_nullable_to_non_nullable
              as int,
      input: null == input
          ? _value.input
          : input // ignore: cast_nullable_to_non_nullable
              as String,
      output: null == output
          ? _value.output
          : output // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BfStateImpl implements _BfState {
  const _$BfStateImpl(
      {this.locked = false,
      this.ipointer = -1,
      this.instructions = "",
      this.dpointer = 0,
      required final List<int> data,
      this.inputPointer = 0,
      this.input = "",
      this.output = ""})
      : _data = data;

  @override
  @JsonKey()
  final dynamic locked;
// -1 means the program halted
  @override
  @JsonKey()
  final int ipointer;
  @override
  @JsonKey()
  final String instructions;
  @override
  @JsonKey()
  final int dpointer;
  final List<int> _data;
  @override
  List<int> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  @JsonKey()
  final int inputPointer;
  @override
  @JsonKey()
  final String input;
  @override
  @JsonKey()
  final String output;

  @override
  String toString() {
    return 'BfState(locked: $locked, ipointer: $ipointer, instructions: $instructions, dpointer: $dpointer, data: $data, inputPointer: $inputPointer, input: $input, output: $output)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BfStateImpl &&
            const DeepCollectionEquality().equals(other.locked, locked) &&
            (identical(other.ipointer, ipointer) ||
                other.ipointer == ipointer) &&
            (identical(other.instructions, instructions) ||
                other.instructions == instructions) &&
            (identical(other.dpointer, dpointer) ||
                other.dpointer == dpointer) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.inputPointer, inputPointer) ||
                other.inputPointer == inputPointer) &&
            (identical(other.input, input) || other.input == input) &&
            (identical(other.output, output) || other.output == output));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(locked),
      ipointer,
      instructions,
      dpointer,
      const DeepCollectionEquality().hash(_data),
      inputPointer,
      input,
      output);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BfStateImplCopyWith<_$BfStateImpl> get copyWith =>
      __$$BfStateImplCopyWithImpl<_$BfStateImpl>(this, _$identity);
}

abstract class _BfState implements BfState {
  const factory _BfState(
      {final dynamic locked,
      final int ipointer,
      final String instructions,
      final int dpointer,
      required final List<int> data,
      final int inputPointer,
      final String input,
      final String output}) = _$BfStateImpl;

  @override
  dynamic get locked;
  @override // -1 means the program halted
  int get ipointer;
  @override
  String get instructions;
  @override
  int get dpointer;
  @override
  List<int> get data;
  @override
  int get inputPointer;
  @override
  String get input;
  @override
  String get output;
  @override
  @JsonKey(ignore: true)
  _$$BfStateImplCopyWith<_$BfStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

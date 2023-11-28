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
mixin _$BfEditorState {
  String get instructions => throw _privateConstructorUsedError;
  Map<int, int> get data => throw _privateConstructorUsedError;
  String get input => throw _privateConstructorUsedError;
  String get output => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BfEditorStateCopyWith<BfEditorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BfEditorStateCopyWith<$Res> {
  factory $BfEditorStateCopyWith(
          BfEditorState value, $Res Function(BfEditorState) then) =
      _$BfEditorStateCopyWithImpl<$Res, BfEditorState>;
  @useResult
  $Res call(
      {String instructions, Map<int, int> data, String input, String output});
}

/// @nodoc
class _$BfEditorStateCopyWithImpl<$Res, $Val extends BfEditorState>
    implements $BfEditorStateCopyWith<$Res> {
  _$BfEditorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? instructions = null,
    Object? data = null,
    Object? input = null,
    Object? output = null,
  }) {
    return _then(_value.copyWith(
      instructions: null == instructions
          ? _value.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<int, int>,
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
abstract class _$$BfEditorStateImplCopyWith<$Res>
    implements $BfEditorStateCopyWith<$Res> {
  factory _$$BfEditorStateImplCopyWith(
          _$BfEditorStateImpl value, $Res Function(_$BfEditorStateImpl) then) =
      __$$BfEditorStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String instructions, Map<int, int> data, String input, String output});
}

/// @nodoc
class __$$BfEditorStateImplCopyWithImpl<$Res>
    extends _$BfEditorStateCopyWithImpl<$Res, _$BfEditorStateImpl>
    implements _$$BfEditorStateImplCopyWith<$Res> {
  __$$BfEditorStateImplCopyWithImpl(
      _$BfEditorStateImpl _value, $Res Function(_$BfEditorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? instructions = null,
    Object? data = null,
    Object? input = null,
    Object? output = null,
  }) {
    return _then(_$BfEditorStateImpl(
      instructions: null == instructions
          ? _value.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<int, int>,
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

class _$BfEditorStateImpl extends _BfEditorState {
  const _$BfEditorStateImpl(
      {this.instructions = bfHelloWorld,
      required final Map<int, int> data,
      this.input = "",
      this.output = ""})
      : _data = data,
        super._();

  @override
  @JsonKey()
  final String instructions;
  final Map<int, int> _data;
  @override
  Map<int, int> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  @JsonKey()
  final String input;
  @override
  @JsonKey()
  final String output;

  @override
  String toString() {
    return 'BfEditorState(instructions: $instructions, data: $data, input: $input, output: $output)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BfEditorStateImpl &&
            (identical(other.instructions, instructions) ||
                other.instructions == instructions) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.input, input) || other.input == input) &&
            (identical(other.output, output) || other.output == output));
  }

  @override
  int get hashCode => Object.hash(runtimeType, instructions,
      const DeepCollectionEquality().hash(_data), input, output);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BfEditorStateImplCopyWith<_$BfEditorStateImpl> get copyWith =>
      __$$BfEditorStateImplCopyWithImpl<_$BfEditorStateImpl>(this, _$identity);
}

abstract class _BfEditorState extends BfEditorState {
  const factory _BfEditorState(
      {final String instructions,
      required final Map<int, int> data,
      final String input,
      final String output}) = _$BfEditorStateImpl;
  const _BfEditorState._() : super._();

  @override
  String get instructions;
  @override
  Map<int, int> get data;
  @override
  String get input;
  @override
  String get output;
  @override
  @JsonKey(ignore: true)
  _$$BfEditorStateImplCopyWith<_$BfEditorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BfProgramState {
  int get iPointer => throw _privateConstructorUsedError;
  int get dPointer => throw _privateConstructorUsedError;
  int get inputPointer => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BfProgramStateCopyWith<BfProgramState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BfProgramStateCopyWith<$Res> {
  factory $BfProgramStateCopyWith(
          BfProgramState value, $Res Function(BfProgramState) then) =
      _$BfProgramStateCopyWithImpl<$Res, BfProgramState>;
  @useResult
  $Res call({int iPointer, int dPointer, int inputPointer});
}

/// @nodoc
class _$BfProgramStateCopyWithImpl<$Res, $Val extends BfProgramState>
    implements $BfProgramStateCopyWith<$Res> {
  _$BfProgramStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iPointer = null,
    Object? dPointer = null,
    Object? inputPointer = null,
  }) {
    return _then(_value.copyWith(
      iPointer: null == iPointer
          ? _value.iPointer
          : iPointer // ignore: cast_nullable_to_non_nullable
              as int,
      dPointer: null == dPointer
          ? _value.dPointer
          : dPointer // ignore: cast_nullable_to_non_nullable
              as int,
      inputPointer: null == inputPointer
          ? _value.inputPointer
          : inputPointer // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BfProgramStateImplCopyWith<$Res>
    implements $BfProgramStateCopyWith<$Res> {
  factory _$$BfProgramStateImplCopyWith(_$BfProgramStateImpl value,
          $Res Function(_$BfProgramStateImpl) then) =
      __$$BfProgramStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int iPointer, int dPointer, int inputPointer});
}

/// @nodoc
class __$$BfProgramStateImplCopyWithImpl<$Res>
    extends _$BfProgramStateCopyWithImpl<$Res, _$BfProgramStateImpl>
    implements _$$BfProgramStateImplCopyWith<$Res> {
  __$$BfProgramStateImplCopyWithImpl(
      _$BfProgramStateImpl _value, $Res Function(_$BfProgramStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iPointer = null,
    Object? dPointer = null,
    Object? inputPointer = null,
  }) {
    return _then(_$BfProgramStateImpl(
      iPointer: null == iPointer
          ? _value.iPointer
          : iPointer // ignore: cast_nullable_to_non_nullable
              as int,
      dPointer: null == dPointer
          ? _value.dPointer
          : dPointer // ignore: cast_nullable_to_non_nullable
              as int,
      inputPointer: null == inputPointer
          ? _value.inputPointer
          : inputPointer // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$BfProgramStateImpl implements _BfProgramState {
  const _$BfProgramStateImpl(
      {this.iPointer = 0, this.dPointer = 0, this.inputPointer = 0});

  @override
  @JsonKey()
  final int iPointer;
  @override
  @JsonKey()
  final int dPointer;
  @override
  @JsonKey()
  final int inputPointer;

  @override
  String toString() {
    return 'BfProgramState(iPointer: $iPointer, dPointer: $dPointer, inputPointer: $inputPointer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BfProgramStateImpl &&
            (identical(other.iPointer, iPointer) ||
                other.iPointer == iPointer) &&
            (identical(other.dPointer, dPointer) ||
                other.dPointer == dPointer) &&
            (identical(other.inputPointer, inputPointer) ||
                other.inputPointer == inputPointer));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, iPointer, dPointer, inputPointer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BfProgramStateImplCopyWith<_$BfProgramStateImpl> get copyWith =>
      __$$BfProgramStateImplCopyWithImpl<_$BfProgramStateImpl>(
          this, _$identity);
}

abstract class _BfProgramState implements BfProgramState {
  const factory _BfProgramState(
      {final int iPointer,
      final int dPointer,
      final int inputPointer}) = _$BfProgramStateImpl;

  @override
  int get iPointer;
  @override
  int get dPointer;
  @override
  int get inputPointer;
  @override
  @JsonKey(ignore: true)
  _$$BfProgramStateImplCopyWith<_$BfProgramStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BfState {
  BfEditorState get editor => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BfEditorState editor, BfProgramState program)
        running,
    required TResult Function(BfEditorState editor, BfProgramState program)
        paused,
    required TResult Function(BfEditorState editor) stopped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BfEditorState editor, BfProgramState program)? running,
    TResult? Function(BfEditorState editor, BfProgramState program)? paused,
    TResult? Function(BfEditorState editor)? stopped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BfEditorState editor, BfProgramState program)? running,
    TResult Function(BfEditorState editor, BfProgramState program)? paused,
    TResult Function(BfEditorState editor)? stopped,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BfStateRunning value) running,
    required TResult Function(BfStatePaused value) paused,
    required TResult Function(BfStateStopped value) stopped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BfStateRunning value)? running,
    TResult? Function(BfStatePaused value)? paused,
    TResult? Function(BfStateStopped value)? stopped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BfStateRunning value)? running,
    TResult Function(BfStatePaused value)? paused,
    TResult Function(BfStateStopped value)? stopped,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BfStateCopyWith<BfState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BfStateCopyWith<$Res> {
  factory $BfStateCopyWith(BfState value, $Res Function(BfState) then) =
      _$BfStateCopyWithImpl<$Res, BfState>;
  @useResult
  $Res call({BfEditorState editor});

  $BfEditorStateCopyWith<$Res> get editor;
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
    Object? editor = null,
  }) {
    return _then(_value.copyWith(
      editor: null == editor
          ? _value.editor
          : editor // ignore: cast_nullable_to_non_nullable
              as BfEditorState,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BfEditorStateCopyWith<$Res> get editor {
    return $BfEditorStateCopyWith<$Res>(_value.editor, (value) {
      return _then(_value.copyWith(editor: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BfStateRunningImplCopyWith<$Res>
    implements $BfStateCopyWith<$Res> {
  factory _$$BfStateRunningImplCopyWith(_$BfStateRunningImpl value,
          $Res Function(_$BfStateRunningImpl) then) =
      __$$BfStateRunningImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BfEditorState editor, BfProgramState program});

  @override
  $BfEditorStateCopyWith<$Res> get editor;
  $BfProgramStateCopyWith<$Res> get program;
}

/// @nodoc
class __$$BfStateRunningImplCopyWithImpl<$Res>
    extends _$BfStateCopyWithImpl<$Res, _$BfStateRunningImpl>
    implements _$$BfStateRunningImplCopyWith<$Res> {
  __$$BfStateRunningImplCopyWithImpl(
      _$BfStateRunningImpl _value, $Res Function(_$BfStateRunningImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? editor = null,
    Object? program = null,
  }) {
    return _then(_$BfStateRunningImpl(
      editor: null == editor
          ? _value.editor
          : editor // ignore: cast_nullable_to_non_nullable
              as BfEditorState,
      program: null == program
          ? _value.program
          : program // ignore: cast_nullable_to_non_nullable
              as BfProgramState,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $BfProgramStateCopyWith<$Res> get program {
    return $BfProgramStateCopyWith<$Res>(_value.program, (value) {
      return _then(_value.copyWith(program: value));
    });
  }
}

/// @nodoc

class _$BfStateRunningImpl implements BfStateRunning {
  const _$BfStateRunningImpl({required this.editor, required this.program});

  @override
  final BfEditorState editor;
  @override
  final BfProgramState program;

  @override
  String toString() {
    return 'BfState.running(editor: $editor, program: $program)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BfStateRunningImpl &&
            (identical(other.editor, editor) || other.editor == editor) &&
            (identical(other.program, program) || other.program == program));
  }

  @override
  int get hashCode => Object.hash(runtimeType, editor, program);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BfStateRunningImplCopyWith<_$BfStateRunningImpl> get copyWith =>
      __$$BfStateRunningImplCopyWithImpl<_$BfStateRunningImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BfEditorState editor, BfProgramState program)
        running,
    required TResult Function(BfEditorState editor, BfProgramState program)
        paused,
    required TResult Function(BfEditorState editor) stopped,
  }) {
    return running(editor, program);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BfEditorState editor, BfProgramState program)? running,
    TResult? Function(BfEditorState editor, BfProgramState program)? paused,
    TResult? Function(BfEditorState editor)? stopped,
  }) {
    return running?.call(editor, program);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BfEditorState editor, BfProgramState program)? running,
    TResult Function(BfEditorState editor, BfProgramState program)? paused,
    TResult Function(BfEditorState editor)? stopped,
    required TResult orElse(),
  }) {
    if (running != null) {
      return running(editor, program);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BfStateRunning value) running,
    required TResult Function(BfStatePaused value) paused,
    required TResult Function(BfStateStopped value) stopped,
  }) {
    return running(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BfStateRunning value)? running,
    TResult? Function(BfStatePaused value)? paused,
    TResult? Function(BfStateStopped value)? stopped,
  }) {
    return running?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BfStateRunning value)? running,
    TResult Function(BfStatePaused value)? paused,
    TResult Function(BfStateStopped value)? stopped,
    required TResult orElse(),
  }) {
    if (running != null) {
      return running(this);
    }
    return orElse();
  }
}

abstract class BfStateRunning implements BfState {
  const factory BfStateRunning(
      {required final BfEditorState editor,
      required final BfProgramState program}) = _$BfStateRunningImpl;

  @override
  BfEditorState get editor;
  BfProgramState get program;
  @override
  @JsonKey(ignore: true)
  _$$BfStateRunningImplCopyWith<_$BfStateRunningImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BfStatePausedImplCopyWith<$Res>
    implements $BfStateCopyWith<$Res> {
  factory _$$BfStatePausedImplCopyWith(
          _$BfStatePausedImpl value, $Res Function(_$BfStatePausedImpl) then) =
      __$$BfStatePausedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BfEditorState editor, BfProgramState program});

  @override
  $BfEditorStateCopyWith<$Res> get editor;
  $BfProgramStateCopyWith<$Res> get program;
}

/// @nodoc
class __$$BfStatePausedImplCopyWithImpl<$Res>
    extends _$BfStateCopyWithImpl<$Res, _$BfStatePausedImpl>
    implements _$$BfStatePausedImplCopyWith<$Res> {
  __$$BfStatePausedImplCopyWithImpl(
      _$BfStatePausedImpl _value, $Res Function(_$BfStatePausedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? editor = null,
    Object? program = null,
  }) {
    return _then(_$BfStatePausedImpl(
      editor: null == editor
          ? _value.editor
          : editor // ignore: cast_nullable_to_non_nullable
              as BfEditorState,
      program: null == program
          ? _value.program
          : program // ignore: cast_nullable_to_non_nullable
              as BfProgramState,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $BfProgramStateCopyWith<$Res> get program {
    return $BfProgramStateCopyWith<$Res>(_value.program, (value) {
      return _then(_value.copyWith(program: value));
    });
  }
}

/// @nodoc

class _$BfStatePausedImpl implements BfStatePaused {
  const _$BfStatePausedImpl({required this.editor, required this.program});

  @override
  final BfEditorState editor;
  @override
  final BfProgramState program;

  @override
  String toString() {
    return 'BfState.paused(editor: $editor, program: $program)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BfStatePausedImpl &&
            (identical(other.editor, editor) || other.editor == editor) &&
            (identical(other.program, program) || other.program == program));
  }

  @override
  int get hashCode => Object.hash(runtimeType, editor, program);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BfStatePausedImplCopyWith<_$BfStatePausedImpl> get copyWith =>
      __$$BfStatePausedImplCopyWithImpl<_$BfStatePausedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BfEditorState editor, BfProgramState program)
        running,
    required TResult Function(BfEditorState editor, BfProgramState program)
        paused,
    required TResult Function(BfEditorState editor) stopped,
  }) {
    return paused(editor, program);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BfEditorState editor, BfProgramState program)? running,
    TResult? Function(BfEditorState editor, BfProgramState program)? paused,
    TResult? Function(BfEditorState editor)? stopped,
  }) {
    return paused?.call(editor, program);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BfEditorState editor, BfProgramState program)? running,
    TResult Function(BfEditorState editor, BfProgramState program)? paused,
    TResult Function(BfEditorState editor)? stopped,
    required TResult orElse(),
  }) {
    if (paused != null) {
      return paused(editor, program);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BfStateRunning value) running,
    required TResult Function(BfStatePaused value) paused,
    required TResult Function(BfStateStopped value) stopped,
  }) {
    return paused(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BfStateRunning value)? running,
    TResult? Function(BfStatePaused value)? paused,
    TResult? Function(BfStateStopped value)? stopped,
  }) {
    return paused?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BfStateRunning value)? running,
    TResult Function(BfStatePaused value)? paused,
    TResult Function(BfStateStopped value)? stopped,
    required TResult orElse(),
  }) {
    if (paused != null) {
      return paused(this);
    }
    return orElse();
  }
}

abstract class BfStatePaused implements BfState {
  const factory BfStatePaused(
      {required final BfEditorState editor,
      required final BfProgramState program}) = _$BfStatePausedImpl;

  @override
  BfEditorState get editor;
  BfProgramState get program;
  @override
  @JsonKey(ignore: true)
  _$$BfStatePausedImplCopyWith<_$BfStatePausedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BfStateStoppedImplCopyWith<$Res>
    implements $BfStateCopyWith<$Res> {
  factory _$$BfStateStoppedImplCopyWith(_$BfStateStoppedImpl value,
          $Res Function(_$BfStateStoppedImpl) then) =
      __$$BfStateStoppedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BfEditorState editor});

  @override
  $BfEditorStateCopyWith<$Res> get editor;
}

/// @nodoc
class __$$BfStateStoppedImplCopyWithImpl<$Res>
    extends _$BfStateCopyWithImpl<$Res, _$BfStateStoppedImpl>
    implements _$$BfStateStoppedImplCopyWith<$Res> {
  __$$BfStateStoppedImplCopyWithImpl(
      _$BfStateStoppedImpl _value, $Res Function(_$BfStateStoppedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? editor = null,
  }) {
    return _then(_$BfStateStoppedImpl(
      editor: null == editor
          ? _value.editor
          : editor // ignore: cast_nullable_to_non_nullable
              as BfEditorState,
    ));
  }
}

/// @nodoc

class _$BfStateStoppedImpl implements BfStateStopped {
  const _$BfStateStoppedImpl({required this.editor});

  @override
  final BfEditorState editor;

  @override
  String toString() {
    return 'BfState.stopped(editor: $editor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BfStateStoppedImpl &&
            (identical(other.editor, editor) || other.editor == editor));
  }

  @override
  int get hashCode => Object.hash(runtimeType, editor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BfStateStoppedImplCopyWith<_$BfStateStoppedImpl> get copyWith =>
      __$$BfStateStoppedImplCopyWithImpl<_$BfStateStoppedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BfEditorState editor, BfProgramState program)
        running,
    required TResult Function(BfEditorState editor, BfProgramState program)
        paused,
    required TResult Function(BfEditorState editor) stopped,
  }) {
    return stopped(editor);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BfEditorState editor, BfProgramState program)? running,
    TResult? Function(BfEditorState editor, BfProgramState program)? paused,
    TResult? Function(BfEditorState editor)? stopped,
  }) {
    return stopped?.call(editor);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BfEditorState editor, BfProgramState program)? running,
    TResult Function(BfEditorState editor, BfProgramState program)? paused,
    TResult Function(BfEditorState editor)? stopped,
    required TResult orElse(),
  }) {
    if (stopped != null) {
      return stopped(editor);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BfStateRunning value) running,
    required TResult Function(BfStatePaused value) paused,
    required TResult Function(BfStateStopped value) stopped,
  }) {
    return stopped(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BfStateRunning value)? running,
    TResult? Function(BfStatePaused value)? paused,
    TResult? Function(BfStateStopped value)? stopped,
  }) {
    return stopped?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BfStateRunning value)? running,
    TResult Function(BfStatePaused value)? paused,
    TResult Function(BfStateStopped value)? stopped,
    required TResult orElse(),
  }) {
    if (stopped != null) {
      return stopped(this);
    }
    return orElse();
  }
}

abstract class BfStateStopped implements BfState {
  const factory BfStateStopped({required final BfEditorState editor}) =
      _$BfStateStoppedImpl;

  @override
  BfEditorState get editor;
  @override
  @JsonKey(ignore: true)
  _$$BfStateStoppedImplCopyWith<_$BfStateStoppedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

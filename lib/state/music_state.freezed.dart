// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'music_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MusicStateTearOff {
  const _$MusicStateTearOff();

  _MusicState call(
      {List<Music> musicList = const [],
      ProgressBarState progressBarState = const ProgressBarState(
          current: Duration.zero,
          buffered: Duration.zero,
          total: Duration.zero),
      String musicTitle = "",
      bool isPlaying = false}) {
    return _MusicState(
      musicList: musicList,
      progressBarState: progressBarState,
      musicTitle: musicTitle,
      isPlaying: isPlaying,
    );
  }
}

/// @nodoc
const $MusicState = _$MusicStateTearOff();

/// @nodoc
mixin _$MusicState {
  List<Music> get musicList => throw _privateConstructorUsedError;
  ProgressBarState get progressBarState => throw _privateConstructorUsedError;
  String get musicTitle => throw _privateConstructorUsedError;
  bool get isPlaying => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MusicStateCopyWith<MusicState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MusicStateCopyWith<$Res> {
  factory $MusicStateCopyWith(
          MusicState value, $Res Function(MusicState) then) =
      _$MusicStateCopyWithImpl<$Res>;
  $Res call(
      {List<Music> musicList,
      ProgressBarState progressBarState,
      String musicTitle,
      bool isPlaying});

  $ProgressBarStateCopyWith<$Res> get progressBarState;
}

/// @nodoc
class _$MusicStateCopyWithImpl<$Res> implements $MusicStateCopyWith<$Res> {
  _$MusicStateCopyWithImpl(this._value, this._then);

  final MusicState _value;
  // ignore: unused_field
  final $Res Function(MusicState) _then;

  @override
  $Res call({
    Object? musicList = freezed,
    Object? progressBarState = freezed,
    Object? musicTitle = freezed,
    Object? isPlaying = freezed,
  }) {
    return _then(_value.copyWith(
      musicList: musicList == freezed
          ? _value.musicList
          : musicList // ignore: cast_nullable_to_non_nullable
              as List<Music>,
      progressBarState: progressBarState == freezed
          ? _value.progressBarState
          : progressBarState // ignore: cast_nullable_to_non_nullable
              as ProgressBarState,
      musicTitle: musicTitle == freezed
          ? _value.musicTitle
          : musicTitle // ignore: cast_nullable_to_non_nullable
              as String,
      isPlaying: isPlaying == freezed
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $ProgressBarStateCopyWith<$Res> get progressBarState {
    return $ProgressBarStateCopyWith<$Res>(_value.progressBarState, (value) {
      return _then(_value.copyWith(progressBarState: value));
    });
  }
}

/// @nodoc
abstract class _$MusicStateCopyWith<$Res> implements $MusicStateCopyWith<$Res> {
  factory _$MusicStateCopyWith(
          _MusicState value, $Res Function(_MusicState) then) =
      __$MusicStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<Music> musicList,
      ProgressBarState progressBarState,
      String musicTitle,
      bool isPlaying});

  @override
  $ProgressBarStateCopyWith<$Res> get progressBarState;
}

/// @nodoc
class __$MusicStateCopyWithImpl<$Res> extends _$MusicStateCopyWithImpl<$Res>
    implements _$MusicStateCopyWith<$Res> {
  __$MusicStateCopyWithImpl(
      _MusicState _value, $Res Function(_MusicState) _then)
      : super(_value, (v) => _then(v as _MusicState));

  @override
  _MusicState get _value => super._value as _MusicState;

  @override
  $Res call({
    Object? musicList = freezed,
    Object? progressBarState = freezed,
    Object? musicTitle = freezed,
    Object? isPlaying = freezed,
  }) {
    return _then(_MusicState(
      musicList: musicList == freezed
          ? _value.musicList
          : musicList // ignore: cast_nullable_to_non_nullable
              as List<Music>,
      progressBarState: progressBarState == freezed
          ? _value.progressBarState
          : progressBarState // ignore: cast_nullable_to_non_nullable
              as ProgressBarState,
      musicTitle: musicTitle == freezed
          ? _value.musicTitle
          : musicTitle // ignore: cast_nullable_to_non_nullable
              as String,
      isPlaying: isPlaying == freezed
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_MusicState implements _MusicState {
  const _$_MusicState(
      {this.musicList = const [],
      this.progressBarState = const ProgressBarState(
          current: Duration.zero,
          buffered: Duration.zero,
          total: Duration.zero),
      this.musicTitle = "",
      this.isPlaying = false});

  @JsonKey()
  @override
  final List<Music> musicList;
  @JsonKey()
  @override
  final ProgressBarState progressBarState;
  @JsonKey()
  @override
  final String musicTitle;
  @JsonKey()
  @override
  final bool isPlaying;

  @override
  String toString() {
    return 'MusicState(musicList: $musicList, progressBarState: $progressBarState, musicTitle: $musicTitle, isPlaying: $isPlaying)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MusicState &&
            const DeepCollectionEquality().equals(other.musicList, musicList) &&
            const DeepCollectionEquality()
                .equals(other.progressBarState, progressBarState) &&
            const DeepCollectionEquality()
                .equals(other.musicTitle, musicTitle) &&
            const DeepCollectionEquality().equals(other.isPlaying, isPlaying));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(musicList),
      const DeepCollectionEquality().hash(progressBarState),
      const DeepCollectionEquality().hash(musicTitle),
      const DeepCollectionEquality().hash(isPlaying));

  @JsonKey(ignore: true)
  @override
  _$MusicStateCopyWith<_MusicState> get copyWith =>
      __$MusicStateCopyWithImpl<_MusicState>(this, _$identity);
}

abstract class _MusicState implements MusicState {
  const factory _MusicState(
      {List<Music> musicList,
      ProgressBarState progressBarState,
      String musicTitle,
      bool isPlaying}) = _$_MusicState;

  @override
  List<Music> get musicList;
  @override
  ProgressBarState get progressBarState;
  @override
  String get musicTitle;
  @override
  bool get isPlaying;
  @override
  @JsonKey(ignore: true)
  _$MusicStateCopyWith<_MusicState> get copyWith =>
      throw _privateConstructorUsedError;
}

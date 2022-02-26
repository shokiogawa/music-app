// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'video_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$VideoStateTearOff {
  const _$VideoStateTearOff();

  _VideoState call({List<Video> videoList = const []}) {
    return _VideoState(
      videoList: videoList,
    );
  }
}

/// @nodoc
const $VideoState = _$VideoStateTearOff();

/// @nodoc
mixin _$VideoState {
  List<Video> get videoList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VideoStateCopyWith<VideoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoStateCopyWith<$Res> {
  factory $VideoStateCopyWith(
          VideoState value, $Res Function(VideoState) then) =
      _$VideoStateCopyWithImpl<$Res>;
  $Res call({List<Video> videoList});
}

/// @nodoc
class _$VideoStateCopyWithImpl<$Res> implements $VideoStateCopyWith<$Res> {
  _$VideoStateCopyWithImpl(this._value, this._then);

  final VideoState _value;
  // ignore: unused_field
  final $Res Function(VideoState) _then;

  @override
  $Res call({
    Object? videoList = freezed,
  }) {
    return _then(_value.copyWith(
      videoList: videoList == freezed
          ? _value.videoList
          : videoList // ignore: cast_nullable_to_non_nullable
              as List<Video>,
    ));
  }
}

/// @nodoc
abstract class _$VideoStateCopyWith<$Res> implements $VideoStateCopyWith<$Res> {
  factory _$VideoStateCopyWith(
          _VideoState value, $Res Function(_VideoState) then) =
      __$VideoStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Video> videoList});
}

/// @nodoc
class __$VideoStateCopyWithImpl<$Res> extends _$VideoStateCopyWithImpl<$Res>
    implements _$VideoStateCopyWith<$Res> {
  __$VideoStateCopyWithImpl(
      _VideoState _value, $Res Function(_VideoState) _then)
      : super(_value, (v) => _then(v as _VideoState));

  @override
  _VideoState get _value => super._value as _VideoState;

  @override
  $Res call({
    Object? videoList = freezed,
  }) {
    return _then(_VideoState(
      videoList: videoList == freezed
          ? _value.videoList
          : videoList // ignore: cast_nullable_to_non_nullable
              as List<Video>,
    ));
  }
}

/// @nodoc

class _$_VideoState implements _VideoState {
  const _$_VideoState({this.videoList = const []});

  @JsonKey()
  @override
  final List<Video> videoList;

  @override
  String toString() {
    return 'VideoState(videoList: $videoList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VideoState &&
            const DeepCollectionEquality().equals(other.videoList, videoList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(videoList));

  @JsonKey(ignore: true)
  @override
  _$VideoStateCopyWith<_VideoState> get copyWith =>
      __$VideoStateCopyWithImpl<_VideoState>(this, _$identity);
}

abstract class _VideoState implements VideoState {
  const factory _VideoState({List<Video> videoList}) = _$_VideoState;

  @override
  List<Video> get videoList;
  @override
  @JsonKey(ignore: true)
  _$VideoStateCopyWith<_VideoState> get copyWith =>
      throw _privateConstructorUsedError;
}

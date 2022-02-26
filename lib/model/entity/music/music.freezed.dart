// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'music.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Music _$MusicFromJson(Map<String, dynamic> json) {
  return _Music.fromJson(json);
}

/// @nodoc
class _$MusicTearOff {
  const _$MusicTearOff();

  _Music call(
      {required String title, required String author, required String image}) {
    return _Music(
      title: title,
      author: author,
      image: image,
    );
  }

  Music fromJson(Map<String, Object?> json) {
    return Music.fromJson(json);
  }
}

/// @nodoc
const $Music = _$MusicTearOff();

/// @nodoc
mixin _$Music {
  String get title => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MusicCopyWith<Music> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MusicCopyWith<$Res> {
  factory $MusicCopyWith(Music value, $Res Function(Music) then) =
      _$MusicCopyWithImpl<$Res>;
  $Res call({String title, String author, String image});
}

/// @nodoc
class _$MusicCopyWithImpl<$Res> implements $MusicCopyWith<$Res> {
  _$MusicCopyWithImpl(this._value, this._then);

  final Music _value;
  // ignore: unused_field
  final $Res Function(Music) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? author = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$MusicCopyWith<$Res> implements $MusicCopyWith<$Res> {
  factory _$MusicCopyWith(_Music value, $Res Function(_Music) then) =
      __$MusicCopyWithImpl<$Res>;
  @override
  $Res call({String title, String author, String image});
}

/// @nodoc
class __$MusicCopyWithImpl<$Res> extends _$MusicCopyWithImpl<$Res>
    implements _$MusicCopyWith<$Res> {
  __$MusicCopyWithImpl(_Music _value, $Res Function(_Music) _then)
      : super(_value, (v) => _then(v as _Music));

  @override
  _Music get _value => super._value as _Music;

  @override
  $Res call({
    Object? title = freezed,
    Object? author = freezed,
    Object? image = freezed,
  }) {
    return _then(_Music(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Music with DiagnosticableTreeMixin implements _Music {
  const _$_Music(
      {required this.title, required this.author, required this.image});

  factory _$_Music.fromJson(Map<String, dynamic> json) =>
      _$$_MusicFromJson(json);

  @override
  final String title;
  @override
  final String author;
  @override
  final String image;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Music(title: $title, author: $author, image: $image)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Music'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('author', author))
      ..add(DiagnosticsProperty('image', image));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Music &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.author, author) &&
            const DeepCollectionEquality().equals(other.image, image));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(author),
      const DeepCollectionEquality().hash(image));

  @JsonKey(ignore: true)
  @override
  _$MusicCopyWith<_Music> get copyWith =>
      __$MusicCopyWithImpl<_Music>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MusicToJson(this);
  }
}

abstract class _Music implements Music {
  const factory _Music(
      {required String title,
      required String author,
      required String image}) = _$_Music;

  factory _Music.fromJson(Map<String, dynamic> json) = _$_Music.fromJson;

  @override
  String get title;
  @override
  String get author;
  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$MusicCopyWith<_Music> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$ProgressBarStateTearOff {
  const _$ProgressBarStateTearOff();

  _ProgressBarState call(
      {required Duration current,
      required Duration buffered,
      required Duration total}) {
    return _ProgressBarState(
      current: current,
      buffered: buffered,
      total: total,
    );
  }
}

/// @nodoc
const $ProgressBarState = _$ProgressBarStateTearOff();

/// @nodoc
mixin _$ProgressBarState {
  Duration get current => throw _privateConstructorUsedError;
  Duration get buffered => throw _privateConstructorUsedError;
  Duration get total => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProgressBarStateCopyWith<ProgressBarState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgressBarStateCopyWith<$Res> {
  factory $ProgressBarStateCopyWith(
          ProgressBarState value, $Res Function(ProgressBarState) then) =
      _$ProgressBarStateCopyWithImpl<$Res>;
  $Res call({Duration current, Duration buffered, Duration total});
}

/// @nodoc
class _$ProgressBarStateCopyWithImpl<$Res>
    implements $ProgressBarStateCopyWith<$Res> {
  _$ProgressBarStateCopyWithImpl(this._value, this._then);

  final ProgressBarState _value;
  // ignore: unused_field
  final $Res Function(ProgressBarState) _then;

  @override
  $Res call({
    Object? current = freezed,
    Object? buffered = freezed,
    Object? total = freezed,
  }) {
    return _then(_value.copyWith(
      current: current == freezed
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as Duration,
      buffered: buffered == freezed
          ? _value.buffered
          : buffered // ignore: cast_nullable_to_non_nullable
              as Duration,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc
abstract class _$ProgressBarStateCopyWith<$Res>
    implements $ProgressBarStateCopyWith<$Res> {
  factory _$ProgressBarStateCopyWith(
          _ProgressBarState value, $Res Function(_ProgressBarState) then) =
      __$ProgressBarStateCopyWithImpl<$Res>;
  @override
  $Res call({Duration current, Duration buffered, Duration total});
}

/// @nodoc
class __$ProgressBarStateCopyWithImpl<$Res>
    extends _$ProgressBarStateCopyWithImpl<$Res>
    implements _$ProgressBarStateCopyWith<$Res> {
  __$ProgressBarStateCopyWithImpl(
      _ProgressBarState _value, $Res Function(_ProgressBarState) _then)
      : super(_value, (v) => _then(v as _ProgressBarState));

  @override
  _ProgressBarState get _value => super._value as _ProgressBarState;

  @override
  $Res call({
    Object? current = freezed,
    Object? buffered = freezed,
    Object? total = freezed,
  }) {
    return _then(_ProgressBarState(
      current: current == freezed
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as Duration,
      buffered: buffered == freezed
          ? _value.buffered
          : buffered // ignore: cast_nullable_to_non_nullable
              as Duration,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc

class _$_ProgressBarState
    with DiagnosticableTreeMixin
    implements _ProgressBarState {
  const _$_ProgressBarState(
      {required this.current, required this.buffered, required this.total});

  @override
  final Duration current;
  @override
  final Duration buffered;
  @override
  final Duration total;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProgressBarState(current: $current, buffered: $buffered, total: $total)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProgressBarState'))
      ..add(DiagnosticsProperty('current', current))
      ..add(DiagnosticsProperty('buffered', buffered))
      ..add(DiagnosticsProperty('total', total));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProgressBarState &&
            const DeepCollectionEquality().equals(other.current, current) &&
            const DeepCollectionEquality().equals(other.buffered, buffered) &&
            const DeepCollectionEquality().equals(other.total, total));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(current),
      const DeepCollectionEquality().hash(buffered),
      const DeepCollectionEquality().hash(total));

  @JsonKey(ignore: true)
  @override
  _$ProgressBarStateCopyWith<_ProgressBarState> get copyWith =>
      __$ProgressBarStateCopyWithImpl<_ProgressBarState>(this, _$identity);
}

abstract class _ProgressBarState implements ProgressBarState {
  const factory _ProgressBarState(
      {required Duration current,
      required Duration buffered,
      required Duration total}) = _$_ProgressBarState;

  @override
  Duration get current;
  @override
  Duration get buffered;
  @override
  Duration get total;
  @override
  @JsonKey(ignore: true)
  _$ProgressBarStateCopyWith<_ProgressBarState> get copyWith =>
      throw _privateConstructorUsedError;
}

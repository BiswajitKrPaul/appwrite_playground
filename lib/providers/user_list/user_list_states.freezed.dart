// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_list_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UserListStatesTearOff {
  const _$UserListStatesTearOff();

  _UserListStates call(
      {int total = 0,
      List<User> users = const [],
      dynamic status = UserListDataState.initial,
      dynamic selectedPos = 0}) {
    return _UserListStates(
      total: total,
      users: users,
      status: status,
      selectedPos: selectedPos,
    );
  }
}

/// @nodoc
const $UserListStates = _$UserListStatesTearOff();

/// @nodoc
mixin _$UserListStates {
  int get total => throw _privateConstructorUsedError;
  List<User> get users => throw _privateConstructorUsedError;
  dynamic get status => throw _privateConstructorUsedError;
  dynamic get selectedPos => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserListStatesCopyWith<UserListStates> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserListStatesCopyWith<$Res> {
  factory $UserListStatesCopyWith(
          UserListStates value, $Res Function(UserListStates) then) =
      _$UserListStatesCopyWithImpl<$Res>;
  $Res call({int total, List<User> users, dynamic status, dynamic selectedPos});
}

/// @nodoc
class _$UserListStatesCopyWithImpl<$Res>
    implements $UserListStatesCopyWith<$Res> {
  _$UserListStatesCopyWithImpl(this._value, this._then);

  final UserListStates _value;
  // ignore: unused_field
  final $Res Function(UserListStates) _then;

  @override
  $Res call({
    Object? total = freezed,
    Object? users = freezed,
    Object? status = freezed,
    Object? selectedPos = freezed,
  }) {
    return _then(_value.copyWith(
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      users: users == freezed
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as dynamic,
      selectedPos: selectedPos == freezed
          ? _value.selectedPos
          : selectedPos // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$UserListStatesCopyWith<$Res>
    implements $UserListStatesCopyWith<$Res> {
  factory _$UserListStatesCopyWith(
          _UserListStates value, $Res Function(_UserListStates) then) =
      __$UserListStatesCopyWithImpl<$Res>;
  @override
  $Res call({int total, List<User> users, dynamic status, dynamic selectedPos});
}

/// @nodoc
class __$UserListStatesCopyWithImpl<$Res>
    extends _$UserListStatesCopyWithImpl<$Res>
    implements _$UserListStatesCopyWith<$Res> {
  __$UserListStatesCopyWithImpl(
      _UserListStates _value, $Res Function(_UserListStates) _then)
      : super(_value, (v) => _then(v as _UserListStates));

  @override
  _UserListStates get _value => super._value as _UserListStates;

  @override
  $Res call({
    Object? total = freezed,
    Object? users = freezed,
    Object? status = freezed,
    Object? selectedPos = freezed,
  }) {
    return _then(_UserListStates(
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      users: users == freezed
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>,
      status: status == freezed ? _value.status : status,
      selectedPos: selectedPos == freezed ? _value.selectedPos : selectedPos,
    ));
  }
}

/// @nodoc

class _$_UserListStates implements _UserListStates {
  const _$_UserListStates(
      {this.total = 0,
      this.users = const [],
      this.status = UserListDataState.initial,
      this.selectedPos = 0});

  @JsonKey()
  @override
  final int total;
  @JsonKey()
  @override
  final List<User> users;
  @JsonKey()
  @override
  final dynamic status;
  @JsonKey()
  @override
  final dynamic selectedPos;

  @override
  String toString() {
    return 'UserListStates(total: $total, users: $users, status: $status, selectedPos: $selectedPos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserListStates &&
            const DeepCollectionEquality().equals(other.total, total) &&
            const DeepCollectionEquality().equals(other.users, users) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.selectedPos, selectedPos));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(total),
      const DeepCollectionEquality().hash(users),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(selectedPos));

  @JsonKey(ignore: true)
  @override
  _$UserListStatesCopyWith<_UserListStates> get copyWith =>
      __$UserListStatesCopyWithImpl<_UserListStates>(this, _$identity);
}

abstract class _UserListStates implements UserListStates {
  const factory _UserListStates(
      {int total,
      List<User> users,
      dynamic status,
      dynamic selectedPos}) = _$_UserListStates;

  @override
  int get total;
  @override
  List<User> get users;
  @override
  dynamic get status;
  @override
  dynamic get selectedPos;
  @override
  @JsonKey(ignore: true)
  _$UserListStatesCopyWith<_UserListStates> get copyWith =>
      throw _privateConstructorUsedError;
}

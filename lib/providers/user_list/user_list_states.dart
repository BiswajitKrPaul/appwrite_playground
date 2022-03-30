import 'package:appwrite/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_list_states.freezed.dart';

enum UserListDataState { initial, loaded, error }

@freezed
class UserListStates with _$UserListStates {
  const factory UserListStates({
    @Default(0) int total,
    @Default([]) List<User> users,
    @Default(UserListDataState.initial) status,
    @Default(0) selectedPos,
  }) = _UserListStates;

  factory UserListStates.initial() => const UserListStates(
        status: UserListDataState.initial,
        total: 0,
        users: [],
        selectedPos: 0,
      );
}

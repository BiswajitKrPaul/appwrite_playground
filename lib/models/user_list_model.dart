import 'dart:convert';

import 'package:appwrite/models.dart';
import 'package:equatable/equatable.dart';

class UserList extends Equatable {
  final int total;
  final List<User> users;

  const UserList(this.total, this.users);

  @override
  List<Object?> get props => [total, users];

  Map<String, dynamic> toMap() {
    return {
      'total': total,
      'users': users.map((x) => x.toMap()).toList(),
    };
  }

  factory UserList.fromMap(Map<String, dynamic> map) {
    return UserList(
      map['total'] as int,
      List<User>.from(
        (json.decode(map['users'] as String) as List<dynamic>).map(
          (x) => User.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserList.fromJson(String source) =>
      UserList.fromMap(json.decode(source) as Map<String, dynamic>);
}

import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:appwrite_playground/providers/appwrite_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppwriteLoginStates extends StateNotifier<LoginState> {
  final Reader read;
  AppwriteLoginStates({required this.read}) : super(LoginState());

  Future<void> login() async {
    try {
      final response = await read(appwriteAccountProvider)
          .createOAuth2Session(provider: 'google');
      state = LoginState(response: response);
    } on AppwriteException catch (err) {
      log(err.message!);
      throw Exception(err.message);
    }
  }

  Future<void> getLoggedInUser() async {
    try {
      final User user = await read(appwriteAccountProvider).get();
      log(user.toMap().toString());
    } on AppwriteException catch (e) {
      log(e.message ?? 'Unknown Error');
    }
  }
}

class LoginState {
  dynamic response;
  LoginState({this.response});
}

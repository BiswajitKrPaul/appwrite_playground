import 'package:appwrite/appwrite.dart';
import 'package:appwrite_playground/providers/states/appwrite_login_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _appwriteClientProvider = Provider<Client>(
  (ref) {
    return Client()
      ..setEndpoint('https://api.biswajitappwrite.site/v1')
      ..setProject('623f0b0e3a551cc6d2a6');
  },
);

final appwriteAccountProvider = Provider<Account>(
  (ref) {
    return Account(ref.read(_appwriteClientProvider));
  },
);

final appwriteCreateOAuthLoginProvider =
    StateNotifierProvider<AppwriteLoginStates, LoginState>(
  (ref) {
    return AppwriteLoginStates(read: ref.read);
  },
);

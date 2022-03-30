import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:appwrite_playground/providers/login_states/appwrite_login_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appwriteClientProvider = Provider<Client>(
  (ref) {
    return Client()
      ..setEndpoint('https://api.biswajitappwrite.site/v1')
      ..setProject('623f0b0e3a551cc6d2a6');
  },
);

final appwriteUserProvider = Provider<User?>(
  (ref) {
    return null;
  },
);

final appwriteAccountProvider = Provider<Account>(
  (ref) {
    return Account(ref.read(appwriteClientProvider));
  },
);

final appwriteDatabaseProvider = Provider<Database>((ref) {
  return Database(ref.read(appwriteClientProvider));
});

final appwriteCreateOAuthLoginProvider =
    StateNotifierProvider<AppwriteLoginStates, LoginState>(
  (ref) {
    return AppwriteLoginStates(read: ref.read);
  },
);

final appwriteRealTimeProvider = Provider<Realtime>((ref) {
  return Realtime(ref.read(appwriteClientProvider));
});

final appwriteFuntionProvider = Provider<Functions>((ref) {
  return Functions(ref.read(appwriteClientProvider));
});

import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite_playground/models/user_list_model.dart';
import 'package:appwrite_playground/providers/appwrite_providers.dart';
import 'package:appwrite_playground/providers/user_list/user_list_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getUserListProvider =
    StateNotifierProvider.autoDispose<UserListNotifier, UserListStates>((ref) {
  return UserListNotifier(ref.read);
});

class UserListNotifier extends StateNotifier<UserListStates> {
  Reader read;
  UserListNotifier(this.read) : super(UserListStates.initial());

  Future<void> getUserList() async {
    final currentUserId = read(appwriteUserProvider)?.$id;
    state = state.copyWith(status: UserListDataState.initial);
    try {
      final response = await read(appwriteFuntionProvider).createExecution(
        functionId: '62445e3db1c1743662e0',
        xasync: false,
      );
      final UserList userList = UserList.fromJson(response.stdout);
      state = state.copyWith(
        users: userList.users
            .where((element) => element.$id != currentUserId)
            .toList(),
        status: UserListDataState.loaded,
        total: userList.total - 1,
      );
    } on AppwriteException catch (e) {
      log(e.message!);
      state = state.copyWith(status: UserListDataState.error);
    }
  }

  void setSelectedPos(int pos) {
    state = state.copyWith(selectedPos: pos);
  }

  Future<String> createChannelId(
    String reciverUserId,
    String senderUserId,
  ) async {
    try {
      final documentList = await read(appwriteDatabaseProvider).listDocuments(
        collectionId: '62445a04d6f8ae245c01',
        queries: [
          Query.equal(
            'user1',
            ['$reciverUserId,$senderUserId'],
          ),
          Query.equal(
            'user2',
            ['$reciverUserId,$senderUserId'],
          )
        ],
      );

      if (documentList.total == 0) {
        final channelId = await read(appwriteDatabaseProvider).createDocument(
          collectionId: '62445a04d6f8ae245c01',
          documentId: 'unique()',
          data: {
            'user1': reciverUserId,
            'user2': senderUserId,
          },
        );
        log(channelId.$id);
        return channelId.$id;
      } else {
        log(documentList.documents.first.$id);
        return documentList.documents.first.$id;
      }
    } on AppwriteException catch (e) {
      log(e.message ?? '');
      return '';
    }
  }
}

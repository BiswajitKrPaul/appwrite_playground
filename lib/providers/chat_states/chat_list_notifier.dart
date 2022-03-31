import 'dart:async';
import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:appwrite_playground/models/chat_list_model.dart';
import 'package:appwrite_playground/providers/appwrite_providers.dart';
import 'package:appwrite_playground/providers/user_list/user_list_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatListNotifier extends StateNotifier<AsyncValue<List<ChatListModel>>> {
  Reader read;
  late StreamSubscription _streamSubscription;
  ChatListNotifier(this.read) : super(const AsyncValue.loading()) {
    getChat();
    _streamSubscription = read(appwriteRealTimeProvider)
        .subscribe(['collections.62448a485b356d41c990.documents'])
        .stream
        .listen((event) {
          if (event.event == 'database.documents.create') {
            final document = Document.fromMap(event.payload);
            if (document.data['channelId'] == '624489bc416f81a14196') {
              final List<ChatListModel> chat = state.value!;
              chat.insert(
                0,
                ChatListModel.fromMap(document.data),
              );
              state = AsyncValue.data(chat);
            }
          }
        });
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }

  Future<void> sendText(String text) async {
    try {
      await read(appwriteDatabaseProvider).createDocument(
        collectionId: '62448a485b356d41c990',
        documentId: 'unique()',
        data: {
          'channelId': '624489bc416f81a14196',
          'recieverId': read(getUserListProvider)
              .users[read(getUserListProvider).selectedPos as int]
              .$id,
          'senderId': read(appwriteUserProvider)!.$id,
          'message': text,
        },
      );
    } on AppwriteException catch (e) {
      log(e.message ?? 'Error');
    }
  }

  Future<void> getChat() async {
    try {
      state = const AsyncValue.loading();
      final chatList = await read(appwriteDatabaseProvider).listDocuments(
        collectionId: '62448a485b356d41c990',
        queries: [Query.equal('channelId', '624489bc416f81a14196')],
        orderTypes: ['DESC'],
      );
      state = AsyncValue.data(
        List<ChatListModel>.from(
          chatList.documents.map((e) => ChatListModel.fromMap(e.data)).toList(),
        ),
      );
    } on AppwriteException catch (e) {
      log(e.message ?? '');
      state = AsyncValue.error(e.message ?? 'Error');
    }
  }
}

final getChatListProvider = StateNotifierProvider.autoDispose<ChatListNotifier,
    AsyncValue<List<ChatListModel>>>(
  (ref) {
    return ChatListNotifier(ref.read);
  },
);

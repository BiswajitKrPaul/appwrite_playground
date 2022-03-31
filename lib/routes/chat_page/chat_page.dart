import 'package:appwrite_playground/providers/chat_states/chat_list_notifier.dart';
import 'package:appwrite_playground/providers/user_list/user_list_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final buttonProvider = StateProvider<Color>((ref) {
  return Colors.grey;
});

class ChatListPage extends ConsumerWidget {
  static const routeName = '/chatPage';
  ChatListPage({Key? key}) : super(key: key);

  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatList = ref.watch(getChatListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        child: Column(
          children: [
            Expanded(
              child: chatList.map(
                data: (data) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 4,
                    ),
                    child: ListView.separated(
                      shrinkWrap: true,
                      primary: false,
                      physics: const ClampingScrollPhysics(),
                      reverse: true,
                      itemBuilder: (context, index) {
                        if (ref
                                .read(getUserListProvider)
                                .users[ref.read(getUserListProvider).selectedPos
                                    as int]
                                .$id ==
                            data.value[index].senderId) {
                          return ChatBubble(
                            elevation: 0,
                            margin: const EdgeInsets.all(4),
                            clipper: ChatBubbleClipper1(
                              type: BubbleType.receiverBubble,
                            ),
                            backGroundColor: Colors.blueAccent.withOpacity(0.3),
                            child: Text(
                              data.value[index].message,
                              style: const TextStyle(color: Colors.black),
                            ),
                          );
                        } else {
                          return ChatBubble(
                            elevation: 0,
                            margin: const EdgeInsets.all(4),
                            alignment: Alignment.centerRight,
                            clipper: ChatBubbleClipper1(
                              type: BubbleType.sendBubble,
                            ),
                            backGroundColor: Colors.blueAccent,
                            child: Text(
                              data.value[index].message,
                              style: const TextStyle(color: Colors.white),
                            ),
                          );
                        }
                      },
                      itemCount: data.value.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(
                        height: 8,
                      ),
                    ),
                  );
                },
                error: (err) => Center(
                  child: Text(err.error.toString()),
                ),
                loading: (_) =>
                    const Center(child: CircularProgressIndicator()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SafeArea(
                child: Row(
                  children: [
                    Expanded(
                      flex: 8,
                      child: Focus(
                        onFocusChange: (hasFocus) {
                          if (hasFocus) {
                            ref.read(buttonProvider.notifier).state =
                                Colors.blueAccent;
                          } else {
                            ref.read(buttonProvider.notifier).state =
                                Colors.grey;
                          }
                        },
                        child: TextField(
                          focusNode: _focusNode,
                          controller: _textEditingController,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            border: OutlineInputBorder(),
                          ),
                          onSubmitted: (data) {
                            if (data.isNotEmpty) {
                              ref.read(getChatListProvider.notifier).sendText(
                                    _textEditingController.value.text,
                                  );
                              _textEditingController.clear();
                            }
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () {
                          if (_textEditingController.value.text.isNotEmpty) {
                            ref
                                .read(getChatListProvider.notifier)
                                .sendText(_textEditingController.value.text);
                            _textEditingController.clear();
                          }
                        },
                        icon: Icon(
                          Icons.send,
                          color: ref.watch(buttonProvider),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
